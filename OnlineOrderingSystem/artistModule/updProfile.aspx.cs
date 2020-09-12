using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtModule
{
    public partial class updProfile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");
        SqlCommand cmd = null;
        SqlDataReader rdr = null;
        String id, FN, LN, Contact, Address, pass = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                String email = "";
                conn.Open();
                id = Session["UserID"].ToString();

                if (id.Equals(""))
                {
                    Response.Redirect("adminHome.aspx");
                }

                cmd = new SqlCommand("select * from Artist where ArtistID=" + id + ";", conn);

                rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    rdr.Read();
                    email = Convert.ToString(rdr.GetValue(1));
                    FN = Convert.ToString(rdr.GetValue(3));
                    LN = Convert.ToString(rdr.GetValue(4));
                    Contact = Convert.ToString(rdr.GetValue(5));
                    Address = Convert.ToString(rdr.GetValue(6));
                    pass = Convert.ToString(rdr.GetValue(2));
                }

                idbox.Text = id;
                emailbox.Text = email;
                fnbox.Text = FN;
                lnbox.Text = LN;
                cbox.Text = Contact;
                addressbox.Text = Address;
                passbox.Text = pass;
                Session["useremail"] = email;

                conn.Close();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            conn.Open();
            string sql = "Update Artist SET Email=@Email, First_Name=@First_Name, Last_Name=@Last_Name, Contact_No=@Contact_No, Address=@Address, Password=@Password WHERE ArtistID= @id";
            cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@Email", emailbox.Text);
            cmd.Parameters.AddWithValue("@First_Name", fnbox.Text);
            cmd.Parameters.AddWithValue("@Last_Name", lnbox.Text);
            cmd.Parameters.AddWithValue("@Contact_No", cbox.Text);
            cmd.Parameters.AddWithValue("@Address", addressbox.Text);
            cmd.Parameters.AddWithValue("@Password", passbox.Text);
            cmd.Parameters.AddWithValue("@id", idbox.Text);

            cmd.ExecuteNonQuery();
            Response.Redirect("profile.aspx");
        }
    }
}