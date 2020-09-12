using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

namespace OnlineOrderingSystem.Customer_Module
{
    public partial class IllustrationAddToCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string customerID = Session["CustomerID"] + "";
            string artID = Request.QueryString["ArtID"];

            SqlDataReader noOfStockReader = selectArt(artID);

            int noOfStock = 0;

            while (noOfStockReader.Read())
            {
                noOfStock = Convert.ToInt32(noOfStockReader["NoOfStock"]);
            }

            int cartQuantity = checkCart(customerID, artID);

            int balance = noOfStock - cartQuantity;

            if (balance > 0)
            {
                SqlDataReader artReader = selectArt(artID);

                int cartItemExist = checkCart(customerID, artID);

                if (cartItemExist != 0)
                {
                    int quantity = cartItemExist + 1;

                    double price = 0;

                    while (artReader.Read())
                    {
                        price = Convert.ToDouble(artReader["Price"]);
                    }

                    double total = price * quantity;

                    updateArt(customerID, artID, quantity + "", total + "");
                }
                else
                {
                    insertArt(customerID, artID, artReader);
                }

                Response.Write("<script language='javascript'>window.alert('Art Successfully Added to Cart!');window.location='IllustrationArt.aspx';</script>");
            }
            else
            {
                Response.Write("<script language='javascript'>window.alert('ERROR! Art Stock Not Enough!');window.location='IllustrationArt.aspx';</script>");
            }
        }

        protected int checkCart(string customerID, string artID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "SELECT * FROM [Cart] WHERE CustomerID = @CustomerID AND ArtID = @ArtID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@CustomerID", customerID);
            command.Parameters.AddWithValue("@ArtID", artID);

            SqlDataReader dataReader = command.ExecuteReader();

            int qty = 0;

            while (dataReader.Read())
            {
                //con.Close();

                qty = (int)dataReader["Quantity"];
            }

            return qty;
        }

        protected SqlDataReader selectArt(string artID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "SELECT * FROM [Art] WHERE ArtID = @ArtID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@ArtID", artID);

            SqlDataReader dataReader = command.ExecuteReader();

            //con.Close();

            return dataReader;
        }

        protected void insertArt(string customerID, string artID, SqlDataReader dataReader)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "INSERT INTO Cart(CustomerID, ArtID, Art_Name, Price, Quantity, Image) VALUES (@CustomerID, @ArtID, @Art_Name, @Price, 1, @Image)";

            SqlCommand command = new SqlCommand(queryStr, con);

            while (dataReader.Read())
            {
                command.Parameters.AddWithValue("@CustomerID", Session["CustomerID"]);
                command.Parameters.AddWithValue("@ArtID", artID);
                command.Parameters.AddWithValue("@Art_Name", dataReader["Art_Name"]);
                command.Parameters.AddWithValue("@Price", dataReader["Price"]);
                command.Parameters.AddWithValue("@Quantity", 1);
                //command.Parameters.AddWithValue("@Total", dataReader["Price"]);
                command.Parameters.AddWithValue("@Image", dataReader["Image"]);
            }

            command.ExecuteScalar();

            //con.Close();
        }

        protected void updateArt(string customerID, string artID, string quantity, string total)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "UPDATE Cart SET Quantity = @Quantity WHERE CustomerID = @CustomerID AND ArtID = @ArtID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@Quantity", quantity);
            //command.Parameters.AddWithValue("@Total", total);
            command.Parameters.AddWithValue("@CustomerID", Session["CustomerID"]);
            command.Parameters.AddWithValue("@ArtID", artID);

            command.ExecuteScalar();

            //con.Close();
        }

        protected int selectStock(string artID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "SELECT * FROM [Art] WHERE ArtID = @ArtID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@ArtID", artID);

            SqlDataReader dataReader = command.ExecuteReader();

            //con.Close();

            int stock = 0;

            while (dataReader.Read())
            {
                stock = Convert.ToInt32(dataReader["NoOfStock"]);
            }

            return stock;
        }

        protected void updateStock(int noOfStock, string artID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "UPDATE Art SET NoOfStock = @NoOfStock WHERE ArtID = @ArtID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@NoOfStock", noOfStock);
            command.Parameters.AddWithValue("@ArtID", artID);

            command.ExecuteScalar();

            //con.Close();
        }
    }
}