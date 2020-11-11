using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace adminModel.adminModel
{
    public partial class updateStaff : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True"); SqlCommand cmd = null;
        SqlDataReader rdr = null;
        String id, FN, LN, Contact, Address, Status = "";


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                    String email = "";
                    conn.Open();
                    id = Session["adstaffid"].ToString();

                    if (id.Equals(""))
                    {
                        Response.Redirect("adminHome.aspx");
                    }

                    cmd = new SqlCommand("select * from Staff where StaffID=" + id + ";", conn);

                    rdr = cmd.ExecuteReader();

                    if (rdr.HasRows)
                    {
                        rdr.Read();
                        email = Convert.ToString(rdr.GetValue(1));
                        FN = Convert.ToString(rdr.GetValue(3));
                        LN = Convert.ToString(rdr.GetValue(4));
                        Contact = Convert.ToString(rdr.GetValue(5));
                        Address = Convert.ToString(rdr.GetValue(6));
                        Status = Convert.ToString(rdr.GetValue(7));
                    }

                    idbox.Text = id;
                    emailbox.Text = email;
                    fnbox.Text = FN;
                    lnbox.Text = LN;
                    cbox.Text = Contact;
                    addressbox.Text = Address;
                    Label2.Text = Status;

                    conn.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string status = Label2.Text,newStatus="";

            if (status.Equals("Active"))
            {
                newStatus = "Not Active";
            }else if (status.Equals("Not Active"))
            {
                newStatus = "Active";
            }

            id = Session["adstaffid"].ToString();
            string sql = "Update Staff SET Status=@Status WHERE StaffID= @id";
            cmd = new SqlCommand(sql, conn);

            conn.Open();
            cmd.Parameters.AddWithValue("@Status", newStatus);
            cmd.Parameters.AddWithValue("@id", id);

            cmd.ExecuteNonQuery();
            Response.Redirect("viewStaff.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("showItem.aspx");
        }
    }
}