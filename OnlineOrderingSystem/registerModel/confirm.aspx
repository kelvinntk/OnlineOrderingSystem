<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirm.aspx.cs" Inherits="register.registerModel.view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
    <div style="border:solid 1px;width:80%;margin-top:5%;margin-left:10%;background-color:grey;padding-bottom:50px">
        <center>
            <h1>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </h1>
            <p>
                <asp:FormView ID="FormView1" runat="server" DataSourceID="" DefaultMode="ReadOnly">
                    
                    <ItemTemplate>
                        <table style="border:solid;">
                            <tr>
                                <td>
                                    Email:
                                </td>
                                <td>
                                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Password:
                                </td>
                                <td>
                                    <asp:Label ID="PasswordLabel" runat="server" Text='<%# Bind("Password") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    First_Name:
                                </td>
                                <td>
                                    <asp:Label ID="First_NameLabel" runat="server" Text='<%# Bind("First_Name") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Last_Name:
                                </td>
                                <td>
                                    <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Bind("Last_Name") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Contact_No:
                                </td>
                                <td>
                                    <asp:Label ID="Contact_NoLabel" runat="server" Text='<%# Bind("Contact_No") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Address:
                                </td>
                                <td>
                                    <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Status:
                                </td>
                                <td>
                                    <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Back to Login Page" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 1 * FROM Artist  ORDER BY ArtistID DESC ;
"></asp:SqlDataSource>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Back to Register Page" Visible="False" />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 1 * FROM Customer ORDER BY CustomerID DESC ;
"></asp:SqlDataSource>
            </p>
            
        </center>
        </div>
    </form>
    </body>
</html>
