<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ArtDetailsUserControl.ascx.cs" Inherits="OnlineOrderingSystem.Customer_Module.ArtDetailsUserControl" %>

<h2><%# Eval ("Art_Name") %></h2>
<br />
By <b> <%# Eval ("First_Name") %> <%# Eval ("Last_Name") %> </b>
<br />
<br />
Uploaded on: <%# Eval ("DateUploaded", "{0:d}") %>, <%# Eval ("TimeUploaded") %>
<br />
<br />
Description:
<br />
<%# Eval ("Description") %>
