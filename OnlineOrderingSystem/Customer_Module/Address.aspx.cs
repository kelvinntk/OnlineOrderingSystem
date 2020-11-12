using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Net;
using System.Net.Mail;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

namespace OnlineOrderingSystem.Customer_Module
{
    public partial class Address : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string customerID = Session["CustomerID"] + "";

            string currentDate = DateTime.Now.ToString("MM/dd/yyyy");
            string currentTime = DateTime.Now.ToString("HH:mm:ss");

            //string address = TextBoxHouseNo.Text + ", "
            //    + TextBoxAddress1.Text + ", "
            //    + TextBoxAddress2.Text + ", "
            //    + TextBoxPostcode.Text + ", "
            //    + TextBoxCity.Text + ", "
            //    + TextBoxState.Text + ", "
            //    + TextBoxCountry.Text;

            string address = TextBoxHouseNo.Text + ", "
                + TextBoxAddress1.Text + ", "
                + TextBoxAddress2.Text + ", "
                + TextBoxPostcode.Text + ", "
                + TextBoxCity.Text + ", "
                + TextBoxState.Text;

            double totalAmount = getCartTotal(customerID);

            addOrder(customerID, currentDate, currentTime, totalAmount);

            SqlDataReader dataReader = getCart(customerID);

            string orderID =  getOrderID(customerID, currentDate, currentTime);

            addOrderDetails(customerID, orderID, dataReader);

            double sst = totalAmount * 0.1;
            
            double grandTotal = totalAmount + sst;

            addTransaction(orderID, customerID, currentDate, currentTime, grandTotal, address);
            
            dataReader = null;

            dataReader = getCart(customerID);

            string transactionID = getTransactionID(customerID, orderID, currentDate, currentTime);

            sendEmail(customerID, address, orderID, transactionID, currentTime, totalAmount, sst, grandTotal, dataReader);

            dataReader = null;

            dataReader = getCart(customerID);

            updateStock(dataReader);

            deleteCart(customerID);

            Response.Redirect("PostPayment.aspx?orderID=" + orderID + "&transactionID=" + transactionID);
        }

        protected double getCartTotal(string customerID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

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

        protected void addOrder(string customerID, string currentDate, string currentTime, double totalAmount)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

            con.Open();

            string queryStr = "INSERT INTO [Order](CustomerID, Order_Date, Order_Time, Total_Amount, Status) VALUES (@CustomerID, @Order_Date, @Order_Time, @Total_Amount, @Status) SELECT @@IDENTITY";

            SqlCommand command = new SqlCommand(queryStr, con);
            
            command.Parameters.AddWithValue("@CustomerID", customerID);
            command.Parameters.AddWithValue("@Order_Date", currentDate);
            command.Parameters.AddWithValue("@Order_Time", currentTime);
            command.Parameters.AddWithValue("@Total_Amount", totalAmount);
            command.Parameters.AddWithValue("@Status", "PAID");
            
            command.ExecuteScalar();
        }

        protected string getOrderID(string customerID, string currentDate, string currentTime)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

            con.Open();

            string queryStr = "SELECT * FROM [Order] WHERE CustomerID = @CustomerID AND Order_Date = @Order_Date AND Order_Time = @Order_Time";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@CustomerID", customerID);
            command.Parameters.AddWithValue("@Order_Date", currentDate);
            command.Parameters.AddWithValue("@Order_Time", currentTime);

            SqlDataReader dataReader = command.ExecuteReader();

            string orderID = "";

            while (dataReader.Read())
            {
                orderID = dataReader["OrderID"] + "";
            }

            return orderID;
        }

        protected string getTransactionID(string customerID, string orderID, string currentDate, string currentTime)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

            con.Open();

            string queryStr = "SELECT * FROM [Transaction] WHERE CustomerID = @CustomerID AND OrderID = @OrderID AND Transaction_Date = @Transaction_Date AND Transaction_Time = @Transaction_Time";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@CustomerID", customerID);
            command.Parameters.AddWithValue("@OrderID", orderID);
            command.Parameters.AddWithValue("@Transaction_Date", currentDate);
            command.Parameters.AddWithValue("@Transaction_Time", currentTime);

            SqlDataReader dataReader = command.ExecuteReader();

            string transactionID = "";

            while (dataReader.Read())
            {
                transactionID = dataReader["TransactionID"] + "";
            }

            return transactionID;
        }

        protected SqlDataReader getCart(string customerID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

            con.Open();

            string queryStr = "SELECT * FROM [Cart] WHERE CustomerID = @CustomerID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@CustomerID", customerID);

            SqlDataReader dataReader = command.ExecuteReader();
            
            return dataReader;
        }

        protected void addOrderDetails(string customerID, string orderID, SqlDataReader dataReader)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

            con.Open();

            string queryStr = "INSERT INTO Order_Details(OrderID, ItemID, Item_Name, Price, Quantity) VALUES (@OrderID, @ItemID, @Item_Name, @Price, @Quantity)";

            SqlCommand command = new SqlCommand(queryStr, con);

            while (dataReader.Read())
            {
                command.Parameters.Clear();

                command.Parameters.AddWithValue("@OrderID", orderID);
                command.Parameters.AddWithValue("@ItemID", dataReader["ItemID"]);
                command.Parameters.AddWithValue("@Item_Name", dataReader["Item_Name"]);
                command.Parameters.AddWithValue("@Price", dataReader["Price"]);
                command.Parameters.AddWithValue("@Quantity", dataReader["Quantity"]);
                //command.Parameters.AddWithValue("@Total", dataReader["Total"]);

                command.ExecuteScalar();
            }
        }
        
        protected void addTransaction(string orderID, string customerID, string currentDate, string currentTime, double grandTotal, string address)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

            con.Open();

            string queryStr = "INSERT INTO [Transaction](OrderID, CustomerID, Transaction_Date, Transaction_Time, Grand_Total, Delivery_Address, Status) VALUES (@OrderID, @CustomerID, @Transaction_Date, @Transaction_Time, @Grand_Total, @Delivery_Address, @Status)";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@OrderID", orderID);
            command.Parameters.AddWithValue("@CustomerID", customerID);
            command.Parameters.AddWithValue("@Transaction_Date", currentDate);
            command.Parameters.AddWithValue("@Transaction_Time", currentTime);
            command.Parameters.AddWithValue("@Grand_Total", grandTotal);
            command.Parameters.AddWithValue("@Delivery_Address", address);
            command.Parameters.AddWithValue("@Status", "PAID");
            
            command.ExecuteScalar();
        }

        protected void updateStock(SqlDataReader dataReader)
        {
            while (dataReader.Read())
            {
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

                con.Open();

                string queryStr = "UPDATE Item SET NoOfStock = NoOfStock - @Quantity WHERE ItemID = @ItemID";

                SqlCommand command = new SqlCommand(queryStr, con);

                command.Parameters.AddWithValue("@Quantity", dataReader["Quantity"]);
                command.Parameters.AddWithValue("@ItemID", dataReader["ItemID"]);

                command.ExecuteScalar();
            }
        }

        protected void deleteCart(string customerID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

            con.Open();

            string queryStr = "DELETE FROM CART WHERE CustomerID = @CustomerID";

            SqlCommand command = new SqlCommand(queryStr, con);
            
            command.Parameters.AddWithValue("@CustomerID", customerID);

            command.ExecuteScalar();
        }

        protected SqlDataReader getCustomer(string customerID)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

            con.Open();

            string queryStr = "SELECT * FROM [Customer] WHERE CustomerID = @CustomerID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@CustomerID", customerID);

            SqlDataReader dataReader = command.ExecuteReader();
            
            return dataReader;
        }

        protected void sendEmail(string customerID, string address, string orderID, string transactionID, string currentTime, double totalAmount, double sst, double grandTotal, SqlDataReader dataReader)
        {
            string currentDate = DateTime.Now.ToString("dd/MM/yyyy");

            SqlDataReader dataReaderCustomer = getCustomer(customerID);

            string email = "";
            string customerName = "";
            
            while (dataReaderCustomer.Read())
            {
                email = dataReaderCustomer["Email"] + "";
                customerName = dataReaderCustomer["First_Name"] + " " + dataReaderCustomer["Last_Name"];
            }

            StringBuilder sb = new StringBuilder();
            
            sb.Append("<table width='100%' cellspacing='0' cellpadding='2'>");
            sb.Append("<tr><td align='center' colspan = '2'><h1>ARTERIA</h1><br/>&nbsp;</td></tr>");
            sb.Append("<tr><td align='center' colspan = '2'><h2><b>Invoice</b></h2></td></tr>");
            //sb.Append("<tr><td align='center' style='background-color: #18B5F0' colspan = '2'><b></b></td></tr>");

            sb.Append("<tr><td colspan = '2'>&nbsp;</td></tr>");
            sb.Append("<tr><td colspan = '2'><br /></td></tr>");

            sb.Append("<tr>");

            sb.Append("<td><b>Customer Name: </b>");
            sb.Append(customerName);
            sb.Append("</td>");

            sb.Append("<td><b>Date: </b>");
            sb.Append(currentDate);
            sb.Append("</td>");

            sb.Append("</tr>");

            sb.Append("<tr>");

            sb.Append("<td><b>Order ID: </b> ");
            sb.Append(orderID);
            sb.Append("</td>");

            sb.Append("<td><b>Time: </b>");
            sb.Append(currentTime);
            sb.Append("</td>");

            sb.Append("</tr>");
            
            sb.Append("<tr><td colspan = '2'><b>Transaction ID: </b> ");
            sb.Append(transactionID);
            sb.Append("</td></tr>");
            
            sb.Append("<tr><td colspan = '2'><b>Shipment Address: </b> ");
            sb.Append(address);
            sb.Append("</td></tr>");

            sb.Append("</table>");



            sb.Append("<br />");
            sb.Append("<br />");
            sb.Append("<br />");


            sb.Append("<table border = '1'>");

            sb.Append("<tr>");

            //sb.Append("<th style = 'background-color: #D20B0C;>");
            sb.Append("<th align='center'>");
            sb.Append("<b>Item Name</b>");
            sb.Append("</th>");

            sb.Append("<th align='center'>");
            sb.Append("<b>Price (RM)</b>");
            sb.Append("</th>");

            sb.Append("<th align='center'>");
            sb.Append("<b>Quantity</b>");
            sb.Append("</th>");

            sb.Append("<th align='center'>");
            sb.Append("<b>Total (RM)</b>");
            sb.Append("</th>");

            sb.Append("</tr>");
            
            while (dataReader.Read())
            {
                sb.Append("<tr>");

                sb.Append("<td>");
                sb.Append(dataReader["Item_Name"]);
                sb.Append("</td>");

                sb.Append("<td>");
                sb.Append(String.Format("{0:n}", dataReader["Price"]));
                sb.Append("</td>");

                sb.Append("<td>");
                sb.Append(dataReader["Quantity"]);
                sb.Append("</td>");

                sb.Append("<td>");
                sb.Append(String.Format("{0:n}", dataReader["Total"]));
                sb.Append("</td>");
                
                sb.Append("</tr>");
            }
            
            sb.Append("</table>");



            sb.Append("<br />");
            sb.Append("<br />");
            sb.Append("<br />");


            
            sb.Append("<table>");

            sb.Append("<tr>");

            sb.Append("<td align='right'>");
            sb.Append("<b>Sub-total</b>");
            sb.Append("</td>");

            sb.Append("<td>");
            sb.Append("&nbsp;:&nbsp;RM " + String.Format("{0:n}", totalAmount));
            sb.Append("</td>");
            
            sb.Append("</tr>");

            sb.Append("<tr>");

            sb.Append("<td align='right'>");
            sb.Append("<b>10% SST</b>");
            sb.Append("</td>");

            sb.Append("<td>");
            sb.Append("&nbsp;:&nbsp;RM " + String.Format("{0:n}", sst));
            sb.Append("</td>");

            sb.Append("</tr>");

            sb.Append("<tr>");

            sb.Append("<td align='right'>");
            sb.Append("<b>Grand Total</b>");
            sb.Append("</td>");

            sb.Append("<td>");
            sb.Append("&nbsp;:&nbsp;RM " + String.Format("{0:n}", grandTotal));
            sb.Append("</td>");

            sb.Append("</tr>");
            
            sb.Append("</table>");

            StringReader sr = new StringReader(sb.ToString());

            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            
            using (MemoryStream memoryStream = new MemoryStream())
            {
                PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);
                pdfDoc.Open();
                htmlparser.Parse(sr);
                pdfDoc.Close();
                byte[] bytes = memoryStream.ToArray();
                memoryStream.Close();

                MailMessage mm = new MailMessage("duckb532@gmail.com", email);
                mm.Subject = "Invoice";
                mm.Body = "Your invoice";
                mm.Attachments.Add(new Attachment(new MemoryStream(bytes), "Invoice_" + orderID + ".pdf"));
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential nc = new NetworkCredential();
                nc.UserName = "duckb532@gmail.com";
                nc.Password = "Kaixing0831";

                smtp.UseDefaultCredentials = true;
                smtp.Credentials = nc;
                smtp.Port = 587;
                smtp.Send(mm);
            }
        }
    }
}