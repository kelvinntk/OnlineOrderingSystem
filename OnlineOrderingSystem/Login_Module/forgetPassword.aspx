<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgetPassword.aspx.cs" Inherits="OnlineOrderingSystem.Login_Module.forgetPassword" MasterPageFile="~/Login_Module/loginMaster.Master"  %>

<asp:Content ID="customerHome" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">


    <style type="text/css">
        .auto-style1 {
            /*width: 50%;
            height: 433px;*/
        }
        .auto-style2 {
            /*width: 50%;
            height: 476px;*/
        }
        .auto-style3 {
            /*width: 54%;
            height: 562px;*/
        }
        .textboxes {
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
    </style>
    
    <br /><br /><br />
   
        <div>
            <div class="auto-style3" style="border-style: solid; border-color: inherit; text-align:center;">
                <br />
                <h1 style="font-family: 'Poppins'; font-size: xx-large; font-weight: normal; font-style: normal; font-variant: normal; text-transform: inherit; color: #000000">
                    <asp:Image ID="Image1" runat="server" Height="111px" Width="122px" ImageUrl="~/Login_Module/images/i.png" />
                    &nbsp;Reset Password</h1>
                <p>Please enter your email address to request a password reset.</p>
                <br />
                <span class="auto-style1">
                <br />
                EMAIL ADDRESS&nbsp;:&nbsp; <br />
                <asp:TextBox placeholder="********" class="textboxes" ID="TxtEmail" runat="server" Width="426px" Height="45px" Text='<%# Bind("Email") %>'></asp:TextBox>
                <br />
                </span><br />
                <span class="auto-style2">
                <asp:Button ID="BtnPwd" runat="server" Text="Request Password" OnClick="BtnPwd_Click" BackColor="#3399FF" BorderColor="#CCFFFF" ForeColor="#CCFFFF" Height="50px" Width="263px"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <br />
                </span><br />
                <span class="auto-style3">
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
                </span>

            </div>
        </div>
    <br /><br /><br />
    
</asp:Content>
