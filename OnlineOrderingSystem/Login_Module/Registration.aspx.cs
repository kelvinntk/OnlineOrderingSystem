using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineOrderingSystem.Login_Module
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\OrderingDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            con.Open();
            string queryStr = "INSERT INTO [Customer](Email, Password, First_Name, Last_Name, Contact_No, Address, Status) VALUES (@Email, @Password, @First_Name, @Last_Name, @Contact_No, @Address, @Status) SELECT @@IDENTITY";

            SqlCommand cmd = new SqlCommand(queryStr, con);

            cmd.Parameters.AddWithValue("@Email", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Password", TextBox2.Text);
            cmd.Parameters.AddWithValue("@First_Name", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Last_Name", TextBox4.Text);
            cmd.Parameters.AddWithValue("@Contact_No", TextBox5.Text);
            cmd.Parameters.AddWithValue("@Address", TextBox6.Text);
            cmd.Parameters.AddWithValue("@Status", "Active");
            cmd.ExecuteScalar();
            Label1.Visible = true;
            Label1.Text = "User registered successfully";

            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";

            TextBox1.Focus();

            //con.Close();

            //Response.Redirect("homepage.aspx");
        }
    }
}