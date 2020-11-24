using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

namespace OnlineOrderingSystem.Customer_Module
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string customerID = Session["CustomerID"] + "";

            double totalAmount = sumCartTotalAmount(customerID);

            LabelTotalAmount.Text = String.Format("{0:c}", totalAmount);

            double sst = totalAmount * 0.1;

            LabelSST.Text = String.Format("{0:c}", sst);

            double grandTotal = totalAmount + sst;

            LabelGrandTotal.Text = String.Format("{0:c}", grandTotal);
        }

        protected double sumCartTotalAmount(string customerID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\OrderingDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "SELECT * FROM [Cart] WHERE CustomerID = @CustomerID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@CustomerID", customerID);

            SqlDataReader dataReader = command.ExecuteReader();

            double totalAmount = 0;

            while (dataReader.Read())
            {
                totalAmount += Convert.ToDouble(dataReader["Total"]);
            }
            
            return totalAmount;
        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreditCard.aspx");
        }
    }
}