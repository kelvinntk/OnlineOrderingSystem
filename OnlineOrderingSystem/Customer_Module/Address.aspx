<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="OnlineOrderingSystem.Customer_Module.Address" MasterPageFile="~/Customer_Module/CustomerMasterPage.Master" %>

<asp:Content ID="customerCart" ContentPlaceHolderID="CustomerContentPlaceHolder" runat="server">

    <h1 style="text-align:left;">Delivery Address</h1>

    <div align="center">

        <br />

        <asp:Table ID="Table2" runat="server" BorderColor="Black" BorderStyle="Solid" CellPadding="50" CellSpacing="35" style="text-align:left;" Width="80%">

            <asp:TableRow>

                <asp:TableCell Width="25%">

                    <asp:Label ID="Label8" runat="server" Text="House/Unit Number"></asp:Label>

                </asp:TableCell>

                <asp:TableCell>

                    <asp:TextBox ID="TextBoxHouseNo" runat="server" placeholder="B25-12-05" Width="25%" required="required"></asp:TextBox>

                </asp:TableCell>

            </asp:TableRow>

            <asp:TableRow>

                <asp:TableCell>

                    <asp:Label ID="Label9" runat="server" Text="Address Line 1"></asp:Label>

                </asp:TableCell>

                <asp:TableCell>

                    <asp:TextBox ID="TextBoxAddress1" runat="server" placeholder="Jalan Bunga 1/A" Width="100%" required="required"></asp:TextBox>

                </asp:TableCell>

            </asp:TableRow>

            <asp:TableRow>

                <asp:TableCell>

                    <asp:Label ID="Label10" runat="server" Text="Address Line 2"></asp:Label>

                </asp:TableCell>

                <asp:TableCell>

                    <asp:TextBox ID="TextBoxAddress2" runat="server" placeholder="KSL Park" Width="100%" required="required"></asp:TextBox>

                </asp:TableCell>

            </asp:TableRow>

            <asp:TableRow>

                <asp:TableCell>

                    <asp:Label ID="Label11" runat="server" Text="Postcode"></asp:Label>

                </asp:TableCell>

                <asp:TableCell>

                    <asp:TextBox ID="TextBoxPostcode" runat="server" placeholder="80300" Width="25%" required="required" pattern="[0-9]{5}"></asp:TextBox>

                </asp:TableCell>

            </asp:TableRow>

            <asp:TableRow>

                <asp:TableCell>

                    <asp:Label ID="Label12" runat="server" Text="City"></asp:Label>

                </asp:TableCell>

                <asp:TableCell>

                    <asp:TextBox ID="TextBoxCity" runat="server" Width="50%" placeholder="Johor Bahru" required="required" pattern="[A-Z a-z]+"></asp:TextBox>

                </asp:TableCell>

            </asp:TableRow>

            <asp:TableRow>

                <asp:TableCell>

                    <asp:Label ID="Label13" runat="server" Text="State"></asp:Label>

                </asp:TableCell>

                <asp:TableCell>

                    <asp:TextBox ID="TextBoxState" runat="server" Width="50%" placeholder="Johor" required="required" pattern="[A-Z a-z]+"></asp:TextBox>

                </asp:TableCell>

            </asp:TableRow>

            <%--<asp:TableRow>

                <asp:TableCell>

                    <asp:Label ID="Label14" runat="server" Text="Country"></asp:Label>

                </asp:TableCell>

                <asp:TableCell>

                    <asp:TextBox ID="TextBoxCountry" runat="server" Width="50%" required="required" pattern="[A-Z a-z]+"></asp:TextBox>

                </asp:TableCell>

            </asp:TableRow>--%>

        </asp:Table>
            
    <br />
    <br />
    <br />

    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Customer_Module/Checkout.aspx"><input id="B1" type="button" value="Cancel" style="padding:0.3em; background-color: transparent; border: 0.1em solid black; font-size: 1.75em; color: black;" /></asp:HyperLink>

    <asp:Button ID="Button1" runat="server" style="padding:0.3em;" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="0.1em" Font-Size="1.75em" ForeColor="Black" OnClick="Button1_Click" Text="Confirm" />

    </div>

    <br />
    <br />
    <br />

</asp:Content>
