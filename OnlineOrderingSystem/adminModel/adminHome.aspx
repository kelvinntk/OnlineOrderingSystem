<%@ Page Title="" Language="C#" MasterPageFile="~/adminModel/adminMst.Master" AutoEventWireup="true" CodeBehind="adminHome.aspx.cs" Inherits="adminModel.adminModel.adminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="adminHome.css" />
    <style>
        a.frst, a.scd {
            background: grey;
            padding:20px;
            border:1px solid black;
            margin-left:20%;
        }
        #logo{
            margin-bottom:10%;
        }
        a.frst:hover,a.scd:hover{
            background-color: white;
        }
    </style>
    <div Style="margin-top:10%">
        <a href="viewArtist.aspx" class="frst">View Artist</a>
        <a href="viewCust.aspx" class="scd">View Customer</a>
    </div>
</asp:Content>
