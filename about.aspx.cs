using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using System.Net;

public partial class about : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        try
        {
            MailMessage message = new MailMessage(txtFrom.Text, "alfred.nehemie@gmail.com", txtSubject.Text, txtBody.Text);
            SmtpClient emailClient = new SmtpClient();
            emailClient.Host = "smtp.gmail.com";
            emailClient.UseDefaultCredentials = false;
            emailClient.Credentials = new NetworkCredential("alfred.nehemie@gmail.com", "//TheobroMagema94//");
            emailClient.EnableSsl = true;
            emailClient.Send(message);
            litStatus.Text = "Message Sent";
        }
        catch (Exception ex)
        {
            //litStatus.Text = ex.ToString();
            Response.Write("<br/><br/>");
            litStatus.Text = "This service is not yet 100% working";
        }
    }
}