<%@ Page Title="" Language="C#" MasterPageFile="~/staffModule/staff.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="ItemModule.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:50%;margin-left:25%;background-color:rgba(200,200,200,.5);">
        <tr>
            <td colspan="2"><center>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Staff's Profile"></asp:Label>
            </center></td>
        </tr>
        <tr>
            <td>Staff ID :</td>
            <td>
                <asp:Label ID="idbox" runat="server" Enabled="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Email :</td>
            <td>
                <asp:Label ID="emailbox" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>First Name :</td>
            <td>
                <asp:Label ID="fnbox" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Last Name :</td>
            <td>
                <asp:Label ID="lnbox" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Contact No :</td>
            <td>
                <asp:Label ID="cbox" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Address :</td>
            <td>
                <asp:Label ID="addressbox" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>

                <asp:Label ID="Label2" runat="server" Text="Old Password :" Visible="False"></asp:Label>

            </td>
            <td>

                <asp:TextBox ID="TextBox2" runat="server" Visible="false" TextMode="Password"></asp:TextBox>

                <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*" Visible="False"></asp:Label>

            </td>
        </tr>
        <tr>
            <td>

                <asp:Label ID="Label3" runat="server" Text="New Password :" Visible="False"></asp:Label>

            </td>
            <td>

                <asp:TextBox ID="TextBox3" runat="server" Visible="false" TextMode="Password"></asp:TextBox>


                <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*" Visible="False"></asp:Label>


            </td>
        </tr>
        <tr>
            <td colspan=2>

                <asp:Label ID="Label5" runat="server" Text="Wrong old password" Style="text-align:center" Visible="False"></asp:Label>

            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Button5" runat="server" Text="Change" Visible="false" OnClick="Button5_Click"/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Edit" OnClick="Button1_Click" />
          &nbsp;&nbsp;<asp:Button ID="Button3" runat="server" Text="Change Password" OnClick="Button3_Click"/>
            </td>
        </tr>
        <tr>
            <td>

            </td>
            <td>

            </td>
        </tr>
    </table>
</asp:Content>
