<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostPayment.aspx.cs" Inherits="OnlineOrderingSystem.Customer_Module.PostPayment" MasterPageFile="~/Customer_Module/CustomerMasterPage.Master" %>

<asp:Content ID="customerCart" ContentPlaceHolderID="CustomerContentPlaceHolder" runat="server">

    <h1>Your payment is successful!</h1>

    <p>An e-invoice has been sent through email to your email account, <asp:Label ID="LabelEmail" runat="server" Text="Label" Font-Bold="True"></asp:Label></p>

    <br />
    <br />

    <h1>Summary</h1>

    <br />

    <div align="center">

    <asp:Table ID="Table1" runat="server" style="text-align:left;" Width="90%">

        <asp:TableRow>

            <asp:TableCell>

                <asp:Label ID="Label1" runat="server" Text="Customer Name: " Font-Bold="True"></asp:Label>

                <asp:Label ID="LabelCustomerName" runat="server"></asp:Label>

            </asp:TableCell>

            <asp:TableCell>

                <asp:Label ID="Label2" runat="server" Text="Date: " Font-Bold="True"></asp:Label>

                <asp:Label ID="LabelDate" runat="server"></asp:Label>

            </asp:TableCell>

        </asp:TableRow>

        <asp:TableRow>

            <asp:TableCell>

                <asp:Label ID="Label3" runat="server" Text="Order ID: " Font-Bold="True"></asp:Label>

                <asp:Label ID="LabelOrderID" runat="server"></asp:Label>

            </asp:TableCell>

            <asp:TableCell>

                <asp:Label ID="Label4" runat="server" Text="Time: " Font-Bold="True"></asp:Label>

                <asp:Label ID="LabelTime" runat="server"></asp:Label>

            </asp:TableCell>

        </asp:TableRow>

        <asp:TableRow>

            <asp:TableCell ColumnSpan="2">

                <asp:Label ID="Label5" runat="server" Text="Transaction ID: " Font-Bold="True"></asp:Label>

                <asp:Label ID="LabelTransactionID" runat="server"></asp:Label>

            </asp:TableCell>

        </asp:TableRow>

        <asp:TableRow>

            <asp:TableCell ColumnSpan="2">

                <asp:Label ID="Label6" runat="server" Text="Address: " Font-Bold="True"></asp:Label>

                <asp:Label ID="LabelAddress" runat="server"></asp:Label>

            </asp:TableCell>

        </asp:TableRow>

    </asp:Table>

    <br />
    <br />

    <asp:GridView ID="GridView1" CssClass="GridViewPadding" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="OrderID,ArtID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="Vertical" Width="90%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Art_Name" HeaderText="Art Name" SortExpression="Art_Name" />
            <asp:BoundField DataField="Price" HeaderText="Price (RM)" SortExpression="Price" DataFormatString="{0:n}" HtmlEncode="False" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Total" HeaderText="Total (RM)" ReadOnly="True" SortExpression="Total" DataFormatString="{0:n}" HtmlEncode="False" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

    <br />
    <br />

    <asp:Table ID="Table2" runat="server" style="text-align:left;">

        <asp:TableRow>

            <asp:TableCell>

                <asp:Label ID="Label7" runat="server" Text="Sub-total" Font-Bold="True"></asp:Label>

            </asp:TableCell>

            <asp:TableCell>

                &nbsp;:&nbsp;<asp:Label ID="LabelSubTotal" runat="server"></asp:Label>

            </asp:TableCell>

        </asp:TableRow>

        <asp:TableRow>

            <asp:TableCell>

                <asp:Label ID="Label8" runat="server" Text="10% SST" Font-Bold="True"></asp:Label>

            </asp:TableCell>

            <asp:TableCell>

                &nbsp;:&nbsp;<asp:Label ID="LabelSST" runat="server"></asp:Label>

            </asp:TableCell>

        </asp:TableRow>

        <asp:TableRow>

            <asp:TableCell>

                <asp:Label ID="Label9" runat="server" Text="Grand Total" Font-Bold="True"></asp:Label>

            </asp:TableCell>

            <asp:TableCell>

                &nbsp;:&nbsp;<asp:Label ID="LabelGrandTotal" runat="server"></asp:Label>

            </asp:TableCell>

        </asp:TableRow>

    </asp:Table>

    <br />
    <br />

    

    <asp:Button ID="Button1" runat="server" style="padding:0.3em;" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="0.1em" Font-Size="1.75em" ForeColor="Black" OnClick="Button1_Click" Text="Print Invoice" />

    <asp:Button ID="Button2" runat="server" style="padding:0.3em;" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="0.1em" Font-Size="1.75em" ForeColor="Black" OnClick="Button2_Click" Text="Back to Home" />

    </div>
    
    <br />
    <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Order_Details] WHERE ([OrderID] = @OrderID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="OrderID" QueryStringField="orderID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
    <br />
    
</asp:Content>
