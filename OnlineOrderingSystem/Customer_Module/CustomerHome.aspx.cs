using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomerModule.Customer_Module
{
    public partial class CustomerHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["CustomerID"] = Session["UserID"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer_Module/OnlineOrderingSystem.aspx");
        }
    }
}