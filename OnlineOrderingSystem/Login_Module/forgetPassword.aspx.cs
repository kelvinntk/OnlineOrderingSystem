using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Net;
using System.Net.Mail;


namespace OnlineOrderingSystem.Login_Module
{
    public partial class forgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnPwd_Click(object sender, EventArgs e)
        {
            String conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(conn);
            String sqlQuery = "select Email,Password from [dbo].[Customer] where Email=@Email";
            SqlCommand sqlComm = new SqlCommand(sqlQuery, sqlConnection);
            sqlComm.Parameters.AddWithValue("@Email", TxtEmail.Text);
            sqlConnection.Open();
            SqlDataReader sdr = sqlComm.ExecuteReader();
            if(sdr.Read())
            {
                string email = sdr["Email"] + "";
                string password = sdr["Password"] + "";
                var href = "http://" + Request.Url.Host + ":" + Request.Url.Port + "/Login_Module/changePassword.aspx?Email=" + email;

                MailMessage mm =  new MailMessage ("kelvinntk-sm17@student.tarc.edu.my", TxtEmail.Text);
                mm.Subject = "Your Password !";
                mm.Body = "Hello, <a href='" + href + "'>HERE</a> to change you password";
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential nc = new NetworkCredential();
                nc.UserName = "kelvinntk-sm17@student.tarc.edu.my";
                nc.Password = "11221999Bb";

                smtp.UseDefaultCredentials = true;
                smtp.Credentials = nc;
                smtp.Port = 587;
                smtp.Send(mm);
                Labelmsg.Text = "Your Password has been sent to " + TxtEmail.Text;
                Labelmsg.ForeColor = Color.Green;
            }
            else
            {
                Labelmsg.Text = TxtEmail.Text + " This email ID is not exixts in our database ! ";
            }
        }
    }
}