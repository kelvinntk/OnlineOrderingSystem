using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace register.registerModel
{
    public partial class view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String condition = Session["condition"].ToString();
            if (condition.Equals("good"))
            {
                Label1.Text = "Success";
            }
            else if (condition.Equals("bad"))
            {
                Label1.Text = "Fail";
            }
            else if (condition.Equals("used"))
            {
                Label1.Text = "This Email has used by people";
                FormView1.Visible = false;
                Button2.Visible = true;
            }

            string select = Session["selectedRegis"].ToString();

            if (select.Equals("artist"))
            {
                FormView1.DataSourceID = "SqlDataSource1";
            }
            else if (select.Equals("cust"))
            {
                FormView1.DataSourceID = "SqlDataSource2";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("../Login_Module/login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Remove("condition");
            Response.Redirect("register.aspx");
        }
    }
}