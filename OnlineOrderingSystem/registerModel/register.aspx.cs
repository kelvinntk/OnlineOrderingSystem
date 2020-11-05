using OnlineOrderingSystem.registerModel;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace register.registerModel
{
    public partial class register : System.Web.UI.Page
    {
        String regisSelected;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["condition"] = "";
            if (IsPostBack)
            {
                FormView1.FindControl("Label8").Visible = false;
                FormView1.FindControl("Label9").Visible = false;
                int alp = 0, num = 0;
                TextBox passt = (TextBox)FormView1.FindControl("TextBox6");
                String pass = passt.Text.ToString();
                char[] ch = pass.ToCharArray();
                TextBox8.Text = "ok";

                if (ch.Length != 0)
                {
                    for (int i = 0; i < ch.Length; i++)
                    {
                        var no = Convert.ToInt64(ch[i]);
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
                    if (num == 0 || alp == 0 || pass.Length < 6)
                    {
                        TextBox8.Text = "";
                        FormView1.FindControl("Label8").Visible = true;
                        FormView1.FindControl("Label9").Visible = true;
                        Session["condition"] = "not";
                    }
                }
            }

            regisSelected = Session["selectedRegis"].ToString();
            if (regisSelected.Equals("staff"))
            {
                Label1.Text = "Register as Staff";
            }
            else if (regisSelected.Equals("cust"))
            {
                Label1.Text = "Register as Custormer";
            }
        }
        public void FormView1_insertItem()
        {
            if (!Session["condition"].ToString().Equals("not"))
            {
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True");
                ArtGalleryDBEntities _db = new ArtGalleryDBEntities();
                TextBox email = (TextBox)FormView1.FindControl("TextBox3");

                con.Open();

                string queryStr = "SELECT Email FROM Staff";
                SqlCommand command = new SqlCommand(queryStr, con);
                SqlDataReader dataReader = command.ExecuteReader();

                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        string demail = dataReader["email"].ToString();
                        if (demail.Equals(email.Text))
                        {
                            Session["condition"] = "used";
                            con.Close();
                            Response.Redirect("confirm.aspx");
                        }
                    }
                }
                con.Close();
                con.Open();

                queryStr = "SELECT Email FROM Customer";
                command = new SqlCommand(queryStr, con);
                dataReader = command.ExecuteReader();

                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        string demail = dataReader["email"].ToString();
                        if (demail.Equals(email.Text))
                        {
                            Session["condition"] = "used";
                            con.Close();
                            Response.Redirect("confirm.aspx");
                        }
                    }
                }
                con.Close();

                if (regisSelected.Equals("staff"))
                {
                    Staff pp = new Staff();
                    TryUpdateModel(pp);
                    if (ModelState.IsValid)
                    {
                        Session["condition"] = "good";
                        _db.Staffs.Add(pp);
                        _db.SaveChanges();
                        Response.Redirect("confirm.aspx");
                    }
                }
                else if (regisSelected.Equals("cust"))
                {
                    Customer cc = new Customer();
                    TryUpdateModel(cc);
                    if (ModelState.IsValid)
                    {
                        Session["condition"] = "good";
                        _db.Customers.Add(cc);
                        _db.SaveChanges();
                        Response.Redirect("confirm.aspx");
                    }
                }

                Session["condition"] = "bad";
                Response.Redirect("confirm.aspx");
            }
        }
    }
}