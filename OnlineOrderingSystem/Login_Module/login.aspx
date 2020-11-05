<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Login_Module.Login_Module.login" MasterPageFile="~/Login_Module/loginMaster.Master" %>

<asp:Content ID="customerHome" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">

    <br /><br />

    <div class="container" style="width: 50%; margin: auto;">
        <div>
            <div>
                <br />
                <div>
                    <h1>Login</h1>
                </div>
                <br />
            </div>
        </div>
        <div class="textbox">
            <div class="textboxInput">
                <div class="label">Email</div>
                <div>
                    <asp:TextBox ID="TextBox1" class="textboxes" runat="server" Width="250px" placeholder=' example@mail.com'></asp:TextBox> <br />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="Email is required!" 
                                ControlToValidate="TextBox1"
                                CssClass="ValidationError" ForeColor="Red"
                        ></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="textboxInput">
                <div class="label">Password</div>
                <div>
                    <asp:TextBox ID="TextBox2" class="textboxes" runat="server" Width="250px" TextMode="Password" placeholder=' only you know'></asp:TextBox> <br />
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="Password is required!" 
                                ControlToValidate="TextBox2"
                                CssClass="ValidationError" ForeColor="Red"
                        ></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div>
                <div align="center">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login_Module/forgetPassword.aspx">Forgotten your password?</asp:HyperLink>
                    <br/>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/registerModel/selectRegis.aspx">Create a new account</asp:HyperLink>
                    <br/><br/>
                    <asp:Button ID="Button1" runat="server" style="padding:0.3em;" class="button" OnClick="Button1_Click" Text="Log In" />
                    <br /><br /><br />
                </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .button {
            background-color: white;
            color: black;
            border: 2px solid #555555;
            font-size: 20px;
            font-weight: 600;
            padding-top: 10px;
            padding-bottom: 10px;
            padding-left: 20px;
            padding-right: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 25px 0px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, color 0.3s;
        }
        .button:hover {
            background-color: #555555;
            color: white;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: white;
            padding: 50px;
            border-radius: 5px;
            z-index: 1;
            box-shadow: 0px 0px 25px 0px rgba(0, 0, 0, 0.1);
        }
        .container .textboxInput {
            display: flex; flex-direction: column; align-items: flex-start; justify-content: flex-start;
        }
        .container .textbox .label {
            font-weight: 600;
            font-size: 15px;
        }
        .container .textbox{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .container .textbox .textboxes {
            width: 500px;
            height: 50px;
            padding-left: 15px;
            padding-right: 15px;
            font-weight: 500;
            border: none;
            color: #525952;
            font-size: 17px;
            border-radius: 5px;
            box-shadow: 0px 0px 25px 0px rgba(0, 0, 0, 0.2);
            opacity: 0.75;
            transition: opacity 0.3s;
        }
        .container .textbox .textboxes:hover {
            opacity: 1;
        }
        .container .textbox .textboxes:focus {
            opacity: 1;
            outline: none;
        }

    </style>
</asp:Content>

