<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="OnlineOrderingSystem.Login_Module.Registration" MasterPageFile="~/Login_Module/loginMaster.Master" %>

<asp:Content ID="customerHome" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">

    <style type="text/css">
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
        .button {
            background-color: white;
            color: black;
            border: 2px solid #555555;
            margin-top: 25px;
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
    </style>
   
    <br /><br />

        <div class="container" style="width: 50%; margin: auto;">
            <br />
            <div>
                <h1>Customer Registration</h1>
            </div>
            <br />
            <div>
                <div>
                  <asp:Label ID="Label1" runat="server" ForeColor="Green"></asp:Label>
                </div>
            </div>
            <br />
            <div class="textbox">
                <div class="textboxInput">
                    <div class="label">Email</div>
                    <div>
                        <asp:TextBox ID="TextBox1" runat="server" class="textboxes" placeholder="example@mail.com" size="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldEmail" runat="server" ErrorMessage="Email is required." ForeColor="Red" ControlToValidate="TextBox1">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" ControlToValidate="TextBox1" ErrorMessage="Invalid Email Format">*</asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="textboxInput">
                    <div class="label">Password</div>
                    <div>
                        <asp:TextBox ID="TextBox2" class="textboxes" TextMode="Password" runat="server" size="50" placeholder="********"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password is required." ForeColor="Red" ControlToValidate="TextBox2">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionPassword" runat="server"  
                            ErrorMessage="Password must contain: Minimum 8 characters at least 1 Alphabet and 1 Number"  
                            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ForeColor="Red" ControlToValidate="TextBox2">*
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="textboxInput" style="margin-left: 10px;">
                    <div class="label">Reconfirm Password</div>
                    <div>
                        <asp:TextBox ID="TextBox7" class="textboxes" TextMode="Password" runat="server" size="50" placeholder="********"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ErrorMessage="Reconfirm Password is required." ForeColor="Red" ControlToValidate="TextBox7">*
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"  
                            ErrorMessage="Reconfirm Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number"  
                            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ForeColor="Red" ControlToValidate="TextBox7">*
                        </asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords must match" ControlToValidate="TextBox2" ControlToCompare="TextBox7" ForeColor="Red">*</asp:CompareValidator>
                    </div> 
                </div>
                <div class="textboxInput">
                    <div class="label">First Name</div>
                    <div>
                        <asp:TextBox ID="TextBox3" class="textboxes" runat="server" placeholder="Tiffany" size="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage="First Name is required." ForeColor="Red" ControlToValidate="TextBox3">*
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationExpression="^[a-zA-Z]*$" ControlToValidate="TextBox3" ForeColor="Red"
                            ID="RegularExpressionValidator1" runat="server" ErrorMessage="First Name can only be alphabets without space">*</asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="textboxInput">
                    <div class="label">Last Name</div>
                    <div>
                        <asp:TextBox ID="TextBox4" class="textboxes" runat="server" placeholder="Swift" size="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ErrorMessage="Last Name is required." ForeColor="Red" ControlToValidate="TextBox4">*
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationExpression="^[a-zA-Z]*$" ControlToValidate="TextBox4" ForeColor="Red"
                            ID="RegularExpressionValidator2" runat="server" ErrorMessage="Last Name can only be alphabets without space">*</asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="textboxInput">
                    <div class="label">Contact Number</div>
                    <div>
                        <asp:TextBox ID="TextBox5" class="textboxes" runat="server" placeholder="0123456789" size="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="Contact number is required." ForeColor="Red" ControlToValidate="TextBox5">*
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="phoneregularExpression" runat="server" ErrorMessage="Please enter correct contact number 10 digits" 
                            ForeColor="Red" 
                          ValidationExpression="^[0-9]{10}$" ControlToValidate="TextBox5">*</asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="textboxInput" style="margin-right: 10px;">
                    <div class="label">Address</div>
                    <div>
                        <asp:TextBox ID="TextBox6" class="textboxes" runat="server" placeholder="Example = Taman Merah"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ErrorMessage="Address is required." ForeColor="Red" ControlToValidate="TextBox6">*
                        </asp:RequiredFieldValidator>
                    </div> 
                </div>

                <br />

                <div>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="The following problems have been encountered :" ForeColor="red"/>
                </div>

                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login_Module/login.aspx">I Already have an account?</asp:HyperLink>
                <asp:Button ID="Button1" class="button" runat="server" OnClick="Button1_Click" Text="Register"/>

            </div>
        </div>
</asp:Content>

