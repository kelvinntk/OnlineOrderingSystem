﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace adminModel.adminModel
{
    public partial class viewStaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["adstaffid"] = "";
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;

            Session["adstaffid"] = row.Cells[1].Text;

            Response.Redirect("selectedStaff.aspx");
        }
    }
}