using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineOrderingSystem.staffModule
{
    public partial class WebUserControl1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = (string)Session["name"].ToString();
            Label2.Text = DateTime.Now.ToString("h:mm:ss tt");//(string)Session["time"].ToString();
        }
    }
}