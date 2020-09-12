using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace adminModel.adminModel
{
    public partial class adminMst : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();

            Response.Redirect("~/Login_Module/homepage.aspx");
        }

        protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
        {
        }
    }
}