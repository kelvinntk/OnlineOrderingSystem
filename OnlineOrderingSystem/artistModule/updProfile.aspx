<%@ Page Title="" Language="C#" MasterPageFile="~/artistModule/artist.Master" AutoEventWireup="true" CodeBehind="updProfile.aspx.cs" Inherits="ArtModule.updProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:60%;margin-left:20%;background-color:rgba(200,200,200,.5);">
        <tr>
            <td colspan="2"><center>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Edit Artist's Profile"></asp:Label>
            </center></td>
        </tr>
        <tr>
            <td>Artist ID :</td>
            <td>
                <asp:TextBox ID="idbox" runat="server" Enabled="False" style="background-color:gray"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Email :</td>
            <td>
                <asp:TextBox ID="emailbox" runat="server" CausesValidation="True" AutoPostBack="True" style="background-color:gray" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>First Name :</td>
            <td>
                <asp:TextBox ID="fnbox" runat="server" CausesValidation="True" AutoPostBack="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="First name required" ControlToValidate="fnbox" Style="color:red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Last Name :</td>
            <td>
                <asp:TextBox ID="lnbox" runat="server" CausesValidation="True" AutoPostBack="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Last name required" ControlToValidate="lnbox" Style="color:red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Contact No :</td>
            <td>
                <asp:TextBox ID="cbox" runat="server" CausesValidation="True" AutoPostBack="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Contact number required" ControlToValidate="cbox" Style="color:red">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter a valid contact no" ControlToValidate="cbox" Style="color:red" 
            ValidationExpression="\d{3}-\d{7,8}">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Address :</td>
            <td>
                <asp:TextBox ID="addressbox" runat="server" CausesValidation="True" AutoPostBack="True" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Address required" ControlToValidate="addressbox" Style="color:red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:TextBox ID="passbox" runat="server" style="background-color:gray" Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" Style="text-align:center"/>
            </td>
        </tr>
        </table>
</asp:Content>
