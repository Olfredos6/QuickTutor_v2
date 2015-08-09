<%@ Page Language="C#" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body align="center">
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="Andalus" Font-Size="XX-Large" Font-Underline="True" ForeColor="#FFCC00" Text="QuickTutor" BackColor="White" BorderColor="White" BorderWidth="0px" OnClick="Button1_Click"/>
           <table align="center" style="vertical-align:top">
               <tr>
                   <td><asp:Label ID="lab" runat="server" Text="Your Mail"></asp:Label></td>
                   <td><asp:TextBox ID="txtFrom" runat="server"></asp:TextBox></td>
               </tr>
               <tr>
                   <td><asp:Label ID="Label3" runat="server" Text="Subject"></asp:Label></td>
                   <td><asp:TextBox ID="txtSubject" runat="server"></asp:TextBox></td>
               </tr>
               <tr>
                   <td><asp:Label ID="Label4" runat="server" Text="Body"></asp:Label></td>
                   <td><asp:TextBox ID="txtBody" runat="server" Height="54px" TextMode="MultiLine" Width="236px"></asp:TextBox></td>
               </tr>
               <tr>
                   <td></td>
                   <td>
                       <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click1" Text="Button" />
                       <br />
                       <asp:Label ID="litStatus" runat="server" Text="Label"></asp:Label>
                   </td>
               </tr>
           </table> 
    </div>
    </form>
</body>
</html>
