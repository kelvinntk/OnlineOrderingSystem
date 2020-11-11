<%@ Page Language="C#" MasterPageFile="~/staffModule/staff.Master" AutoEventWireup="true" CodeBehind="itemDetails.aspx.cs" Inherits="ItemModule.itemDetails" %>

<%@ Register Src="~/staffModule/modifyItem.ascx" TagPrefix="uc1" TagName="modifyItem" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>Modify Item</title>
    
        <div>
            <uc1:modifyItem runat="server" id="modifyItem" />
        </div>
    </asp:Content>