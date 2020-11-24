using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

namespace CustomerModule.Customer_Module
{
    public partial class CustomerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["msg"] != null)
            {
                if (Session["msg"].ToString() == "success")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Password successfully changed!');", true);

                    Session["msg"] = null;
                }
                else if (Session["msg"].ToString() == "fail")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Current Password is incorrect!');", true);

                    Session["msg"] = null;
                }
            }
        }

        protected void ChangePassword1_ChangingPassword(object sender, EventArgs e)
        {
            string customerID = Session["CustomerID"] + "";

            string currentPassword = getCurrentPassword(customerID);

            if (ChangePassword1.CurrentPassword.ToString() == currentPassword)
            {
                string newPassword = ChangePassword1.NewPassword.ToString();

                updatePassword(customerID, newPassword);

                Session["msg"] = "success";

                Response.Redirect("CustomerProfile.aspx");
            }
            else
            {
                Session["msg"] = "fail";

                Response.Redirect("CustomerProfile.aspx");
            }
        }

        protected string getCurrentPassword(string customerID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\OrderingDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "SELECT * FROM [Customer] WHERE CustomerID = @CustomerID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@CustomerID", customerID);

            SqlDataReader dataReader = command.ExecuteReader();

            string password = null;

            while (dataReader.Read())
            {
                password = dataReader["Password"] + "";
            }

            return password;
        }

        protected void updatePassword(string customerID, string password)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\OrderingDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "UPDATE [Customer] SET Password = @Password WHERE CustomerID = @CustomerID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@Password", password);
            command.Parameters.AddWithValue("@CustomerID", customerID);

            command.ExecuteScalar();
        }

        protected void ChangePassword1_ChangedPassword(object sender, EventArgs e)
        {
            //ChangePassword1.SuccessTemplate.InstantiateIn(ChangePassword1);
            //ChangePassword1.ChangePasswordTemplateContainer.Visible = false;
        }
    }
}