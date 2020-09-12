<%@ Page Language="C#" MasterPageFile="~/artistModule/artist.Master" AutoEventWireup="true" CodeBehind="artDetails.aspx.cs" Inherits="ArtModule.artDetails" %>

<%@ Register Src="~/artistModule/modifyArt.ascx" TagPrefix="uc1" TagName="modifyArt" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>Modify Art</title>
    
        <div>
            <uc1:modifyArt runat="server" id="modifyArt" />
        </div>
    </asp:Content>