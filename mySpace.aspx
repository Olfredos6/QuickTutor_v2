<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mySpace.aspx.cs" Inherits="mySpace" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body align="center">
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="Andalus" Font-Size="XX-Large" Font-Underline="True" ForeColor="#FFCC00" Text="QuickTutor" BackColor="White" BorderColor="White" BorderWidth="0px" OnClick="Button1_Click" />
        <asp:TextBox ID="tboxSubjectToSearch" runat="server" Width="251px" AutoCompleteType="Disabled" Enabled="False" ForeColor="Red">You can only use one token for one subject</asp:TextBox>
        <asp:Button ID="btSearch" runat="server" BackColor="#FFCC00" BorderColor="#FFCC00" BorderWidth="0px" ForeColor="White" Text="logout and search" Font-Names="Andalus" OnClick="btSearch_Click" /> 
    &nbsp;<asp:Button ID="btLogout" runat="server" BackColor="#FFCC00" BorderWidth="0px" Font-Names="Andalus" ForeColor="White" OnClick="btLogout_Click" Text="logout" />
    </div>
        <table align="center" style="vertical-align:top; width:600px; text-align:left">
            <tr>
                <td style="background-color:#FFCC00; color:white">
                    Welcome! Here are all information about your space and the associated token :
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Token number" Width="95px"></asp:Label>
&nbsp;<asp:TextBox ID="tboxToken" runat="server" BackColor="#FFCC00" Enabled="False" Font-Names="Andalus" ForeColor="White" ReadOnly="True"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Backup mail" Width="95px"></asp:Label>
&nbsp;<asp:TextBox ID="tboxMail" runat="server"></asp:TextBox>
                    <asp:TextBox ID="tboxConfirmMail" runat="server"></asp:TextBox>
                    <asp:Button ID="btChangeMail" runat="server" BorderWidth="0px" Text="change mail" OnClick="btChangeMail_Click" />
                    <br />
                    <asp:Label ID="Label6" runat="server" Width="95px"></asp:Label>
&nbsp;<asp:Label ID="lblError" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Created on" Width="95px"></asp:Label>
&nbsp;<asp:TextBox ID="tboxDate" runat="server" BackColor="#FFCC00" Enabled="False" Font-Names="Andalus" ForeColor="White" ReadOnly="True"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Subject" Width="95px"></asp:Label>
&nbsp;<asp:TextBox ID="tboxSubject" runat="server" BackColor="#FFCC00" Enabled="False" Font-Names="Andalus" ForeColor="White" ReadOnly="True"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="Tutor" Width="95px"></asp:Label>
&nbsp;<asp:TextBox ID="tboxTutor" runat="server" BackColor="#FFCC00" Enabled="False" Font-Names="Andalus" ForeColor="White" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <hr style="width:600px; color:black" />
    </form>
</body>
</html>
