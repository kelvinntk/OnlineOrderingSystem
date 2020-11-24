using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

namespace CustomerModule.Customer_Module
{
    public partial class CustomerMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerID"] == null)
            {
                Response.Redirect("~/Login_Module/login.aspx");
            }
            else
            {
                Session["CustomerID"] = Session["UserID"];

                string customerID = Session["CustomerID"] + "";

                Label1.Text = "";

                SqlDataReader dataReader = getCustomer(customerID);

                string name = "Not Logged In";

                while (dataReader.Read())
                {
                    name = dataReader["First_Name"] + " " + dataReader["Last_Name"];
                }

                Label1.Text = name;
            }
        }

        protected SqlDataReader getCustomer(string customerID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Belinda\source\repos\OnlineOrderingSystem\OnlineOrderingSystem\App_Data\OrderingDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

            con.Open();

            string queryStr = "SELECT * FROM [Customer] WHERE CustomerID = @CustomerID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@CustomerID", customerID);

            SqlDataReader dataReader = command.ExecuteReader();

            return dataReader;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();

            Response.Redirect("~/Login_Module/homepage.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer_Module/Cart.aspx");
        }

    }
}