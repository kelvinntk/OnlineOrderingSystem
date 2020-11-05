<%@ Page Language="C#" MasterPageFile="~/artistModule/artist.Master" AutoEventWireup="true" CodeBehind="addItem.aspx.cs" Inherits="OnlineOrderingSystem.addArt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>Add new Item</title>
    <style type="text/css">
        .auto-style1 {
            border-collapse: separate;
            border-spacing: 20px;
        }
        .auto-style2 {
            text-align: right;
            width: 126px;
        }
        .auto-style3 {
            width: 126px;
        }
    </style>
        <div>
            <div style="text-align: center;">
                <u style="font-size: 20px;"><b>Add New Item:</b></u><br /><br />

            </div>
            <table class="auto-style1" align="center">
<%--                <tr>
                    <td class="auto-style2">Artist ID:</td>
                    <td><asp:TextBox ID="ArtistIDTextBox" runat="server" /></td>
                </tr>--%>
                <tr>
                    <td class="auto-style2">Item Name:</td>
                    <td>
                        <asp:TextBox ID="Item_NameTextBox" runat="server"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldItemName" runat="server"
                            ErrorMessage="Item Name is required." Font-Italic="true" ForeColor="Red" ControlToValidate="Item_NameTextBox">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorString" runat="server"
                            ErrorMessage="Do not include special character (e.g. @,!,#,$,%,^,...)" Font-Italic="true" ForeColor="Red"
                            ValidationExpression="[a-zA-Z0-9 ]*" ControlToValidate="Item_NameTextBox">
                        </asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Description:</td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" TextMode="MultiLine" Columns="40" Rows="4" runat="server"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldDescription" runat="server"
                            ErrorMessage="Description is required." Font-Italic="true" ForeColor="Red" ControlToValidate="DescriptionTextBox">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Category:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Value="-1">--Select Category--</asp:ListItem>
                            <asp:ListItem>Meal</asp:ListItem>
                            <asp:ListItem>Beverage</asp:ListItem>
                            <asp:ListItem>Snack</asp:ListItem>
                            <asp:ListItem>Bakery</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldDropDownList1" runat="server"
                            ErrorMessage="Category is required." Font-Italic="true" ForeColor="Red" InitialValue="-1" ControlToValidate="DropDownList1">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Price:</td>
                    <td>
                        <asp:TextBox ID="PriceTextBox" placeholder="e.g 2.00" runat="server"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldPrice" runat="server"
                            ErrorMessage="Price is required." Font-Italic="true" ForeColor="Red" ControlToValidate="PriceTextBox">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="ComparePrice" runat="server" ErrorMessage="The price must be in 2 decimal point."
                            Font-Italic="true" ForeColor="Red" Operator="DataTypeCheck" Type="Currency" ControlToValidate="PriceTextBox" >
                        </asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Number Of Stock:</td>
                    <td>
                        <asp:TextBox ID="NoOfStockTextBox" runat="server"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldNOS" runat="server"
                            ErrorMessage="Number of stock is required." Font-Italic="true" ForeColor="Red" ControlToValidate="NoOfStockTextBox">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareNOS" runat="server" ErrorMessage="The Number Of Stock must be in positive value and whole number."
                            Font-Italic="true" ForeColor="Red" Operator="DataTypeCheck" Type="Integer" ControlToValidate="NoOfStockTextBox" >
                        </asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Image: </td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldFileUpload" runat="server"
                            ErrorMessage="FileUpload is required." Font-Italic="true" ForeColor="Red" ControlToValidate="FileUpload1">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Status: </td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem Value="-1">--Select Status--</asp:ListItem>
                            <asp:ListItem>AVAILABLE</asp:ListItem>
                            <asp:ListItem>UNAVAILABLE</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="Status is required." Font-Italic="true" ForeColor="Red" InitialValue="-1" ControlToValidate="DropDownList2">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Insert" OnClick="Button1_Click" />
                        &nbsp;<asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/artistModule/viewItem.aspx">View Item</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>
