using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineOrderingSystem.adminModel
{
    public partial class showOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;

            Session["adorderid"] = row.Cells[1].Text;

            Response.Redirect("orderDetail.aspx");
        }
        protected void btnPrintFromCodeBehind_Click(object sender, EventArgs e)
        {
            try
            {

                ScriptManager.RegisterStartupScript(this, typeof(Page), "printGrid", "printGrid();", true);
            }
            catch { }
        }
    }
}