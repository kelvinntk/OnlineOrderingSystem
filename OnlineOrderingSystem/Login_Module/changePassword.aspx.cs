using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineOrderingSystem.Login_Module
{
    public partial class changePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void button_Click(object sender, EventArgs e)
        {
            string email = Request.QueryString["Email"];
            string password = TxtPass.Text;
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\OrderingDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "UPDATE [Customer] SET Password = @Password WHERE Email = '" + email + "'";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@Password", password);

            command.ExecuteScalar();

            Labelmsg.Text = "Your Password has been reset, Go back to Login <br /> Click On The Logo Button to go Back";
            
        }

        protected void button_Click2(object sender, EventArgs e)
        {
            Response.Redirect("~/Login_Module/login.aspx");
        }
    }
}