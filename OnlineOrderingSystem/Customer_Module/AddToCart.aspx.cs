using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

namespace CustomerModule.Customer_Module
{
    public partial class AddToCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string customerID = Session["CustomerID"] + "";
            string itemID = Request.QueryString["ItemID"];

            SqlDataReader noOfStockReader = selectArt(itemID);

            int noOfStock = 0;

            while (noOfStockReader.Read())
            {
                noOfStock = Convert.ToInt32(noOfStockReader["NoOfStock"]);
            }

            int cartQuantity = checkCart(customerID, itemID);

            int balance = noOfStock - cartQuantity;

            if (balance > 0)
            {
                SqlDataReader artReader = selectArt(itemID);

                int cartItemExist = checkCart(customerID, itemID);

                if (cartItemExist != 0)
                {
                    int quantity = cartItemExist + 1;

                    double price = 0;

                    while (artReader.Read())
                    {
                        price = Convert.ToDouble(artReader["Price"]);
                    }

                    double total = price * quantity;

                    updateArt(customerID, itemID, quantity + "", total + "");
                }
                else
                {
                    insertArt(customerID, itemID, artReader);
                }

                Response.Write("<script language='javascript'>window.alert('Item Successfully Added to Cart!');window.location='OnlineOrderingSystem.aspx';</script>");
            }
            else
            {
                Response.Write("<script language='javascript'>window.alert('ERROR! Item Stock Not Enough!');window.location='OnlineOrderingSystem.aspx';</script>");
            }
        }

        protected int checkCart(string customerID, string itemID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "SELECT * FROM [Cart] WHERE CustomerID = @CustomerID AND ItemID = @ItemID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@CustomerID", customerID);
            command.Parameters.AddWithValue("@ItemID", itemID);

            SqlDataReader dataReader = command.ExecuteReader();

            int qty = 0;

            while (dataReader.Read())
            {
                //con.Close();

                qty = (int) dataReader["Quantity"];
            }

            return qty;
        }

        protected SqlDataReader selectArt(string itemID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();
            
            string queryStr = "SELECT * FROM [Item] WHERE ItemID = @ItemID";

            SqlCommand command = new SqlCommand(queryStr, con);
            
            command.Parameters.AddWithValue("@ItemID", itemID);

            SqlDataReader dataReader = command.ExecuteReader();
            
            //con.Close();

            return dataReader;
        }

        protected void insertArt(string customerID, string itemID, SqlDataReader dataReader)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");
            
            con.Open();

            string queryStr = "INSERT INTO Cart(CustomerID, ItemID, Item_Name, Price, Quantity, Image) VALUES (@CustomerID, @ItemID, @Item_Name, @Price, 1, @Image)";

            SqlCommand command = new SqlCommand(queryStr, con);
            
            while (dataReader.Read())
            {
                command.Parameters.AddWithValue("@CustomerID", Session["CustomerID"]);
                command.Parameters.AddWithValue("@ItemID", itemID);
                command.Parameters.AddWithValue("@Item_Name", dataReader["Item_Name"]);
                command.Parameters.AddWithValue("@Price", dataReader["Price"]);
                command.Parameters.AddWithValue("@Quantity", 1);
                //command.Parameters.AddWithValue("@Total", dataReader["Price"]);
                command.Parameters.AddWithValue("@Image", dataReader["Image"]);
            }
            
            command.ExecuteScalar();
            
            //con.Close();
        }

        protected void updateArt(string customerID, string itemID, string quantity, string total)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "UPDATE Cart SET Quantity = @Quantity WHERE CustomerID = @CustomerID AND ItemID = @ItemID";

            SqlCommand command = new SqlCommand(queryStr, con);
            
            command.Parameters.AddWithValue("@Quantity", quantity);
            //command.Parameters.AddWithValue("@Total", total);
            command.Parameters.AddWithValue("@CustomerID", Session["CustomerID"]);
            command.Parameters.AddWithValue("@ItemID", itemID);

            command.ExecuteScalar();

            //con.Close();
        }

        protected int selectStock(string itemID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "SELECT * FROM [Item] WHERE ItemID = @ItemID";

            SqlCommand command = new SqlCommand(queryStr, con);
            
            command.Parameters.AddWithValue("@ItemID", itemID);

            SqlDataReader dataReader = command.ExecuteReader();

            //con.Close();

            int stock = 0;

            while (dataReader.Read())
            {
                stock = Convert.ToInt32(dataReader["NoOfStock"]);
            }

            return stock;
        }

        protected void updateStock(int noOfStock, string itemID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "UPDATE Item SET NoOfStock = @NoOfStock WHERE ItemID = @ItemID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@NoOfStock", noOfStock);
            command.Parameters.AddWithValue("@ItemID", itemID);

            command.ExecuteScalar();

            //con.Close();
        }
    }
}