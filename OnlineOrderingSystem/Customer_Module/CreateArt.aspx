<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateArt.aspx.cs" Inherits="CustomerModule.Customer_Module.CreateArt" MasterPageFile="~/Customer_Module/CustomerMasterPage.Master" %>

<asp:Content ID="customerArtGallery" ContentPlaceHolderID="CustomerContentPlaceHolder" runat="server">

    <h1>Create Art</h1>


    <br />
    <br />

    <asp:Label ID="Label1" runat="server" Text="Art Name"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="ArtNameTextB" runat="server" Width="300"></asp:TextBox>
    <br />
    <br />

    <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="DescriptionTextB" runat="server" Width="1000"></asp:TextBox>
    <br />
    <br />

    

    <asp:Label ID="Label3" runat="server" Text="Category"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;

    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>Abstract</asp:ListItem>
        <asp:ListItem>Illustration</asp:ListItem>
        <asp:ListItem>Painting</asp:ListItem>
    </asp:DropDownList>

    <%--<asp:TextBox ID="CategoryTextB" runat="server"></asp:TextBox>--%>
    <br />
    <br />



    <asp:Label ID="Label4" runat="server" Text="Price (e.g: 1200)"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="PriceTextB" runat="server"></asp:TextBox>
    <br />
    <br />

    <asp:Label ID="Label5" runat="server" Text="No of stock (e.g: 2)"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="NoOfStockTextB" runat="server"></asp:TextBox>
    <br />
    <br />




    <asp:Label ID="Label" runat="server" Text="Image"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:FileUpload ID="imgUpload" runat="server" />
<%--    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Image ID="Image1" Style="width: 200px" runat="server" />--%>

    <br />
    <br />
    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click"
        Text="Submit" />

    <br />
    <br />

</asp:Content>
