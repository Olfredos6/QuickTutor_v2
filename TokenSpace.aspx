<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TokenSpace.aspx.cs" Inherits="TokenSpace" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body align="center">
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="Andalus" Font-Size="XX-Large" Font-Underline="True" ForeColor="#FFCC00" Text="QuickTutor" BackColor="White" BorderColor="White" BorderWidth="0px" OnClick="Button1_Click"/>
        <asp:TextBox ID="tboxSubjectToSearch" placeholder="Enter a subject to search" runat="server" Width="303px" AutoCompleteType="Disabled"></asp:TextBox>
        <asp:Button ID="btSearch" runat="server" BackColor="#FFCC00" BorderColor="#FFCC00" BorderWidth="0px" ForeColor="White" Text="search" Font-Names="Andalus" OnClick="btSearch_Click" />  
        <br />
    </div>
        <asp:Label ID="lblError" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
        <br />
    <div>
        <table align="center" style="vertical-align:top">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Your Token"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tboxToken" runat="server"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td align="right">
                    
                </td>
                <td align="left">
                    <asp:Button ID="Button2" runat="server" Text="connect" BackColor="#FFCC00" BorderWidth="0px" Font-Names="Andalus" Font-Size="11pt" ForeColor="White" OnClick="Button2_Click" />
                    &nbsp;<asp:Button ID="Button3" runat="server" Text="forgotten/lost?" BackColor="#FFCC00" BorderWidth="0px" Font-Names="Andalus" Font-Size="11pt" ForeColor="White" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
