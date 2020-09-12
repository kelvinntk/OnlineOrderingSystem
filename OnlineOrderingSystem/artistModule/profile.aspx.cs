using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtModule
{
    public partial class profile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");
        SqlCommand cmd = null;
        SqlDataReader rdr = null;
        String id, FN, LN, Contact, Address, email, pass = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                conn.Open();
                id = Session["UserID"].ToString();

                if (id.Equals(""))
                {
                    Response.Redirect("artistHome.aspx");
                }

                cmd = new SqlCommand("select * from Artist where ArtistID=" + id + ";", conn);

                rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    rdr.Read();
                    email = Convert.ToString(rdr.GetValue(1));
                    pass = Convert.ToString(rdr.GetValue(2));
                    FN = Convert.ToString(rdr.GetValue(3));
                    LN = Convert.ToString(rdr.GetValue(4));
                    Contact = Convert.ToString(rdr.GetValue(5));
                    Address = Convert.ToString(rdr.GetValue(6));
                }
                else
                {
                    Response.Redirect("artistHome.aspx");
                }

                idbox.Text = id;
                emailbox.Text = email;
                fnbox.Text = FN;
                lnbox.Text = LN;
                cbox.Text = Contact;
                addressbox.Text = Address;

                conn.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("updProfile.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label2.Visible = true;
            Label3.Visible = true;
            TextBox2.Visible = true;
            TextBox3.Visible = true;
            Button5.Visible = true;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            int num = 0, alp = 0;
            conn.Open();

            id = Session["UserID"].ToString();

            cmd = new SqlCommand("select * from Artist where ArtistID=" + id + ";", conn);

            rdr = cmd.ExecuteReader();

            if (rdr.HasRows)
            {
                rdr.Read();
                pass = Convert.ToString(rdr.GetValue(2));
            }

            conn.Close();

            if (TextBox2.Text.Length == 0 && TextBox3.Text.Length == 0)
            {
                Label4.Visible = true;
                Label5.Visible = true;
                Label6.Visible = true;
                Label5.Text = "Old password and new password cannot be empty";
            }
            else if (TextBox2.Text.Length == 0)
            {
                Label4.Visible = true;
                Label5.Visible = true;
                Label5.Text = "Old password cannot be empty";
            }
            else if (TextBox3.Text.Length == 0)
            {
                Label6.Visible = true;
                Label5.Visible = true;
                Label5.Text = "New password cannot be empty";
            }
            else if (TextBox2.Text.Equals(pass))
            {
                if (TextBox3.Text.Length >= 6)
                {

                    for (int i = 0; i < TextBox3.Text.Length; i++)
                    {
                        char no = TextBox3.Text[i];

                        if (no >= '0' && no <= '9')
                        {
                            num++;
                        }
                        else if (no >= 'a' && no <= 'z')
                        {
                            alp++;
                        }
                        else if (no >= 'A' && no <= 'z')
                        {
                            alp++;
                        }
                    }

                    if (num > 0 && alp > 0)
                    {
                        conn.Open();
                        id = Session["UserID"].ToString();
                        cmd = new SqlCommand("UPDATE Artist SET password = @pass Where ArtistID = " + id, conn);
                        cmd.Parameters.AddWithValue("pass", TextBox3.Text.ToString());
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        Label2.Visible = false;
                        Label3.Visible = false;
                        Label5.Visible = true;
                        Label5.Text = "Password changed";
                        TextBox2.Visible = false;
                        TextBox3.Visible = false;
                        Label4.Visible = false;
                        Label6.Visible = false;
                        Button5.Visible = false;
                    }

                }
                else
                {
                    Label4.Visible = true;
                    Label5.Visible = true;
                    Label6.Visible = true;
                    Label5.Text = "New password must be 6 digit long and must be a mixture of digit and alphabet";
                }
            }
            else
            {
                Label4.Visible = true;
                Label5.Visible = true;
                Label5.Text = "Wrong old password";
            }
        }
    }
}