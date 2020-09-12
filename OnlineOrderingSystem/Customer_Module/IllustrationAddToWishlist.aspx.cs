using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

namespace OnlineOrderingSystem.Customer_Module
{
    public partial class IllustrationAddToWishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string customerID = Session["CustomerID"] + "";
            string artID = Request.QueryString["ArtID"];

            int wishlistExist = checkWishlist(customerID, artID);

            if (wishlistExist == 1)
            {
                removeWishlist(customerID, artID);

                Response.Write("<script language='javascript'>window.alert('Art Removed from Wishlist');window.location='IllustrationArt.aspx';</script>");
            }
            else
            {
                insertWishlist(customerID, artID);

                Response.Write("<script language='javascript'>window.alert('Art Added to Wishlist!');window.location='IllustrationArt.aspx';</script>");
            }

            //Response.Redirect("IllustrationArt.aspx");
        }

        protected int checkWishlist(string customerID, string artID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "SELECT * FROM [Wishlist] WHERE CustomerID = @CustomerID AND ArtID = @ArtID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@CustomerID", customerID);
            command.Parameters.AddWithValue("@ArtID", artID);

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

        protected void insertWishlist(string customerID, string artID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "INSERT INTO Wishlist(CustomerID, ArtID, DateAdded, TimeAdded) VALUES (@CustomerID, @ArtID, @DateAdded, @TimeAdded)";

            SqlCommand command = new SqlCommand(queryStr, con);

            string currentDate = DateTime.Now.ToString("MM/dd/yyyy");
            string currentTime = DateTime.Now.ToString("HH:mm:ss");

            command.Parameters.AddWithValue("@CustomerID", Session["CustomerID"]);
            command.Parameters.AddWithValue("@ArtID", artID);
            command.Parameters.AddWithValue("@DateAdded", currentDate);
            command.Parameters.AddWithValue("@TimeAdded", currentTime);

            command.ExecuteScalar();

            //con.Close();
        }

        protected void removeWishlist(string customerID, string artID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "DELETE FROM Wishlist WHERE CustomerID = @CustomerID AND ArtID = @ArtID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@CustomerID", Session["CustomerID"]);
            command.Parameters.AddWithValue("@ArtID", artID);

            command.ExecuteScalar();

            //con.Close();
        }
    }
}