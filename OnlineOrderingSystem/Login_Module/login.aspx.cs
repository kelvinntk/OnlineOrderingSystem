using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

namespace Login_Module.Login_Module
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["time"] = DateTime.Now;
            string email = TextBox1.Text;
            string password = TextBox2.Text;
            
            bool validCustomer = verifyCustomer(email, password);

            if (validCustomer == true)
            {
                Response.Redirect("~/Customer_Module/CustomerHome.aspx");
            }
            else
            {
                bool validStaff = verifyStaff(email, password);

                if (validStaff == true)
                {
                    Response.Redirect("~/staffModule/staffHome.aspx");
                }
                else
                {
                    bool validAdmin = verifyAdmin(email, password);
                    
                    if (validAdmin == true)
                    {
                        Response.Redirect("~/adminModel/adminHome.aspx");
                    }
                    else
                    {
                        Label1.Text = "Email or password is incorrect!";

                        TextBox1.Text = "";
                        TextBox2.Text = "";
                    }
                }
            }
        }

        protected bool verifyCustomer(string email, string password)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\OrderingDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "SELECT * FROM [Customer] WHERE Email = @Email AND Password = @Password";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@Email", email);
            command.Parameters.AddWithValue("@Password", password);

            SqlDataReader dataReader = command.ExecuteReader();
            
            if (dataReader.HasRows)
            {
                while(dataReader.Read())
                {
                    Session["UserID"] = dataReader["CustomerID"];
                }
                
                return true;
            }
            else
            {
                return false;
            }
        }

        protected bool verifyStaff(string email, string password)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\OrderingDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "SELECT * FROM [Staff] WHERE Email = @Email AND Password = @Password";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@Email", email);
            command.Parameters.AddWithValue("@Password", password);

            SqlDataReader dataReader = command.ExecuteReader();

            if (dataReader.HasRows)
            {
                while (dataReader.Read())
                {
                    Session["UserID"] = dataReader["StaffID"];

                    String name = (string)dataReader["First_Name"];
                    Session["name"] = name;
                }

                return true;
            }
            else
            {
                return false;
            }
        }

        protected bool verifyAdmin(string email, string password)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\OrderingDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "SELECT * FROM [Admin] WHERE Email = @Email AND Password = @Password";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@Email", email);
            command.Parameters.AddWithValue("@Password", password);

            SqlDataReader dataReader = command.ExecuteReader();

            if (dataReader.HasRows)
            {
                while (dataReader.Read())
                {
                    Session["UserID"] = dataReader["AdminID"];
                }

                return true;
            }
            else
            {
                return false;
            }
        }
    }
}