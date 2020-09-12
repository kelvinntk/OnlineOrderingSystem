 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerProfile.aspx.cs" Inherits="CustomerModule.Customer_Module.CustomerProfile" MasterPageFile="~/Customer_Module/CustomerMasterPage.Master" %>

<asp:Content ID="customerProfile" ContentPlaceHolderID="CustomerContentPlaceHolder" runat="server">

    <h1> Your Profile </h1>

    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1" Width="800px">
        <EditItemTemplate>
            <table>
            
            <tr>
                    <td class="style">Email: </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;<asp:Label ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        <br />
                    </td>
            </tr>
            <tr>
                    <td class="style">First_Name: </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;<asp:TextBox ID="First_NameTextBox" runat="server" placeholder="Tiffany" Text='<%# Bind("First_Name") %>' size="50" />

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage="First Name is required." ForeColor="Red" ControlToValidate="First_NameTextBox">*
                        </asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ValidationExpression="^[a-zA-Z]*$" ControlToValidate="First_NameTextBox" ForeColor="Red"
                            ID="RegularExpressionValidator1" runat="server" ErrorMessage="First Name can only be alphabets without space">*</asp:RegularExpressionValidator>
                        <br />
                    </td>
            </tr>
            <tr>
                    <td class="style">Last_Name: </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;<asp:TextBox ID="Last_NameTextBox" runat="server" placeholder="Swift" Text='<%# Bind("Last_Name") %>' size="50" />

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ErrorMessage="Last Name is required." ForeColor="Red" ControlToValidate="Last_NameTextBox">*
                        </asp:RequiredFieldValidator>
                        
                        <asp:RegularExpressionValidator ValidationExpression="^[a-zA-Z]*$" ControlToValidate="Last_NameTextBox" ForeColor="Red"
                            ID="RegularExpressionValidator2" runat="server" ErrorMessage="Last Name can only be alphabets without space">*</asp:RegularExpressionValidator>
                        <br />
                    </td>
            </tr>
            <tr>
                    <td class="style">Contact_No: </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;<asp:TextBox ID="Contact_NoTextBox" runat="server" placeholder="0123456789" Text='<%# Bind("Contact_No") %>' size="50" />

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="Contact number is required." ForeColor="Red" ControlToValidate="Contact_NoTextBox">*
                        </asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ID="phoneregularExpression" runat="server" ErrorMessage="Please enter correct contact number 10 digits" 
                            ForeColor="Red" 
                          ValidationExpression="^[0-9]{10}$" ControlToValidate="Contact_NoTextBox">*</asp:RegularExpressionValidator>
                        <br />
                    </td>
            </tr>
            <tr>
                    <td class="style">Address: </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;<asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' Font-Size="1.25em" TextMode="MultiLine" Columns="52" Rows="5" placeholder="Example = Taman Merah" />

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ErrorMessage="Address is required." ForeColor="Red" ControlToValidate="AddressTextBox">*
                        </asp:RequiredFieldValidator>
                        <br />
                    </td>
            </tr>
                

            </table>

            <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />

            <br />

            <asp:ValidationSummary Style="text-align: left; padding: 5%" ID="ValidationSummary2" runat="server" HeaderText="The following problems have been encountered :" ForeColor="red"/>

            <br />
            
        
        </EditItemTemplate>
        <InsertItemTemplate>
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            Password:
            <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>'  />
            <br />
            First_Name:
            <asp:TextBox ID="First_NameTextBox" runat="server" Text='<%# Bind("First_Name") %>' />
            <br />
            Last_Name:
            <asp:TextBox ID="Last_NameTextBox" runat="server" Text='<%# Bind("Last_Name") %>' />
            <br />
            Contact_No:
            <asp:TextBox ID="Contact_NoTextBox" runat="server" Text='<%# Bind("Contact_No") %>' />
            <br />
            Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            Status:
            <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
  <table>
            
            <tr>
                <td class="style">Email: </td>&nbsp;
                <td>
                    &nbsp;&nbsp;&nbsp;<asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style">First_Name: </td>
                <td>
                    &nbsp;&nbsp;&nbsp;<asp:Label ID="First_NameLabel" runat="server" Text='<%# Bind("First_Name") %>' />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style">Last_Name: </td>
                <td>
                    &nbsp;&nbsp;&nbsp;<asp:Label ID="Last_NameLabel" runat="server" Text='<%# Bind("Last_Name") %>' />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style">Contact_No: </td>
                <td>
                    &nbsp;&nbsp;&nbsp;<asp:Label ID="Contact_NoLabel" runat="server" Text='<%# Bind("Contact_No") %>' />
                    <br />
                </td>
            </tr>
             <tr>
                <td class="style">Address: </td>
                <td>
                    &nbsp;&nbsp;&nbsp;<asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                    <br />
                </td>
            </tr>

           </table>
            <br />

            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />

        </ItemTemplate>
    </asp:FormView>
    <br />

    <h2>Change password</h2>

    <br />
    <asp:ChangePassword ID="ChangePassword1" runat="server" OnChangingPassword="ChangePassword1_ChangingPassword" OnChangedPassword="ChangePassword1_ChangedPassword" ContinueDestinationPageUrl="~/Customer_Module/CustomerProfile.aspx" CancelDestinationPageUrl="~/Customer_Module/CustomerProfile.aspx" SuccessPageUrl="~/Customer_Module/CustomerProfile.aspx" NewPasswordRegularExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" NewPasswordRegularExpressionErrorMessage="Password must contain: Minimum 8 characters at least 1 Alphabet and 1 Number" ChangePasswordTitleText="" PasswordLabelText="Current Password:">
    <ValidatorTextStyle ForeColor="Red" />
    </asp:ChangePassword>
    <br />

    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />

    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customer] WHERE ([CustomerID] = @CustomerID)" UpdateCommand="UPDATE [Customer] SET Email = @Email, First_Name = @First_Name, Last_Name = @Last_Name, Contact_No = @Contact_No, Address = @Address WHERE ([CustomerID] = @CustomerID)">
        <SelectParameters>
            <asp:SessionParameter Name="CustomerID" SessionField="CustomerID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Email" />
            <asp:Parameter Name="First_Name" />
            <asp:Parameter Name="Last_Name" />
            <asp:Parameter Name="Contact_No" />
            <asp:Parameter Name="Address" />
            <asp:Parameter Name="CustomerID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Password FROM [Customer] WHERE ([CustomerID] = @CustomerID)" UpdateCommand="UPDATE [Customer] SET Password = @Password WHERE ([CustomerID] = @CustomerID)">
        <SelectParameters>
            <asp:SessionParameter Name="CustomerID" SessionField="CustomerID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Password" />
            <asp:Parameter Name="CustomerID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style{
            text-align: right;
        }
    </style>

    <script type="text/javascript">

        function changePW()
        {
            var ConfirmPass = document.getElementById("ConfirmPass");
            var PasswordValue = document.getElementById("PasswordValue");

            PasswordValue.nodeValue = ConfirmPass.nodeValue;
        }

    </script>
</asp:Content>

