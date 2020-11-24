<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs" Inherits="OnlineOrderingSystem.Login_Module.changePassword" MasterPageFile="~/Login_Module/loginMaster.Master"%>

<asp:Content ID="customerHome" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">


    <style type="text/css">
        .auto-style1 {
        }
        .auto-style2 {

        }
        .auto-style3 {

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
                    &nbsp;Change Password</h1>
                <p>Please enter your new password.</p>
                <br />
                <span class="auto-style1">
                    <br />
                    NEW PASSWORD&nbsp;:&nbsp; <br />
                    <asp:TextBox placeholder="********" class="textboxes" TextMode="Password" ID="TxtPass" runat="server" Width="426px" Height="45px" Text='<%# Bind("Password") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password is required." ForeColor="Red" ControlToValidate="TxtPass">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionPassword" runat="server"  
                            ErrorMessage="Password must contain: Minimum 8 characters at least 1 Alphabet and 1 Number"  
                            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ForeColor="Red" ControlToValidate="TxtPass">*
                    </asp:RegularExpressionValidator>
                    <br />
                </span>
                <br />
                <span class="auto-style1">
                    <br />
                    CONFIRM PASSWORD&nbsp;:&nbsp; <br />
                    <asp:TextBox placeholder="********" class="textboxes" TextMode="Password" ID="TxtPass2" runat="server" Width="426px" Height="45px" Text='<%# Bind("Password") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Reconfirm Password is required." ForeColor="Red" ControlToValidate="TxtPass2">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"  
                                ErrorMessage="Reconfirm Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number"  
                                ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ForeColor="Red" ControlToValidate="TxtPass2">*
                    </asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords must match" ControlToValidate="TxtPass" ControlToCompare="TxtPass2" ForeColor="Red">*</asp:CompareValidator>
                    <br />
                </span>
                <br />
                <br />
                <span class="auto-style2">
                    <asp:Button ID="button" runat="server" Text="CHANGE" OnClick="button_Click" BackColor="#3399FF" BorderColor="#CCFFFF" ForeColor="#CCFFFF" Height="50px" Width="263px"></asp:Button> 
                </span><br />
                <span class="auto-style3">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="The following problems have been encountered :" ForeColor="red"/>
                    <asp:Label ID="Labelmsg" runat="server"></asp:Label>
                </span>
                <br />
                <br />
            </div>
        </div>
    <br /><br /><br />
    
</asp:Content>
