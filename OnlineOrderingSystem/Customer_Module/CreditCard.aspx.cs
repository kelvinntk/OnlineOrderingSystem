using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

namespace OnlineOrderingSystem.Customer_Module
{
    public partial class CreditCard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            string cardHolderName = TextBoxCardHolderName.Text;
            string cardNumber = TextBoxCardNumber.Text;
            string cvv = TextBoxCVV.Text;
            string month = TextBoxExpiryMonth.Text;
            string year = TextBoxExpiryYear.Text;
            string cardType = DropDownList1.Text;

            bool cardValidity = checkCreditCard(cardHolderName, cardNumber, cvv, month, year, cardType);

            if (cardValidity == true)
            {
                Response.Redirect("Address.aspx");
            }
            else if (cardValidity == false)
            {
                TextBoxCardHolderName.Text = "";
                TextBoxCardHolderName.Focus();

                TextBoxCardNumber.Text = "";

                TextBoxCVV.Text = "";

                TextBoxExpiryMonth.Text = "";
                TextBoxExpiryYear.Text = "";

                DropDownList1.ClearSelection();

                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Invalid Credit Card Details! Please enter again!');", true);
            }
        }

        protected bool checkCreditCard(string cardHolderName, string cardNumber, string cvv, string month, string year, string cardType)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\OrderingDB.mdf;Integrated Security=True");

            con.Open();

            string queryStr = "SELECT * FROM [Credit_Card] WHERE CardHolderName = @CardHolderName AND CardNumber = @CardNumber AND CVV = @CVV AND ExpiryMonth = @ExpiryMonth AND ExpiryYear = @ExpiryYear AND CreditCardType = @CreditCardType";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@CardHolderName", cardHolderName);
            command.Parameters.AddWithValue("@CardNumber", cardNumber);
            command.Parameters.AddWithValue("@CVV", cvv);
            command.Parameters.AddWithValue("@ExpiryMonth", month);
            command.Parameters.AddWithValue("@ExpiryYear", year);
            command.Parameters.AddWithValue("@CreditCardType", cardType);

            SqlDataReader dataReader = command.ExecuteReader();
            
            if (dataReader.HasRows)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}