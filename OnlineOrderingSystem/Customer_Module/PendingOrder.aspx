<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PendingOrder.aspx.cs" Inherits="CustomerModule.Customer_Module.PendingOrder" MasterPageFile="~/Customer_Module/CustomerMasterPage.Master" %>

<asp:Content ID="customerArtGallery" ContentPlaceHolderID="CustomerContentPlaceHolder" runat="server">

    <h1>Pending Orders</h1>

    <br />

    <table>
        <tr>
            <td style="vertical-align: top">
                <asp:GridView ID="GridView1" CssClass="GridViewPadding" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrderID,CustomerID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                        <asp:BoundField DataField="Order_Date" HeaderText="Order Date" SortExpression="Order_Date" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="Order_Time" HeaderText="Order Time" SortExpression="Order_Time" />
                        <asp:BoundField DataField="Grand_Total" HeaderText="Grand Total (RM)" SortExpression="Total_Amount" DataFormatString="{0:n}" HtmlEncode="False" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" ForeColor="White" />
                    <EmptyDataTemplate>
                        You do not have any pending orders
                    </EmptyDataTemplate>
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
            </td>
            <td style="vertical-align: top">
                <asp:GridView ID="GridView2" CssClass="GridViewPadding" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrderID,ArtID" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <%--<asp:BoundField DataField="OrderID" HeaderText="Order ID" ReadOnly="True" SortExpression="OrderID" />--%>
                        <asp:BoundField DataField="ArtID" HeaderText="Art ID" ReadOnly="True" SortExpression="ArtID" />
                        <asp:BoundField DataField="Art_Name" HeaderText="Art Name" ReadOnly="True" SortExpression="ArtID" />
                        <asp:BoundField DataField="Price" HeaderText="Price (RM)" SortExpression="Price" DataFormatString="{0:n}" HtmlEncode="False" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:BoundField DataField="Total" HeaderText="Total (RM)" ReadOnly="True" SortExpression="Total" DataFormatString="{0:n}" HtmlEncode="False" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" ForeColor="White" />
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

                <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource3">
                    <EditItemTemplate>
                        Total_Amount:
                        <asp:TextBox ID="Total_AmountTextBox" runat="server" Text='<%# Bind("Total_Amount") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Total_Amount:
                        <asp:TextBox ID="Total_AmountTextBox" runat="server" Text='<%# Bind("Total_Amount") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        &nbsp;&nbsp;&nbsp;Total Amount: RM <asp:Label ID="Total_AmountLabel" runat="server" Text='<%# Bind("Total_Amount", "{0:n}") %>' />
                        <br />

                    </ItemTemplate>
                </asp:FormView>
            </td>
        </tr>
    </table>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT A.*, B.* 
FROM [Order] A, [Transaction] B 
WHERE A.CustomerID = @CustomerID AND A.Status = @Status 
AND A.CustomerID = B.CustomerID 
AND A.OrderID = B.OrderID">
        <SelectParameters>
            <asp:SessionParameter Name="CustomerID" SessionField="CustomerID" Type="Int32" />
            <asp:Parameter DefaultValue="PAID" Name="Status" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Order_Details] WHERE ([OrderID] = @OrderID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="OrderID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Total_Amount 
FROM [Order] 
WHERE CustomerID = @CustomerID AND Status = @Status 
AND OrderID = @OrderID">
        <SelectParameters>
            <asp:SessionParameter Name="CustomerID" SessionField="CustomerID" />
            <asp:Parameter DefaultValue="PAID" Name="Status" />
            <asp:ControlParameter ControlID="GridView1" DefaultValue="" Name="OrderID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        /*.auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 7px;
        }*/
    </style>
</asp:Content>
