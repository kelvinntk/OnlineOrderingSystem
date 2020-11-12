using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineOrderingSystem.adminModel
{
    public partial class showItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
           //int height = GridView1.Height;
           
        }

        protected void btnPrintFromCodeBehind_Click(object sender, EventArgs e)
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("<table width='100%' cellspacing='0' cellpadding='2'>");
                sb.Append("<tr><td align='center' colspan = '2'><h1>FOOD X</h1><br/>&nbsp;</td></tr>");
                sb.Append("<tr><td align='center' colspan = '2'><h1><b>Report</b></h1></td></tr>");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "printGrid", "printGrid();", true);
            }
            catch { }
        }
    }
}