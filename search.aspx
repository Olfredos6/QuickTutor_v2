<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body align="center">
    <form id="form1" runat="server" method="get" action="search.aspx">
    <div>
        <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="Andalus" Font-Size="XX-Large" Font-Underline="True" ForeColor="#FFCC00" Text="QuickTutor" BackColor="White" BorderColor="White" BorderWidth="0px" OnClick="Button1_Click" />
        <asp:TextBox ID="tboxSubjectToSearch" placeholder="Enter a subject to search" runat="server" Width="303px" AutoCompleteType="Disabled"></asp:TextBox>
        <asp:Button ID="btSearch" runat="server" BackColor="#FFCC00" BorderColor="#FFCC00" BorderWidth="0px" ForeColor="White" Text="search" Font-Names="Andalus" OnClick="btSearch_Click" /> 
    
    </div>
        <div>
            <asp:Label ID="lblSearchFeedBack" runat="server" Text="No results" Width="360px" Visible="False"></asp:Label>
            <%string subjectToSearch = "";
              //Form submission of the chosen tutor
                if (Request.QueryString.Count == 0)
                {
                    //Response.Write("THat thing is empty");
                }
                else {
                    Session["listingTrigger"] = "request";
                    
                }

                 %>            <%//check if the trigger from asp.cs is on ok
                subjectToSearch = Convert.ToString(Session["subjectToSearch"]); //Just to keep track of the subject
                if (Convert.ToString(Session["listingTrigger"]) == "ok") {
                    Response.Write("<input type='submit' value='Request selected tutoring'>");
                    //We list the tutors and we change the trigger at the end of the listing
                    //See before the "}" of the if
///////////////////////////////////////////////////////////////////////////////////////////////////
                    //con string
                    string conString = @"Data Source = .\sqlExpress; Initial Catalog = QuickTutor; Integrated Security = True";

                    //con obj
                    System.Data.SqlClient.SqlConnection conObject = new System.Data.SqlClient.SqlConnection(conString);

                    //querystring
                    string qrySelect = "select * from Subjects where (Name=@Name)";

                    //Commmand Object
                    System.Data.SqlClient.SqlCommand cmdObject = new System.Data.SqlClient.SqlCommand(qrySelect, conObject);

                    //parameters
                    cmdObject.Parameters.Add("Name", System.Data.SqlDbType.Char).Value = Convert.ToString(Session["subjectToSearch"]);

                    //open connection
                    conObject.Open();

                    //Execute 4
                    System.Data.SqlClient.SqlDataReader readTutor = cmdObject.ExecuteReader();
                    Response.Write("<br/>");
                    Response.Write("<hr style='width:520px; height:1px; background-color:#FFCC00'/>");
                    Response.Write("<table align='center' style = 'width :520px;text-orientation:sideways-left'>");
                    //Top(Header fields) of the table
                    Response.Write("<tr>");
                    Response.Write("<td bgcolor='#FFCC00' style='color:white'>Profile</td>");
                    Response.Write("<td bgcolor='#FFCC00' style='color:white'>About</td>");
                    Response.Write("<td bgcolor='#FFCC00' style='color:white'>Choose</td>");
                    Response.Write("</tr>");
                    while(readTutor.Read()){
                        Response.Write("<tr>");

                        Response.Write("<td align='left'>");
                        //Photo 30x30
                        Response.Write("</td>");

                        Response.Write("<td align='left'>");
                        //Name and credit
                        Response.Write("Name : " + readTutor["Pseudo"] + "<br/>Credit : " + readTutor["Credit"]);
                        Response.Write("</td>");

                        Response.Write("<td align='center'>");
                        Response.Write("<input type='radio' name='tutorChosen' value='" + readTutor["Pseudo"] + "'>");
                        Response.Write("</td>");
                        
                        Response.Write("</tr>");
                    }
                    Response.Write("</table");
                    
                        //Close the reader
                    readTutor.Close();
                    
                    //Close the connection
                    conObject.Close();
///////////////////////////////////////////////////////////////////////////////////////////////////
                                   
                    //Changing of the trigger and saving some data
                    Session["listingTrigger"] = "not ok"; 
                    //Session.Clear();
                }
                    //IF SERACHING AND NOT LOGGED IN
                else if (Convert.ToString(Session["listingTrigger"]) == "request" && Session["openedSpaceToken"] == "")
                {
                    //We provide a Token, create the space in relation with that token(register)
                    string token = TokenGenerator();
                    Response.Write("<br/>");
                    %><asp:Label ID="Label5" runat="server" Text="Please, keep safely the value of your token. That token will help you connect to your space and stay in contact with your tutor" Font-Names="Andalus" ForeColor="Red" Height="60px" Width="520px"></asp:Label>
            <%////////////////////////////////////////////////////////
                    
                    Session["saveSubject"] = subjectToSearch;
                    Session["saveToken"] = token;
                    Session["saveTutor"] = Request.QueryString["tutorChosen"];
                /////////////////////////////////////////////////////////
                    tboxSubject.Text = subjectToSearch;
                    tboxToken.Text = token;
                    tboxTutor.Text = Request.QueryString["tutorChosen"];
                    Response.Write("<hr style='width:520px; height:1px; background-color:#FFCC00'/>");
                    %>
            &nbsp;<br />
            <asp:Label ID="Label2" runat="server" Text="Token" Font-Names="Andalus" ForeColor="#FFCC00"></asp:Label>
            &nbsp;<asp:TextBox ID="tboxToken" runat="server" Enabled="False"></asp:TextBox><br />
            <asp:Label ID="Label3" runat="server" Text="Tutor" Font-Names="Andalus" ForeColor="#FFCC00"></asp:Label>
            &nbsp;<asp:TextBox ID="tboxTutor" runat="server" Enabled="False"></asp:TextBox><br />
            <asp:Label ID="Label4" runat="server" Text="Subject" Font-Names="Andalus" ForeColor="#FFCC00"></asp:Label>
            &nbsp;<asp:TextBox ID="tboxSubject" runat="server" Enabled="False"></asp:TextBox><br />
            <asp:Button ID="btSubmit" runat="server" Text="Submit" Font-Names="Andalus" BackColor="#FFCC00" ForeColor="#FFFFFF" BorderWidth="0" OnClick="btSubmit_Click"/>
            &nbsp;<asp:Button ID="btAbort" runat="server" Text="Abort" Font-Names="Andalus" BackColor="#FFCC00" ForeColor="#FFFFFF" BorderWidth="0" OnClick="btAbort_Click"/>
            <%
                    
                }
                //IF SERACHING AND LOGGED IN
          else if (Convert.ToString(Session["listingTrigger"]) == "request" && Session["openedSpaceToken"] != "")
                {
                    //We provide a Token, create the space in relation with that token(register)
                    string token = TokenGenerator();
                    Response.Write("<br/>");
                    %><asp:Label ID="Labele" runat="server" Text="Please, keep safely the value of your token. That token will help you connect to your space and stay in contact with your tutor" Font-Names="Andalus" ForeColor="Red" Height="60px" Width="520px"></asp:Label>
            <%////////////////////////////////////////////////////////
                    
                    Session["saveSubject"] = subjectToSearch;
                    Session["saveToken"] = token;
                    Session["saveTutor"] = Request.QueryString["tutorChosen"];
                /////////////////////////////////////////////////////////
                    tboxSubject2.Text = subjectToSearch;
                    tboxToken2.Text = token;
                    tboxTutor2.Text = Request.QueryString["tutorChosen"];
                    Response.Write("<hr style='width:520px; height:1px; background-color:#FFCC00'/>");
                    %>
            &nbsp;<br />
            <asp:Label ID="Labelb" runat="server" Text="Token" Font-Names="Andalus" ForeColor="#FFCC00"></asp:Label>
            &nbsp;<asp:TextBox ID="tboxToken2" runat="server" Enabled="False"></asp:TextBox><br />
            <asp:Label ID="Labelc" runat="server" Text="Tutor" Font-Names="Andalus" ForeColor="#FFCC00"></asp:Label>
            &nbsp;<asp:TextBox ID="tboxTutor2" runat="server" Enabled="False"></asp:TextBox><br />
            <asp:Label ID="Labeld" runat="server" Text="Subject" Font-Names="Andalus" ForeColor="#FFCC00"></asp:Label>
            &nbsp;<asp:TextBox ID="tboxSubject2" runat="server" Enabled="False"></asp:TextBox><br />
            <asp:Button ID="btSubmit2" runat="server" Text="Submit" Font-Names="Andalus" BackColor="#FFCC00" ForeColor="#FFFFFF" BorderWidth="0" OnClick="btSubmit_Click"/>
            &nbsp;<asp:Button ID="btAbort2" runat="server" Text="Abort" Font-Names="Andalus" BackColor="#FFCC00" ForeColor="#FFFFFF" BorderWidth="0" OnClick="btAbort_Click"/>
            <%
                    
                }
                 %>
        </div>
    </form>
</body>
</html>
