<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ArtImageUserControl.ascx.cs" Inherits="OnlineOrderingSystem.Customer_Module.ArtImageUserControl" %>

<asp:Image ID="Image1" runat="server" ImageUrl='<%# "ShowImage.ashx?ItemID=" + Eval("ItemID") %>' Width="400px" Height="300px" />
