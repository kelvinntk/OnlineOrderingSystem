<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bakery.aspx.cs" Inherits="CustomerModule.Customer_Module.Bakery" MasterPageFile="~/Customer_Module/CustomerMasterPage.Master" %>

<%@ Register TagPrefix="UserControl1" TagName="Header" Src="~/Customer_Module/ArtImageUserControl.ascx" %>
<%@ Register TagPrefix="UserControl2" TagName="Header" Src="~/Customer_Module/ArtDetailsUserControl.ascx" %>
<%@ Register TagPrefix="UserControl3" TagName="Header" Src="~/Customer_Module/ArtPriceUserControl.ascx" %>

<asp:Content ID="customerArtGallery" ContentPlaceHolderID="CustomerContentPlaceHolder" runat="server">

    <h1> Bakery </h1>

    <br />

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">

        <ItemTemplate>

            <table>
                <tr>
                    <td style="padding:1em">

                        <UserControl1:Header ID="Header1" runat="server"/>

                        <%--<asp:Image ID="Image1" runat="server" ImageUrl='<%# "ShowImage.ashx?ArtID=" + Eval("ArtID") %>' Width="400px" Height="300px" />--%>
                    </td>

                    <td style="width:50%; padding:1em">

                        <UserControl2:Header ID="ctlHeader" runat="server"/>

                        <%--<h2><%# Eval ("Art_Name") %></h2>
                        <br />
                        By <b> <%# Eval ("First_Name") %> <%# Eval ("Last_Name") %> </b>
                        <br />
                        <br />
                        Uploaded on: <%# Eval ("DateUploaded", "{0:d}") %>, <%# Eval ("TimeUploaded") %>
                        <br />
                        <br />
                        Description:
                        <br />
                        <%# Eval ("Description") %>--%>
                    </td>

                    <td style="width:20%; padding:1em">
                        
                        <UserControl3:Header ID="Header2" runat="server"/>

                        <%--Price: <%# Eval ("Price", "{0:C}") %>
                        <br />
                        Stock Left: <%# Eval ("NoOfStock") %>--%>

                        <br />
                        <br />
                        <a href="/Customer_Module/BakeryAddToCart.aspx?ItemID=<%#: Eval ("ItemID") %>"><input id="Button1" class="buttonStyle" type="button" value="Add To Cart" /></a>
                        <br />
                        <br />
                        <a href="/Customer_Module/BakeryAddToWishlist.aspx?ItemID=<%#: Eval ("ItemID") %>"><input id="Button2" class="buttonStyle" type="button" value="<%# checkWishlist(Eval("ItemID") + "") %>" /></a>

                        <%--<a href="/Customer_Module/AddToWishlist.aspx?ArtID=<%#: Eval ("ArtID") %>">               
                                        <input id="Button2" type="button" value="Add to / Remove from Wishlist" />
                                    </a>--%>

                        <%--<asp:HyperLink ID="HyperLink1" runat="server" Text="Add To Cart" NavigateUrl="~/Customer_Module/AddToCart.aspx?ArtID=<%# Eval ("ArtID") %>"></asp:HyperLink>--%>
                        
                    </td>
                </tr>
            </table>

        </ItemTemplate>

        <SeparatorTemplate>

            <hr />

        </SeparatorTemplate>

    </asp:Repeater>

    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT A.* , B.* 
FROM Item A, Staff B  
WHERE A.NoOfStock &lt; 1 
AND A.Status = 'AVAILABLE' 
AND A.StaffID = B.StaffID" InsertCommand="INSERT INTO Cart(CustomerID, ItemID, Item_Name, Quantity, Total, ImageName, ImagePath) VALUES (@CustomerID, @ItemID, @Item_Name, 1, @Total, @ImageName, @ImagePath)" UpdateCommand="UPDATE Cart SET Quantity = @Quantity, Total = @Total WHERE CustomerID = @CustomerID AND ItemID = @ItemID">
        <InsertParameters>
            <asp:Parameter Name="CustomerID" />
            <asp:Parameter Name="ItemID" />
            <asp:Parameter Name="Item_Name" />
            <asp:Parameter Name="Total" />
            <asp:Parameter Name="ImageName" />
            <asp:Parameter Name="ImagePath" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Quantity" />
            <asp:Parameter Name="Total" />
            <asp:Parameter Name="CustomerID" />
            <asp:Parameter Name="ItemID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/start/jquery-ui.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#dialog").dialog({
            autoOpen: false,
            modal: true,
            height: 600,
            width: 600,
            title: "Zoomed Image"
        });
        $("[id*=Repeater1] img").click(function () {
            $('#dialog').html('');
            $('#dialog').append($(this).clone());
            $('#dialog').dialog('open');
        });
    });
</script>

</asp:Content>
