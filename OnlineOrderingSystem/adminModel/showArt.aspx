<%@ Page Title="" Language="C#" MasterPageFile="~/adminModel/adminMst.Master" AutoEventWireup="true" CodeBehind="showArt.aspx.cs" Inherits="OnlineOrderingSystem.adminModel.showArt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ArtID" HeaderText="ArtID" InsertVisible="False" ReadOnly="True" SortExpression="ArtID" />
            <asp:BoundField DataField="Art_Name" HeaderText="Art_Name" SortExpression="Art_Name" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ArtID], [Art_Name], [Description], [Category], [Price], [NoOfStock], [DateUploaded], [TimeUploaded], [Image], [Status] FROM [Art] WHERE ([ArtistID] = @ArtistID)">
        <SelectParameters>
            <asp:SessionParameter Name="ArtistID" SessionField="adartistid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
