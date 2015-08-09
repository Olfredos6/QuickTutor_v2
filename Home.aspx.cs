using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btSearch_Click(object sender, EventArgs e)
    {
        //Test the search string
        if (tboxSubjectToSearch.Text == "")
        {
            tboxSubjectToSearch.Text = "Please fill this field with a subject to search";
            tboxSubjectToSearch.ForeColor = System.Drawing.Color.Red;
        }
        else {
            //Tutors BACKDOOR
            if (tboxSubjectToSearch.Text.ToLower() == "i am a tutor")
            {
                Response.Redirect("login.aspx");
            }
            //Normal SEARCH
            else {
                Session["subjectToSearch"] = tboxSubjectToSearch.Text;
                Response.Redirect("search.aspx");
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("TokenSpace.aspx");
    }
}