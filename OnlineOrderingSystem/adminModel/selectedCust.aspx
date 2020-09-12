<%@ Page Title="" Language="C#" MasterPageFile="~/adminModel/adminMst.Master" AutoEventWireup="true" CodeBehind="selectedCust.aspx.cs" Inherits="adminModel.adminModel.updateCust" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:50%;margin-left:25%;background-color:rgba(200,200,200,.5);" >
        <tr>
            <td colspan="2"><center>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Customer's Profile"></asp:Label>
            </center></td>
        </tr>
        <tr>
            <td>Customer ID :</td>
            <td>
                <asp:TextBox ID="idbox" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Email :</td>
            <td>
                <asp:TextBox ID="emailbox" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>First Name :</td>
            <td>
                <asp:TextBox ID="fnbox" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Last Name :</td>
            <td>
                <asp:TextBox ID="lnbox" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Contact No :</td>
            <td>
                <asp:TextBox ID="cbox" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Address :</td>
            <td>
                <asp:TextBox ID="addressbox" runat="server" Enabled="False" EnableTheming="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Current Status:</td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Show Order" />
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Change Status" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
