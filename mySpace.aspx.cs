using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

//Session variables
/*********************************************
 *      Session["openedSpaceToken"]
        Session["openedSpaceMail"]
        Session["openedSpaceTutor"]
        Session["openedSpaceSubject"]
        Session["openedSpaceDate"]
 *              btLogOut.Visible = true;
    btRedirect.Visible = true;   
 *********************************************/
   
public partial class mySpace : System.Web.UI.Page
{
    /***************
 * At this level, we only the session variabes to contain only information about
 * the actual connected token, so we clean every session variables existing
 * to avoid any mess.
 * ***********************/
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            tboxToken.Text = Session["openedSpaceToken"].ToString().TrimEnd();
            tboxMail.Text = Convert.ToString(Session["openedSpaceMail"]).TrimEnd();
            tboxDate.Text = Session["openedSpaceDate"].ToString().TrimEnd();
            tboxSubject.Text = Session["openedSpaceSubject"].ToString().TrimEnd();
            tboxTutor.Text = Session["openedSpaceTutor"].ToString().TrimEnd();
            tboxConfirmMail.Text.TrimEnd();
            //Response.Write(Session["openedSpaceToken"]);
            //Response.Write();
            Response.Write(Session["openedSpaceMail"]);
        }
    }
    protected void btSearch_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("search.aspx");
    }
    protected void btLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Home.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void btChangeMail_Click(object sender, EventArgs e)
    {
        /****************************************************
         * Here, we update the user email
         * **************************************************
         */
        if (tboxConfirmMail.Text == "" || tboxMail.Text == "")
        {

            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = "You must fill in both boxes";
            lblError.Visible = true;
        }
        else
        {
            if (tboxConfirmMail.Text == tboxMail.Text)
            {
                Session["transitMail"] = tboxConfirmMail.Text;
                //Connect to ToknSpace and change the value since both are equal
                //con string
                string conString = @"Data Source = .\SqlExpress; Initial Catalog = QuickTutor; Integrated Security = true";

                //Con object
                SqlConnection conObject = new SqlConnection(conString);

                //query string
                string updateQry = "update TokenSpace set Mail=@Mail where (Token=@Token)";

                //comand object
                SqlCommand cmdObject = new SqlCommand(updateQry, conObject);

                //parameters
                cmdObject.Parameters.Add("@Token", SqlDbType.Char).Value = Convert.ToString(Session["openedSpaceToken"]);
                cmdObject.Parameters.Add("@Mail", SqlDbType.Char).Value = tboxConfirmMail.Text;

                //Open connection
                conObject.Open();

                //Execute cmd
                cmdObject.ExecuteNonQuery();

                //Close connection
                conObject.Close();


                //FeedBack
                lblError.Visible = true;
                lblError.ForeColor = System.Drawing.Color.Green;
                lblError.Text = "Mail changed successfully";
                tboxConfirmMail.Text = "";
                tboxMail.Text = Session["transitMail"].ToString();
            }
            else {
                //FeedBack
                lblError.Visible = true;
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = "Both values must be the same";
            }

        }
    }
}