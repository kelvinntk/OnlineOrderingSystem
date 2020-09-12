<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="OnlineOrderingSystem.Login_Module.Registration" MasterPageFile="~/Login_Module/loginMaster.Master" %>

<asp:Content ID="customerHome" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">

    <style type="text/css">
        .auto-style2 {
            width: 394px;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 394px;
            text-align: right;
            font-family: "Courier New", Courier, monospace;
            font-size: large;
            color: #000000;
        }
        .auto-style5 {
            text-align: left;
            width: 458px;
        }
        .auto-style6 {
            width: 394px;
            text-align: right;
            height: 33px;
            font-family: "Courier New", Courier, monospace;
            font-size: large;
            color: #000000;
        }
        .auto-style7 {
            text-align: left;
            height: 33px;
            width: 458px;
        }
        
        .auto-style8 {
            text-align: center;
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            font-size: xx-large;
            width: 394px;
        }
        .auto-style9 {
            width: 394px;
            text-align: center;
            height: 34px;
        }
        .auto-style10 {
            height: 34px;
            width: 458px;
        }
        
        .auto-style11 {
            width: 394px;
            text-align: right;
            font-family: "Courier New", Courier, monospace;
            font-size: large;
            height: 36px;
            color: #000000;
        }
        .auto-style12 {
            text-align: left;
            height: 36px;
            width: 458px;
        }
        
        .auto-style13 {
            margin-right: 0px;
            margin-bottom: 0px;
        }
        .auto-style14 {
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            font-size: xx-large;
        }
        .auto-style15 {
            font-family: "Courier New", Courier, monospace;
            font-size: xx-large;
        }
        .auto-style16 {
            width: 68%;
            margin-left: 11%;
        }
        
        .auto-style17 {
            text-align: center;
            height: 151px;
        }
        
        .auto-style18 {
            width: 458px;
        }
                
        .auto-style20 {
            width: 89%;
            height: 433px;
            margin-right: 87px;
        }
        
    </style>
   
    <br /><br /><br />

            <div class="auto-style16" style="border-style: solid; border-color: inherit; border-width: medium; text-align:center; margin-right: 25%; margin-top: 0; margin-bottom: 0;">
            &nbsp;
            &nbsp;<table class="auto-style20">
                <tr>
                    <td class="auto-style8" colspan="1">
                        </td>
                </tr>
                <tr>
                    <td class="auto-style17" colspan="2">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Login_Module/images/5.jpg" CssClass="auto-style13" Height="103px" Width="125px" />
                        &nbsp;<span class="auto-style14">&nbsp; </span><span class="auto-style15">&nbsp;Customer
                        Registration Form</span></td>
                </tr>
                <tr>
                    <td class="auto-style11">Email : </td>
                    <td class="auto-style12">
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="example@mail.com" size="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldEmail" runat="server"
                            ErrorMessage="Email is required." ForeColor="Red" ControlToValidate="TextBox1">*
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"
                            ControlToValidate="TextBox1" ErrorMessage="Invalid Email Format">*
                        </asp:RegularExpressionValidator>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style4">Password :</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TextBox2" TextMode="Password" runat="server" size="50"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="Password is required." ForeColor="Red" ControlToValidate="TextBox2">*
                        </asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ID="RegularExpressionPassword" runat="server"  
                            ErrorMessage="Password must contain: Minimum 8 characters at least 1 Alphabet and 1 Number"  
                            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ForeColor="Red" ControlToValidate="TextBox2">*
                        </asp:RegularExpressionValidator>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style4">Reconfirm Password :</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TextBox7" TextMode="Password" runat="server" size="50"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ErrorMessage="Reconfirm Password is required." ForeColor="Red" ControlToValidate="TextBox7">*
                        </asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"  
                            ErrorMessage="Reconfirm Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number"  
                            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ForeColor="Red" ControlToValidate="TextBox7">*
                        </asp:RegularExpressionValidator>

                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords must match" ControlToValidate="TextBox2" ControlToCompare="TextBox7" ForeColor="Red">*</asp:CompareValidator>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style4">First Name :</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TextBox3" runat="server" placeholder="Tiffany" size="50"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage="First Name is required." ForeColor="Red" ControlToValidate="TextBox3">*
                        </asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ValidationExpression="^[a-zA-Z]*$" ControlToValidate="TextBox3" ForeColor="Red"
                            ID="RegularExpressionValidator1" runat="server" ErrorMessage="First Name can only be alphabets without space">*</asp:RegularExpressionValidator>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style6">Last Name :</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="TextBox4" runat="server" placeholder="Swift" size="50"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ErrorMessage="Last Name is required." ForeColor="Red" ControlToValidate="TextBox4">*
                        </asp:RequiredFieldValidator>
                        
                        <asp:RegularExpressionValidator ValidationExpression="^[a-zA-Z]*$" ControlToValidate="TextBox4" ForeColor="Red"
                            ID="RegularExpressionValidator2" runat="server" ErrorMessage="Last Name can only be alphabets without space">*</asp:RegularExpressionValidator>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style4">Contact Number :</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TextBox5" runat="server" placeholder="0123456789" size="50"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="Contact number is required." ForeColor="Red" ControlToValidate="TextBox5">*
                        </asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ID="phoneregularExpression" runat="server" ErrorMessage="Please enter correct contact number 10 digits" 
                            ForeColor="Red" 
                          ValidationExpression="^[0-9]{10}$" ControlToValidate="TextBox5">*</asp:RegularExpressionValidator>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style4">Address :</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine" Font-Size="1.25em" Columns="52" Rows="5" placeholder="Example = Taman Merah"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ErrorMessage="Address is required." ForeColor="Red" ControlToValidate="TextBox6">*
                        </asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style3" colspan="2">&nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style2">
                        <%--<asp:Label ID="Label2" runat="server" ForeColor="Red" Text="The following problems have been encountered :"></asp:Label>--%>
                        <asp:ValidationSummary Style="text-align: left; padding: 5%" ID="ValidationSummary1" runat="server" HeaderText="The following problems have been encountered :" ForeColor="red"/></td>
                    <td class="auto-style18">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Create Account" Width="154px" Height="50px" BackColor="#6699ff" BorderColor="#CCFFFF" ForeColor="#ffffff" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9"></td>
                    <td class="auto-style10">
                        <asp:Label ID="Label1" runat="server" ForeColor="Green"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>

    <br /><br /><br />

</asp:Content>

