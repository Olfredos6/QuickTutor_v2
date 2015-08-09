using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

public partial class search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        //BACKDOOR vs NORMAL SEARCH
        if (tboxSubjectToSearch.Text.ToLower() == "i am a tutor") { Response.Redirect("login.aspx"); }
        else{

        ///////SEARCH STARTS//////////
        //con string
        string conString = @"Data Source = .\sqlExpress; Initial Catalog = QuickTutor; Integrated Security = True";

        //con obj
        SqlConnection conObject = new SqlConnection(conString);

        //querystring
        string qrySelect = "select count(*) from Subjects where (Name=@Name)";

        //Commmand Object
        SqlCommand cmdObject = new SqlCommand(qrySelect, conObject);

        //parameters
        cmdObject.Parameters.Add("Name", SqlDbType.Char).Value = Convert.ToString(Session["subjectToSearch"]);

        //open connection
        conObject.Open();

        //Execute 4
        int searchCount = Convert.ToInt16(cmdObject.ExecuteScalar());//How many tutors ??

        if (searchCount > 0)//One or many tutors
        {
            lblSearchFeedBack.Visible = true;
            lblSearchFeedBack.ForeColor = System.Drawing.Color.FromArgb(255, 204, 0);
            lblSearchFeedBack.Text = "Search result for " + Session["subjectToSearch"].ToString() + " : " + searchCount + " Tutors in this subject";

            //Send trigger to list all the subject's tutors 
            Session["listingTrigger"] = "ok";
            //Session["subjectToSearch"] = "";(this was causing readTutor to be empty)


        }
        else {
            //lblSearchFeedBack.Text = "No results";
            Session["listingTrigger"] = "not ok";
            lblSearchFeedBack.ForeColor = System.Drawing.Color.Red;
            lblSearchFeedBack.Visible = true;
        }

        //Close the connection
        conObject.Close();
        }//END OF BACKDOOR VS NORMAL SEARCH 
    }
    protected void btSearch_Click(object sender, EventArgs e)
    {
        //Test the search string
        if (tboxSubjectToSearch.Text == "")
        {
            tboxSubjectToSearch.Text = "Please fill this field with a subject to search";
            tboxSubjectToSearch.ForeColor = System.Drawing.Color.Red;
            lblSearchFeedBack.Visible = false;
        }
        else
        {
            //Tutors BACKDOOR
            if (tboxSubjectToSearch.Text.ToLower() == "i am a tutor")
            {
                Response.Redirect("login.aspx");
            }
            //Normal SEARCH
            else
            {
                Session["subjectToSearch"] = tboxSubjectToSearch.Text;
                Response.Redirect("search.aspx");
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }

    //This Method creates a token number
    public string TokenGenerator()
    {
        char[] chars = new char[62]; 
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".ToCharArray(); 
        byte[] data = new byte[1]; 
        using (RNGCryptoServiceProvider crypto = new RNGCryptoServiceProvider()) { 
            crypto.GetNonZeroBytes(data); 
            data = new byte[8]; 
            crypto.GetNonZeroBytes(data); 
        } StringBuilder result = new StringBuilder(8); 
        foreach (byte b in data) { 
            result.Append(chars[b % (chars.Length)]); 
        } 
        return result.ToString(); 
    }
    protected void btSubmit_Click(object sender, EventArgs e)
    { 
            //==We save the token==//
            //con string
            string conString = @"Data Source = .\SqlExpress; Initial Catalog = QuickTutor; Integrated Security = true";

            //Con object
            SqlConnection conObject = new SqlConnection(conString);

            //query string
            string insertQry = "insert into TokenSpace values(@Token, @Mail, @Tutor, @Subject ,@Date)";

            //comand object
            SqlCommand cmdObject = new SqlCommand(insertQry, conObject);

            //parameters
            cmdObject.Parameters.Add("@Token", SqlDbType.Char).Value = Convert.ToString(Session["saveToken"]);
            cmdObject.Parameters.Add("@Tutor", SqlDbType.Char).Value = Convert.ToString(Session["saveTutor"]);
            cmdObject.Parameters.Add("@Subject", SqlDbType.Char).Value = Convert.ToString(Session["saveSubject"]);
            cmdObject.Parameters.Add("@Mail", SqlDbType.Char).Value = Convert.ToString(Session["saveEmail"]);
            DateTime dateAtRegistration = DateTime.Now;
            cmdObject.Parameters.Add("@Date", SqlDbType.DateTime).Value = dateAtRegistration;

            //Open connection
            conObject.Open();

            //Execute cmd
            cmdObject.ExecuteNonQuery();

            //Close connection
            conObject.Close();

            //The registration made with success, redirect to his new space
            //but first, register the ession values so the user can log in 
            //automaticaly into that space
            Session["openedSpaceToken"] = Session["saveToken"];
            Session["openedSpaceMail"] = Session["saveEmail"];
            Session["openedSpaceTutor"] = Session["saveTutor"];
            Session["openedSpaceSubject"] = Session["saveSubject"];
            Session["openedSpaceDate"] = dateAtRegistration;
            Response.Redirect("TokenSpace.aspx");
        
    }
    protected void btAbort_Click(object sender, EventArgs e)
    {
        Response.Redirect("search.aspx");
    }
}