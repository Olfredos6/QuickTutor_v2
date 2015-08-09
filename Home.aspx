<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 170px;
            height: 74px;
        }
        .auto-style2 {
            height: 25px;
            width: 504px;
        }
    </style>
</head>
<body align="center">
    <%
        //Let fill up the values of the stats
        //first, the global object of the Diplayerr class
        Displayer objDisplayer = new Displayer();

        lblTotSubject.Text = Convert.ToString(objDisplayer.TotalSubject());
        lblTotTutoring.Text = Convert.ToString(objDisplayer.TotalTutoring());
        lblTotTutor.Text = Convert.ToString(objDisplayer.TotalTutor());
         %>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="Andalus" Font-Size="XX-Large" Font-Underline="True" ForeColor="#FFCC00" Text="QuickTutor" BackColor="White" BorderColor="White" BorderWidth="0px" OnClick="Button1_Click" />
        <asp:TextBox ID="tboxSubjectToSearch" placeholder="Enter a subject to search" runat="server" Width="303px" AutoCompleteType="Disabled"></asp:TextBox>
        <asp:Button ID="btSearch" runat="server" BackColor="#FFCC00" BorderColor="#FFCC00" BorderWidth="0px" ForeColor="White" Text="search" Font-Names="Andalus" OnClick="btSearch_Click" TabIndex="1" />       
    </div>
    <div>
        <table align="center" cellspacing="4px" style="width:520px; vertical-align:top; font-family:Andalus; color:#FFCC00; border:0px">
            <tr>
                <td style="background-color: aliceblue; font-size:14px; " class="auto-style1">
                    <asp:Label ID="lblTotSubject" runat="server" Text="Label"></asp:Label>
&nbsp;Subjects Already<br />
                    <asp:Button ID="Button2" runat="server" Text="see all subjects" BackColor="#FFCC00" BorderWidth="0px" Font-Names="Andalus" Font-Size="11pt" ForeColor="White" />
                </td >
                <td style="background-color: aliceblue; font-size:14px; width:300px" class="auto-style1">
                    <asp:Label ID="lblTotTutoring" runat="server" Text="Label"></asp:Label>
&nbsp;Students helped, what about you?<br />
                    <asp:Button ID="Button4" runat="server" Text="connect to your space" BackColor="#FFCC00" BorderWidth="0px" Font-Names="Andalus" Font-Size="11pt" ForeColor="White" OnClick="Button4_Click" /> 
                </td>
                <td style="background-color: aliceblue; font-size:14px; " class="auto-style1">
                    <asp:Label ID="lblTotTutor" runat="server" Text="Label"></asp:Label>
&nbsp;Tutors to help you<br />
                    <asp:Button ID="Button3" runat="server" Text="see all tutors" BackColor="#FFCC00" BorderWidth="0px" Font-Names="Andalus" Font-Size="11pt" ForeColor="White" />
                </td>
            </tr>
        </table>
        <table align="center" border="0" style="background-color: aliceblue; width:520px; vertical-align:top; font-family: Andalus; color: #000000; text-align: left;">
            <tr>
                <td class="auto-style2">
                    
                    <asp:Image ID="Image1" runat="server" />
                    <% Response.WriteFile("news.html"); %>
                </td>
            </tr>
        </table>
        </div>
        <div><br/>
        <table align="center" border="0" style="background-color: aliceblue; width:520px; vertical-align:top; font-family: Andalus; color: #000000; text-align: left;">
            <tr>
                <td>
                    <% //Vote of the tutor of the month
                      Displayer objDisplayer = new Displayer();                       
                       string pseudo, subject;
                       int credit;
                       objDisplayer.TutorOfTheMonth(out pseudo, out subject, out credit);
                       %>
                    Tutor of the month award goes to <% Response.Write(pseudo); %>
                    with a credit of <% Response.Write(credit); %> from his tutoring in <% Response.Write(subject); %>.
                </td>
            </tr>
        </table>
    </div>
    </form>
    <footer>
        <asp:Label ID="Label1" runat="server" Text="by Balukidi Nehemie, Copyright 2015" Font-Names="Andalus" ForeColor="Gray"></asp:Label>
        <br/>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="about.aspx" ForeColor="Gray">Contact</asp:HyperLink>
    </footer>
</body>
</html>
