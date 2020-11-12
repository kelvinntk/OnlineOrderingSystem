using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace adminModel.adminModel
{
    public partial class adminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["adstaffid"] = "";
            Session["adcustid"] = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewStaff.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewCust.aspx");
        }
    }
}