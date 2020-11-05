<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="register.registerModel.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="border:solid 1px;width:80%;margin-top:5%;margin-left:10%;background-color:grey;padding-bottom:50px">
        <center>
        <p>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Staff Registration"></asp:Label>
        </p>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" ForeColor="#333333" DefaultMode="Insert" insertMethod="FormView1_insertItem" Style="width:25%">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                <table style="width:100%;">
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="First Name :"></asp:Label>
                        </td>
                        <td>

                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("First_Name") %>'></asp:TextBox>

                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First name is required" ControlToValidate="TextBox1" Style="color:red" EnableClientScript="False">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Last Name :"></asp:Label>
                        </td>
                        <td>

                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Last_Name") %>'></asp:TextBox>

                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name required" ControlToValidate="TextBox2" Style="color:red" EnableClientScript="False">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Email :"></asp:Label>
                        </td>
                        <td>

                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>

                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email is required" ControlToValidate="TextBox3" Style="color:red" EnableClientScript="False">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid email" ControlToValidate="TextBox3" Style="color:red" 
                                ValidationExpression="^([\w-\.]+)@(([\w-]+\.)+)([a-zA-Z]{2,4})$" EnableClientScript="False">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Address :"></asp:Label>
                        </td>
                        <td>

                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Address") %>' TextMode="MultiLine"></asp:TextBox>

                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Address is required" ControlToValidate="TextBox4" Style="color:red" EnableClientScript="False">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Contact No :"></asp:Label>
                        </td>
                        <td>

                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Contact_No") %>'></asp:TextBox>

                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Contact is required" ControlToValidate="TextBox5" Style="color:red" EnableClientScript="False">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter a valid contact no" ControlToValidate="TextBox5" Style="color:red" 
                                ValidationExpression="\d{3}-\d{7,8}" EnableClientScript="False">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="Password :"></asp:Label>
                        </td>
                        <td>

                            <asp:TextBox ID="TextBox6" runat="server" EnableTheming="True" TextMode="Password" Text='<%# Bind("Password") %>'></asp:TextBox>

                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="testValid" runat="server" ErrorMessage="Password is required" ControlToValidate="TextBox6" Style="color:red" EnableClientScript="False">*</asp:RequiredFieldValidator>
                            <asp:Label ID="Label9" runat="server" ForeColor="Red" Text="*" Visible="False"></asp:Label>
                        </td>
                    </tr>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Status") %>' Visible="false">Active</asp:TextBox>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="crt" runat="server" CommandName="Insert" Text="Create" />
                            &nbsp;<asp:Button ID="cancel" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan=3>

                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

                            <asp:Label ID="Label8" runat="server" Text="Password must be mixture of digit and alphabet and must not be shorter than 6 characters" Visible="False"></asp:Label>

                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:FormView>
            <asp:TextBox ID="TextBox8" runat="server" Enabled="False" Visible="False"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="" ControlToValidate="TextBox8" EnableClientScript="false"> </asp:RequiredFieldValidator>
            </center>
        </div>
    </form>
</body>
</html>