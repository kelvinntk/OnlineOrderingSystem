using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

namespace CustomerModule.Customer_Module
{
    public partial class IllustrationArt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string checkWishlist(string artID)
        {
            string customerID = Session["CustomerID"] + "";

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

                return "Remove from Wishlist";
            }
            else
            {
                return "Add to Wishlist";
            }
        }
    }
}