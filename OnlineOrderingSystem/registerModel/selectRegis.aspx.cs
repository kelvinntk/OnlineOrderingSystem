using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace register.registerModel
{
    public partial class selectRegis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["selectedRegis"] = "staff";
            Response.Redirect("register.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["selectedRegis"] = "cust";
            Response.Redirect("~/Login_Module/Registration.aspx");
        }
    }
}