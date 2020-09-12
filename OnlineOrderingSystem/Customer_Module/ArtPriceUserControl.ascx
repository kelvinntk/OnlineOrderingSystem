<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ArtPriceUserControl.ascx.cs" Inherits="OnlineOrderingSystem.Customer_Module.ArtPriceUserControl" %>

Price: <%# Eval ("Price", "{0:C}") %>
<br />
Stock Left: <%# Eval ("NoOfStock") %>
