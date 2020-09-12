using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;

namespace CustomerModule.Customer_Module
{
    public partial class CreateArt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection connection = null;
            try
            {
                FileUpload img = (FileUpload)imgUpload;
                Byte[] imgByte = null;

                if (img.HasFile && img.PostedFile != null)
                {
                    //To create a PostedFile
                    HttpPostedFile File = imgUpload.PostedFile;
                    //Create byte Array with file len
                    imgByte = new Byte[File.ContentLength];
                    //force the control to load data in array
                    File.InputStream.Read(imgByte, 0, File.ContentLength);
                }
                // Insert the employee name and image into db
                string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                connection = new SqlConnection(conn);

                string currentDate = DateTime.Now.ToString("dd/MM/yyyy");
                string currentTime = DateTime.Now.ToString("HH:mm:ss");

                connection.Open();

                string sql = "INSERT INTO Art(ArtistID, Art_Name, Description, Category, Price, NoOfStock, DateUploaded, TimeUploaded, Image, Status) VALUES(@ArtistID, @Art_Name, @Description, @Category, @Price, @NoOfStock, @DateUploaded, @TimeUploaded, @Image, @Status) SELECT @@IDENTITY";

                SqlCommand cmd = new SqlCommand(sql, connection);

                cmd.Parameters.AddWithValue("@ArtistID", "1001");

                cmd.Parameters.AddWithValue("@Art_Name", ArtNameTextB.Text.Trim());
                cmd.Parameters.AddWithValue("@Description", DescriptionTextB.Text.Trim());
                cmd.Parameters.AddWithValue("@Category", DropDownList1.Text.Trim());
                cmd.Parameters.AddWithValue("@Price", PriceTextB.Text.Trim());
                cmd.Parameters.AddWithValue("@NoOfStock", NoOfStockTextB.Text.Trim());

                cmd.Parameters.AddWithValue("@DateUploaded", currentDate);
                cmd.Parameters.AddWithValue("@TimeUploaded", currentTime);

                cmd.Parameters.AddWithValue("@Image", imgByte);
                //int id = Convert.ToInt32(cmd.ExecuteScalar());

                cmd.Parameters.AddWithValue("@Status", "AVAILABLE");

                cmd.ExecuteScalar();
            }
            catch
            {
                
            }
            finally
            {
                connection.Close();
            }

        }
    }
}