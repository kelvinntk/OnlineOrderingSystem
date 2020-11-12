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
    public partial class PostPayment : System.Web.UI.Page
    {
        string customerID = "";
        string orderID = "";
        string transactionID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerID"] == null)
            {
                Response.Redirect("~/Login_Module/login.aspx");
            }
            else
            {
                customerID = Session["CustomerID"] + "";
                orderID = Request.QueryString["orderID"];
                transactionID = Request.QueryString["transactionID"];

                displayInvoice();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerHome.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            invoicePDF();
        }

        protected void displayInvoice()
        {
            SqlDataReader dataReaderCustomer = getCustomer();

            string email = "";
            string customerName = "";

            while (dataReaderCustomer.Read())
            {
                email = dataReaderCustomer["Email"] + "";
                customerName = dataReaderCustomer["First_Name"] + " " + dataReaderCustomer["Last_Name"];
            }

            SqlDataReader dataReaderOrder = getOrder();

            double totalAmount = 0;

            while (dataReaderOrder.Read())
            {
                totalAmount += Convert.ToDouble(dataReaderOrder["Total_Amount"]);
            }

            double sst = totalAmount * 0.1;

            SqlDataReader dataReaderTransaction = getTransaction();

            DateTime date = DateTime.Now;
            string time = "";

            string address = "";

            double grandTotal = 0;

            while (dataReaderTransaction.Read())
            {
                date = Convert.ToDateTime(dataReaderTransaction["Transaction_Date"]);
                time = dataReaderTransaction["Transaction_Time"] + "";

                grandTotal = Convert.ToDouble(dataReaderTransaction["Grand_Total"]);

                address = dataReaderTransaction["Delivery_Address"] + "";
            }

            string dateStr = date.ToString("dd/MM/yyyy");



            LabelEmail.Text = email;



            LabelCustomerName.Text = customerName;

            LabelDate.Text = dateStr;

            LabelOrderID.Text = orderID;

            LabelTime.Text = time;

            LabelTransactionID.Text = transactionID;

            LabelAddress.Text = address;




            LabelSubTotal.Text = String.Format("{0:c}", totalAmount);

            LabelSST.Text = String.Format("{0:c}", sst);

            LabelGrandTotal.Text = String.Format("{0:c}", grandTotal);


        }

        protected SqlDataReader getCustomer()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

            con.Open();

            string queryStr = "SELECT * FROM [Customer] WHERE CustomerID = @CustomerID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@CustomerID", customerID);

            SqlDataReader dataReader = command.ExecuteReader();

            return dataReader;
        }

        protected SqlDataReader getOrder()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

            con.Open();

            string queryStr = "SELECT * FROM [Order] WHERE OrderID = @OrderID AND CustomerID = @CustomerID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@OrderID", orderID);
            command.Parameters.AddWithValue("@CustomerID", customerID);

            SqlDataReader dataReader = command.ExecuteReader();

            return dataReader;
        }

        protected SqlDataReader getOrderDetails()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

            con.Open();

            string queryStr = "SELECT * FROM [Order_Details] WHERE OrderID = @OrderID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@OrderID", orderID);

            SqlDataReader dataReader = command.ExecuteReader();

            return dataReader;
        }

        protected SqlDataReader getTransaction()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArtGalleryDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");

            con.Open();

            string queryStr = "SELECT * FROM [Transaction] WHERE TransactionID = @TransactionID AND OrderID = @OrderID AND CustomerID = @CustomerID";

            SqlCommand command = new SqlCommand(queryStr, con);

            command.Parameters.AddWithValue("@TransactionID", transactionID);
            command.Parameters.AddWithValue("@OrderID", orderID);
            command.Parameters.AddWithValue("@CustomerID", customerID);

            SqlDataReader dataReader = command.ExecuteReader();

            return dataReader;
        }

        protected void invoicePDF()
        {
            SqlDataReader dataReaderCustomer = getCustomer();

            string email = "";
            string customerName = "";

            while (dataReaderCustomer.Read())
            {
                email = dataReaderCustomer["Email"] + "";
                customerName = dataReaderCustomer["First_Name"] + " " + dataReaderCustomer["Last_Name"];
            }

            SqlDataReader dataReaderOrder = getOrder();

            double totalAmount = 0;

            while (dataReaderOrder.Read())
            {
                totalAmount += Convert.ToDouble(dataReaderOrder["Total_Amount"]);
            }

            double sst = totalAmount * 0.1;

            SqlDataReader dataReaderTransaction = getTransaction();

            DateTime date = DateTime.Now;
            string time = "";

            string address = "";

            double grandTotal = 0;

            while (dataReaderTransaction.Read())
            {
                date = Convert.ToDateTime(dataReaderTransaction["Transaction_Date"]);
                time = dataReaderTransaction["Transaction_Time"] + "";

                grandTotal = Convert.ToDouble(dataReaderTransaction["Grand_Total"]);
                
                address = dataReaderTransaction["Delivery_Address"] + "";
            }

            string dateStr = date.ToString("dd/MM/yyyy");
            
            StringBuilder sb = new StringBuilder();

            sb.Append("<table width='100%' cellspacing='0' cellpadding='2'>");
            sb.Append("<tr><td align='center' colspan = '2'><h1>FOOD X</h1><br/>&nbsp;</td></tr>");
            sb.Append("<tr><td align='center' colspan = '2'><h1><b>Invoice</b></h1></td></tr>");
            //sb.Append("<tr><td align='center' style='background-color: #18B5F0' colspan = '2'><b></b></td></tr>");

            sb.Append("<tr><td colspan = '2'>&nbsp;</td></tr>");
            sb.Append("<tr><td colspan = '2'><br /></td></tr>");

            sb.Append("<tr>");

            sb.Append("<td><b>Customer Name: </b>");
            sb.Append(customerName);
            sb.Append("</td>");

            sb.Append("<td><b>Date: </b>");
            sb.Append(dateStr);
            sb.Append("</td>");

            sb.Append("</tr>");

            sb.Append("<tr>");

            sb.Append("<td><b>Order ID: </b> ");
            sb.Append(orderID);
            sb.Append("</td>");

            sb.Append("<td><b>Time: </b>");
            sb.Append(time);
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
            sb.Append("<b>Art Name</b>");
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

            SqlDataReader dataReaderOrderDetails = getOrderDetails();

            while (dataReaderOrderDetails.Read())
            {
                sb.Append("<tr>");

                sb.Append("<td>");
                sb.Append(dataReaderOrderDetails["Item_Name"]);
                sb.Append("</td>");

                sb.Append("<td>");
                sb.Append(String.Format("{0:n}", dataReaderOrderDetails["Price"]));
                sb.Append("</td>");

                sb.Append("<td>");
                sb.Append(dataReaderOrderDetails["Quantity"]);
                sb.Append("</td>");

                sb.Append("<td>");
                sb.Append(String.Format("{0:n}", dataReaderOrderDetails["Total"]));
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

            PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Invoice_" + orderID + ".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Write(pdfDoc);
            Response.End();
        }
    }
}