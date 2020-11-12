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

    <%--<script type=”text/javascript”>
        function printGrid() {
        var gridData = document.getElementById(‘<%= GridView1.ClientID %>‘);
        var windowUrl = ‘about:blank’; set print document name for gridview
        var uniqueName = new Date();
        var windowName = ‘Print_’ + uniqueName.getTime();
        var prtWindow = window.open(windowUrl, windowName,
        ‘left=100,top=100,right=100,bottom=100,width=700,height=500’);
        prtWindow.document.write(‘<html><head></head>’);
        prtWindow.document.write(‘<body style=”background:none !important”>’);
        prtWindow.document.write(gridData.outerHTML);
        prtWindow.document.write(‘</body></html>’);
        prtWindow.document.close();
        prtWindow.focus();
        prtWindow.print();
        prtWindow.close();
        }
    </script>--%>
    <script>
        function doPrint()
        {
            var prtContent = document.getElementById('<%= GridView1.ClientID %>');
            prtContent.border = 0; //set no border here
            var WinPrint = window.open('','','left=100,top=100,width=1000,height=1000,toolbar=0,scrollbars=1,status=0,resizable=1');
            WinPrint.document.write(prtContent.outerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
</script>

        <asp:Button ID="btnPrint" runat="server" Text="Print Report" ForeColor="#0066FF" OnClientClick="doPrint()" />

<%--    <script language="javascript" type="text/javascript">
        function PrintPage() {
            var printContent = document.getElementById
           <%-- ('<%= GridView1.ArtID %>');-
            var printWindow = window.open("All Records", 
            "Print Panel", 'left=50000,top=50000,width=0,height=0');
            printWindow.document.write(printContent.innerHTML);
            printWindow.document.close();
            printWindow.focus();
            printWindow.print();--%>
     

</asp:Content>
