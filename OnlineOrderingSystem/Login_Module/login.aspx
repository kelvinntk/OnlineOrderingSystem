<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Login_Module.Login_Module.login" MasterPageFile="~/Login_Module/loginMaster.Master" %>

<asp:Content ID="customerHome" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">

    <br /><br />

    <table class="login" style="width: 50%; margin: auto;">
        <tr>
            <td colspan="2">
                <br />
                <div align="center">
                    <h1>Login</h1>
                </div>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Email:&nbsp;</td>
            <td class="auto-style2">
                &nbsp;<asp:TextBox ID="TextBox1" runat="server" Width="250px"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="Email is required!" 
                            ControlToValidate="TextBox1"
                            CssClass="ValidationError" ForeColor="Red"
                    ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Password:&nbsp;</td>
            <td class="auto-style2">
                &nbsp;<asp:TextBox ID="TextBox2" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="Password is required!" 
                            ControlToValidate="TextBox2"
                            CssClass="ValidationError" ForeColor="Red"
                    ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">

                <div align="center">

                    <br />

                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>

                    <br />

                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login_Module/forgetPassword.aspx">Forgotten your password?</asp:HyperLink>

                    <br/>

                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/registerModel/selectRegis.aspx">Create a new account</asp:HyperLink>

                    <br/><br/>

                <asp:Button ID="Button1" runat="server" style="padding:0.3em;" OnClick="Button1_Click" Text="Log In" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="0.1em" Font-Size="1.75em" ForeColor="Black" />

                    <br /><br /><br />

                    </div>

            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">

        .auto-style2 {
            height: 34px;
        }

        .login {
            border: 0.1em solid black;
        }

        .auto-style3 {
            height: 34px;
            text-align: right;
            width: 226px;
        }
        .auto-style4 {
            text-align: right;
            width: 226px;
        }

    </style>
</asp:Content>

