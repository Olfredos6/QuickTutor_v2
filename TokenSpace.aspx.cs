using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class TokenSpace : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /**********************************************
         * In this method, we must check if  Session["openedSpaceToken"] is loaded
         * with some value but alos if that value exists int hte database
         * ********************************************/
        //Response.Write(Session["openedSpaceToken"]);
        //con string
        string conString = @"Data Source = .\SqlExpress; Initial Catalog = QuickTutor; Integrated Security = true";

        //connection object
        SqlConnection conObject = new SqlConnection(conString);

        //qry string
        string qrySel = "select count(*) from TokenSpace where (Token=@Token)";

        //cmd object
        SqlCommand cmdObject = new SqlCommand(qrySel, conObject);

        //parameters
        cmdObject.Parameters.Add("Token", SqlDbType.Char).Value = Convert.ToString(Session["openedSpaceToken"]);

        //open connection
        conObject.Open();

        //execute 4
        int count = Convert.ToInt16(cmdObject.ExecuteScalar());
        if (count == 0)
        {
            //Show him the page content
            Session["showLogInPart"] = "yes";
        }
        else { 
            //don't show him the log in part, direct him to mySpace
            Response.Redirect("mySpace.aspx");
            
        }

        //close con
        conObject.Close();

        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void btSearch_Click(object sender, EventArgs e)
    {
        //Test the search string
        if (tboxSubjectToSearch.Text == "")
        {
            tboxSubjectToSearch.Text = "Please fill this field with a subject to search";
            tboxSubjectToSearch.ForeColor = System.Drawing.Color.Red;
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        //check if the user exist. If he does, we log him in
        //Else, we propose him to request a token by
        //con string
        string conString = @"Data Source = .\SqlExpress; Initial Catalog = QuickTutor; Integrated Security = true";

        //connection object
        SqlConnection conObject = new SqlConnection(conString);

        //qry string
        string qrySelect = "select * from TokenSpace where (Token=@Token)";

        //cmd object
        SqlCommand cmdObject = new SqlCommand(qrySelect, conObject);

        //parameters
        cmdObject.Parameters.Add("Token", SqlDbType.Char).Value = tboxToken.Text;

        //Open connection
        conObject.Open();

        //Execute cmd
        SqlDataReader readToken = cmdObject.ExecuteReader();

        if (readToken.Read())
        {
            Session.Clear();
            //Assign values to sessions for the actual opened space  
            Session["openedSpaceToken"] = Convert.ToString(readToken["Token"]);
            Session["openedSpaceMail"] = Convert.ToString(readToken["Mail"]);
            Session["openedSpaceTutor"] = Convert.ToString(readToken["Tutor"]);
            Session["openedSpaceSubject"] = Convert.ToString(readToken["Subject"]);
            Session["openedSpaceDate"] = Convert.ToDateTime(readToken["Date"]);
            Response.Redirect("mySpace.aspx");
        }
        else {
            tboxSubjectToSearch.Text = "Start from here!!";
            lblError.Text = "The token entered does not have any linked space.</br>To have one that does, please proceed by entering a subject of your choice in the search bar and clicking on \"seaech\"";
            lblError.Visible = true;
        }
        //Close the connection
        conObject.Close();

    }
}