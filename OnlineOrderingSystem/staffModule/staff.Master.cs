using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ItemModule
{
    public partial class staffHome : System.Web.UI.MasterPage
    {
        Control con;
        protected void Page_Load(object sender, EventArgs e)
        {
            int time = Convert.ToInt32(DateTime.Now.Hour);

            if (time < 6 && time >= 0)
            {
                con = LoadControl("midNight.ascx");
            }
            else if (time < 12 && time > 6)
            {
                con = LoadControl("goodMorning.ascx");
            }
            else if (time <= 18 && time >= 12)
            {
                con = LoadControl("goodAfternoon.ascx");
            }
            else if (time <= 23 && time >= 19)
            {
                con = LoadControl("goodNight.ascx");
            }
            Content2.Controls.Add(con);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();

            Response.Redirect("~/Login_Module/homepage.aspx");
        }
    }
}