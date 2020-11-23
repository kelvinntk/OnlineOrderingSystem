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

namespace OnlineOrderingSystem.staffModule
{
    public partial class modifyItem : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label1.Visible = false;
                HyperLink1.Visible = false;

                if (Request.QueryString["View"] == "vsuccess" && Request.QueryString["Id"] != null && Request.QueryString["StaffID"] != null)
                {
                    string id = Request.QueryString["Id"].ToString();
                    ItemIDTextBox.Text = id;
                    string staffID = Request.QueryString["StaffID"].ToString();
                    StaffIDTextBox.Text = staffID;

                    dll2.Visible = false;

                    string cs = ConfigurationManager.ConnectionStrings["UIMAGE"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(cs))
                    {
                        SqlCommand cmd = new SqlCommand("SelectData", conn);
                        cmd.CommandType = CommandType.StoredProcedure;

                        SqlParameter paramItemID = new SqlParameter()
                        {
                            ParameterName = "@ItemID",
                            Value = id
                        };
                        cmd.Parameters.Add(paramItemID);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        SqlDataReader dr = cmd.ExecuteReader();
                        dr.Read();
                        if (dr.HasRows)
                        {
                            Item_NameTextBox.Text = dr.GetValue(0).ToString();
                            DescriptionTextBox.Text = dr.GetValue(1).ToString();
                            CategoryLabel.Text = dr.GetValue(2).ToString();
                            PriceTextBox.Text = dr.GetValue(3).ToString();
                            NoOfStockTextBox.Text = dr.GetValue(4).ToString();
                            DateUploadedTextBox.Text = string.Format("{0:d}", dr.GetValue(5));
                            TimeUploadedTextBox.Text = dr.GetValue(6).ToString();
                            if ((dr.GetValue(7).ToString()).Equals("AVAILABLE"))
                            {
                                StatusLabel.Text = dr.GetValue(7).ToString();
                                StatusLabel.ForeColor = System.Drawing.Color.Green;
                                StatusLabel.Font.Bold = true;
                            }
                            else if ((dr.GetValue(7).ToString()).Equals("UNAVAILABLE"))
                            {
                                StatusLabel.Text = dr.GetValue(7).ToString();
                                StatusLabel.ForeColor = System.Drawing.Color.Red;
                                StatusLabel.Font.Bold = true;
                            }
                        }
                        conn.Close();
                    }
                }
                else if (Request.QueryString["View"] == "dsuccess" && Request.QueryString["Id"] != null && Request.QueryString["StaffID"] != null)
                {
                    DeleteButton.Visible = false;
                    UpdateButton.Text = "Restore";
                    string id = Request.QueryString["Id"].ToString();
                    ItemIDTextBox.Text = id;
                    string staffID = Request.QueryString["StaffID"].ToString();
                    StaffIDTextBox.Text = staffID;

                    Item_NameTextBox.Enabled = false;
                    DescriptionTextBox.Enabled = false;
                    CategoryLabel.Enabled = false;
                    PriceTextBox.Enabled = false;
                    NoOfStockTextBox.Enabled = false;
                    DateUploadedTextBox.Enabled = false;
                    TimeUploadedTextBox.Enabled = false;
                    uploadRow.Visible = false;
                    DropDownList1.Visible = false;

                    string cs = ConfigurationManager.ConnectionStrings["UIMAGE"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(cs))
                    {
                        SqlCommand cmd = new SqlCommand("SelectData", conn);
                        cmd.CommandType = CommandType.StoredProcedure;

                        SqlParameter paramItemID = new SqlParameter()
                        {
                            ParameterName = "@ItemID",
                            Value = id
                        };
                        cmd.Parameters.Add(paramItemID);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        SqlDataReader dr = cmd.ExecuteReader();
                        dr.Read();
                        if (dr.HasRows)
                        {
                            Item_NameTextBox.Text = dr.GetValue(0).ToString();
                            DescriptionTextBox.Text = dr.GetValue(1).ToString();
                            CategoryLabel.Text = dr.GetValue(2).ToString();
                            PriceTextBox.Text = dr.GetValue(3).ToString();
                            NoOfStockTextBox.Text = dr.GetValue(4).ToString();
                            DateUploadedTextBox.Text = string.Format("{0:d}", dr.GetValue(5));
                            TimeUploadedTextBox.Text = dr.GetValue(6).ToString();
                            if ((dr.GetValue(7).ToString()).Equals("AVAILABLE"))
                            {
                                StatusLabel.Text = dr.GetValue(7).ToString();
                                StatusLabel.ForeColor = System.Drawing.Color.Green;
                                StatusLabel.Font.Bold = true;
                            }
                            else if ((dr.GetValue(7).ToString()).Equals("UNAVAILABLE"))
                            {
                                StatusLabel.Text = dr.GetValue(7).ToString();
                                StatusLabel.ForeColor = System.Drawing.Color.Red;
                                StatusLabel.Font.Bold = true;
                            }
                        }
                        conn.Close();
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e) //Update Button
        {
            decimal price = Convert.ToDecimal(PriceTextBox.Text);
            int qty = Convert.ToInt32(NoOfStockTextBox.Text);
            int staffID = Convert.ToInt32(StaffIDTextBox.Text);
            int itemID = Convert.ToInt32(ItemIDTextBox.Text);
            string date = DateTime.Now.Day.ToString() + "/" + DateTime.Now.Month.ToString() + "/" + DateTime.Now.Year.ToString() + "";
            DateTime date1 = Convert.ToDateTime(date);
            string time = DateTime.Now.Hour.ToString() + ":" + DateTime.Now.Minute.ToString() + ":" + DateTime.Now.Second.ToString() + "";
            if (DropDownList2.SelectedValue == "-1")
            {
                DropDownList2.SelectedValue = StatusLabel.Text;
            }
            if (DropDownList1.SelectedValue == "-1")
            {
                DropDownList1.SelectedValue = CategoryLabel.Text;
            }
            if (!FileUpload1.HasFile)
            {
                try
                {
                    string cs = ConfigurationManager.ConnectionStrings["UIMAGE"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(cs))
                    {
                        SqlCommand cmd = new SqlCommand("UpdateArt", conn);
                        cmd.CommandType = CommandType.StoredProcedure;

                        SqlParameter paramStaffID = new SqlParameter()
                        {
                            ParameterName = "@StaffID",
                            Value = staffID
                        };
                        cmd.Parameters.Add(paramStaffID);

                        SqlParameter paramItemName = new SqlParameter()
                        {
                            ParameterName = "@Item_Name",
                            Value = Item_NameTextBox.Text
                        };
                        cmd.Parameters.Add(paramItemName);

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

                        SqlParameter paramStatus = new SqlParameter()
                        {
                            ParameterName = "@Status",
                            Value = DropDownList2.SelectedValue
                        };
                        cmd.Parameters.Add(paramStatus);

                        SqlParameter paramItemID = new SqlParameter()
                        {
                            ParameterName = "@ItemID",
                            Value = itemID
                        };
                        cmd.Parameters.Add(paramItemID);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        Label1.Visible = true;
                        Label1.Text = "Item updated without update the image.";
                        Label1.ForeColor = System.Drawing.Color.Green;
                        HyperLink1.Visible = true;
                    }
                }
                catch (ArgumentNullException ex)
                {
                    Response.Write(ex);
                }
            }
            else if (FileUpload1.HasFile)
            {
                HttpPostedFile postedFile = FileUpload1.PostedFile;
                string imgfile = Path.GetFileName(postedFile.FileName);
                string fileExten = Path.GetExtension(imgfile);
                int fileSize = postedFile.ContentLength;

                try
                {
                    if (fileExten.ToLower() == ".jpeg" || fileExten.ToLower() == ".jpg" || fileExten.ToLower() == ".png" ||
                    fileExten.ToLower() == ".gif" || fileExten.ToLower() == ".psd")
                    {
                        Stream strm = postedFile.InputStream;
                        BinaryReader binaryReader = new BinaryReader(strm);
                        byte[] bytes = binaryReader.ReadBytes((int)strm.Length);

                        string cs = ConfigurationManager.ConnectionStrings["UIMAGE"].ConnectionString;
                        using (SqlConnection conn = new SqlConnection(cs))
                        {
                            SqlCommand cmd = new SqlCommand("UpdateImage", conn);
                            cmd.CommandType = CommandType.StoredProcedure;

                            SqlParameter paramStaffID = new SqlParameter()
                            {
                                ParameterName = "@StaffID",
                                Value = staffID
                            };
                            cmd.Parameters.Add(paramStaffID);

                            SqlParameter paramItemName = new SqlParameter()
                            {
                                ParameterName = "@Item_Name",
                                Value = Item_NameTextBox.Text
                            };
                            cmd.Parameters.Add(paramItemName);

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

                            SqlParameter paramItemID = new SqlParameter()
                            {
                                ParameterName = "@ItemID",
                                Value = itemID
                            };
                            cmd.Parameters.Add(paramItemID);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();

                            Label1.Visible = true;
                            Label1.Text = "Item updated with image.";
                            Label1.ForeColor = System.Drawing.Color.Green;
                            HyperLink1.Visible = true;
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
                catch (FormatException b)
                {
                    Response.Write(b);
                }
                
            }
        }

        protected void Button2_Click(object sender, EventArgs e) //cancel button
        {
            Response.Redirect("~/staffModule/viewItem.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e) //delete button
        {
            string id = Request.QueryString["Id"].ToString();
            string artiestID = Request.QueryString["StaffID"].ToString();

            string cs = ConfigurationManager.ConnectionStrings["UIMAGE"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DeleteImage", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramStatus = new SqlParameter()
                {
                    ParameterName = "@Status",
                    Value = "UNAVAILABLE"
                };
                cmd.Parameters.Add(paramStatus);

                SqlParameter paramItemID = new SqlParameter()
                {
                    ParameterName = "@ItemID",
                    Value = id
                };
                cmd.Parameters.Add(paramItemID);

                SqlParameter paramStaffID = new SqlParameter()
                {
                    ParameterName = "@StaffID",
                    Value = artiestID
                };
                cmd.Parameters.Add(paramStaffID);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            Label1.Visible = true;
            Label1.Text = "Item Deleted.";
            Label1.ForeColor = System.Drawing.Color.Red;
            HyperLink1.Visible = true;
        }
    }
}