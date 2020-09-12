using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.IO;
using System.Data;
using System.Data.SqlClient;

namespace CustomerModule.Customer_Module
{
    /// <summary>
    /// Summary description for ShowImage
    /// </summary>
    public class ShowImage : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            Int32 artID;

            if (context.Request.QueryString["ArtID"] != null)
            {
                artID = Convert.ToInt32(context.Request.QueryString["ArtID"]);
            }
            else
            {
                throw new ArgumentException("No parameter specified");
            }

            context.Response.ContentType = "image/jpeg";

            Stream strm = ShowEmpImage(artID);

            byte[] buffer = new byte[4096];

            int byteSeq = strm.Read(buffer, 0, 4096);

            while (byteSeq > 0)
            {
                context.Response.OutputStream.Write(buffer, 0, byteSeq);
                byteSeq = strm.Read(buffer, 0, 4096);
            }
        }

        public Stream ShowEmpImage(int artID)
        {
            string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            SqlConnection connection = new SqlConnection(conn);

            string sql = "SELECT Image FROM Art WHERE ArtID = @ArtID";

            SqlCommand cmd = new SqlCommand(sql, connection);

            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@ArtID", artID);

            connection.Open();

            object img = cmd.ExecuteScalar();

            try
            {
                return new MemoryStream((byte[])img);
            }
            catch
            {
                return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}