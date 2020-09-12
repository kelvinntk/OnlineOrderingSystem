using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using OnlineOrderingSystem.registerModel;
using System.IO;

namespace ArtModule
{
    public partial class addArt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            HyperLink1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string date = DateTime.Now.Day.ToString() + "/" + DateTime.Now.Month.ToString() + "/" + DateTime.Now.Year.ToString() + "";
            DateTime date1 = Convert.ToDateTime(date);
            string time = DateTime.Now.Hour.ToString() + ":" + DateTime.Now.Minute.ToString() + ":" + DateTime.Now.Second.ToString() + "";

            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string imgfile = Path.GetFileName(postedFile.FileName);
            string fileExten = Path.GetExtension(imgfile);
            int fileSize = postedFile.ContentLength;
            var maxFileSize = 10485760;

            try
            {
                if (fileExten.ToLower() == ".jpeg" || fileExten.ToLower() == ".jpg" || fileExten.ToLower() == ".png" ||
                fileExten.ToLower() == ".gif" || fileExten.ToLower() == ".psd")
                {
                    if (fileSize <= maxFileSize)
                    {
                        Stream strm = postedFile.InputStream;
                        BinaryReader binaryReader = new BinaryReader(strm);
                        byte[] bytes = binaryReader.ReadBytes((int)strm.Length);

                        decimal price = Convert.ToDecimal(PriceTextBox.Text);
                        int qty = Convert.ToInt32(NoOfStockTextBox.Text);

                        string cs = ConfigurationManager.ConnectionStrings["UIMAGE"].ConnectionString;
                        using (SqlConnection conn = new SqlConnection(cs))
                        {
                            SqlCommand cmd = new SqlCommand("UploadImage", conn);
                            cmd.CommandType = CommandType.StoredProcedure;

                            SqlParameter paramArtistID = new SqlParameter()
                            {
                                ParameterName = "@ArtistID",
                                Value = Session["UserID"] + ""
                            };
                            cmd.Parameters.Add(paramArtistID);

                            SqlParameter paramArtName = new SqlParameter()
                            {
                                ParameterName = "@Art_Name",
                                Value = Art_NameTextBox.Text
                            };
                            cmd.Parameters.Add(paramArtName);

                            SqlParameter paramDesc = new SqlParameter()
                            {
                                ParameterName = "@Description",
                                Value = DescriptionTextBox.Text
                            };
                            cmd.Parameters.Add(paramDesc);

                            SqlParameter paramCateg = new SqlParameter()
                            {
                                ParameterName = "@Category",
                                Value = DropDownList1.SelectedValue
                            };
                            cmd.Parameters.Add(paramCateg);

                            SqlParameter paramPrice = new SqlParameter()
                            {
                                ParameterName = "@Price",
                                Value = price
                            };
                            cmd.Parameters.Add(paramPrice);

                            SqlParameter paramQty = new SqlParameter()
                            {
                                ParameterName = "@NoOfStock",
                                Value = qty
                            };
                            cmd.Parameters.Add(paramQty);

                            SqlParameter paramUpDate = new SqlParameter()
                            {
                                ParameterName = "@DateUploaded",
                                Value = date1
                            };
                            cmd.Parameters.Add(paramUpDate);

                            SqlParameter paramUpTime = new SqlParameter()
                            {
                                ParameterName = "@TimeUploaded",
                                Value = time
                            };
                            cmd.Parameters.Add(paramUpTime);

                            SqlParameter paramImage = new SqlParameter()
                            {
                                ParameterName = "@Image",
                                Value = bytes
                            };
                            cmd.Parameters.Add(paramImage);

                            SqlParameter paramStatus = new SqlParameter()
                            {
                                ParameterName = "@Status",
                                Value = DropDownList2.SelectedValue
                            };
                            cmd.Parameters.Add(paramStatus);

                            SqlParameter paramArtID = new SqlParameter()
                            {
                                ParameterName = "@ArtID",
                                Value = -1,
                                Direction = ParameterDirection.Output
                            };
                            cmd.Parameters.Add(paramArtID);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();

                            Label1.Visible = true;
                            Label1.Text = "New Art added.";
                            Label1.ForeColor = System.Drawing.Color.Green;
                            HyperLink1.Visible = true;
                        }
                    }

                }
                else
                {
                    Label1.Visible = true;
                    Label1.Text = "Only image (.png, .jpeg, .jpg, .gif and .psd) can be uploaded.";
                    Label1.ForeColor = System.Drawing.Color.Red;
                    HyperLink1.Visible = false;
                }
            }
            catch (BadImageFormatException exx)
            {
                Response.Write(exx);
            }
            catch (FormatException ex)
            {
                Response.Write(ex);
            }
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/artistHome.aspx");
        }
    }
}