using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

namespace OnlineOrderingSystem.Customer_Module
{
    public partial class MealAddToWishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string customerID = Session["CustomerID"] + "";
            string itemID = Request.QueryString["ItemID"];

            int wishlistExist = checkWishlist(customerID, itemID);

            if (wishlistExist == 1)
            {
                removeWishlist(customerID, itemID);

                Response.Write("<script language='javascript'>window.alert('Item Removed from Wishlist');window.location='Meal.aspx';</script>");
            }
            else
            {
                insertWishlist(customerID, itemID);

                Response.Write("<script language='javascript'>window.alert('Item Added to Wishlist!');window.location='Meal.aspx';</script>");
            }

            //Response.Redirect("Meal.aspx");
        }

        protected int checkWishlist(string customerID, string itemID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "SELECT * FROM [Wishlist] WHERE CustomerID = @CustomerID AND ItemID = @ItemID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@CustomerID", customerID);
            command.Parameters.AddWithValue("@ItemID", itemID);

            SqlDataReader dataReader = command.ExecuteReader();

            if (dataReader.HasRows)
            {
                //con.Close();

                return 1;
            }
            else
            {
                return 0;
            }
        }

        protected void insertWishlist(string customerID, string itemID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "INSERT INTO Wishlist(CustomerID, ItemID, DateAdded, TimeAdded) VALUES (@CustomerID, @ItemID, @DateAdded, @TimeAdded)";

            SqlCommand command = new SqlCommand(queryStr, con);

            string currentDate = DateTime.Now.ToString("MM/dd/yyyy");
            string currentTime = DateTime.Now.ToString("HH:mm:ss");

            command.Parameters.AddWithValue("@CustomerID", Session["CustomerID"]);
            command.Parameters.AddWithValue("@ItemID", itemID);
            command.Parameters.AddWithValue("@DateAdded", currentDate);
            command.Parameters.AddWithValue("@TimeAdded", currentTime);

            command.ExecuteScalar();

            //con.Close();
        }

        protected void removeWishlist(string customerID, string itemID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "DELETE FROM Wishlist WHERE CustomerID = @CustomerID AND ItemID = @ItemID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@CustomerID", Session["CustomerID"]);
            command.Parameters.AddWithValue("@ItemID", itemID);

            command.ExecuteScalar();

            //con.Close();
        }
    }
}