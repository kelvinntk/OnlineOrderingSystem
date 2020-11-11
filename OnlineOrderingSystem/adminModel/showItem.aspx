<%@ Page Title="" Language="C#" MasterPageFile="~/adminModel/adminMst.Master" AutoEventWireup="true" CodeBehind="showItem.aspx.cs" Inherits="OnlineOrderingSystem.adminModel.showItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
            <asp:BoundField DataField="Item_Name" HeaderText="Item_Name" SortExpression="Item_Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="NoOfStock" HeaderText="NoOfStock" SortExpression="NoOfStock" />
            <asp:BoundField DataField="DateUploaded" HeaderText="DateUploaded" SortExpression="DateUploaded" />
            <asp:BoundField DataField="TimeUploaded" HeaderText="TimeUploaded" SortExpression="TimeUploaded" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
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
        </center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ItemID], [Item_Name], [Description], [Category], [Price], [NoOfStock], [DateUploaded], [TimeUploaded], [Image], [Status] FROM [Item] WHERE ([StaffID] = @StaffID)">
        <SelectParameters>
            <asp:SessionParameter Name="StaffID" SessionField="adstaffid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
