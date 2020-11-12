<%@ Page Title="" Language="C#" MasterPageFile="~/adminModel/adminMst.Master" AutoEventWireup="true" CodeBehind="orderDetail.aspx.cs" Inherits="OnlineOrderingSystem.adminModel.orderDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" Height="334px" Width="304px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ItemID], [Price], [Quantity], [Total] FROM [Order_Details] WHERE ([OrderID] = @OrderID)">
        <SelectParameters>
            <asp:SessionParameter Name="OrderID" SessionField="adorderid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    
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

        <asp:Button ID="Button1" runat="server" Text="Print Report" ForeColor="#0066FF" OnClientClick="doPrint()" />

</asp:Content>
