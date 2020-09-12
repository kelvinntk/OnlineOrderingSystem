<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="CustomerModule.Customer_Module.Wishlist" MasterPageFile="~/Customer_Module/CustomerMasterPage.Master" %>

<%@ Register TagPrefix="UserControl1" TagName="Header" Src="~/Customer_Module/ArtImageUserControl.ascx" %>

<asp:Content ID="customerWishlist" ContentPlaceHolderID="CustomerContentPlaceHolder" runat="server">

    <h1>Your Wishlist</h1>

    <br />

    <asp:GridView CssClass="GridViewPadding" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ID="GridView1" DataKeyNames="CustomerID,ArtID" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="">

                <ItemTemplate>

                    <UserControl1:Header ID="Header1" runat="server"/>

                    <%--<asp:Image ID="Image1" runat="server" Width="400px" Height="300px" ImageUrl='<%# "ShowImage.ashx?ArtID=" + Eval("ArtID") %>'/>--%>
                </ItemTemplate>

            </asp:TemplateField>

            <asp:BoundField DataField="Art_Name" HeaderText="Art_Name" SortExpression="Art_Name" />
            <asp:BoundField DataField="DateAdded" HeaderText="DateAdded" SortExpression="DateAdded" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="TimeAdded" HeaderText="TimeAdded" SortExpression="TimeAdded" />

            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('Are you sure you want to remove?');" CausesValidation="False" CommandName="Delete" Text="Remove"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" ForeColor="White" />
        <EmptyDataTemplate>
            Your wishlist is empty
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

    <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM Wishlist WHERE CustomerID = @CustomerID AND ArtID = @ArtID" SelectCommand="SELECT W.CustomerID AS &quot;CustomerID&quot;, W.ArtID AS &quot;ArtID&quot;, W.DateAdded AS &quot;DateAdded&quot;, W.TimeAdded AS &quot;TimeAdded&quot;, 
A.ArtID AS &quot;ArtID&quot;, A.Art_Name AS &quot;Art_Name&quot;, A.Image AS &quot;Image&quot; 
FROM Art A, Wishlist W 
WHERE W.CustomerID = @CustomerID 
AND W.ArtID = A.ArtID">
        <DeleteParameters>
            <asp:Parameter Name="CustomerID" />
            <asp:Parameter Name="ArtID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter Name="CustomerID" SessionField="CustomerID" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />

</asp:Content>
