<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="selectRegis.aspx.cs" Inherits="register.registerModel.selectRegis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="border:solid 1px;width:80%;margin-top:5%;margin-left:10%;background-color:grey;padding-bottom:50px">
        <center>
            <h1>Who are you? artist or normal customer?</h1>
            <p>
                <asp:Button ID="Button1" runat="server" Text="Artist" style="width:100px;height:50px;margin-right:100px;" OnClick="Button1_Click"/>
                <asp:Button ID="Button2" runat="server" Text="Customer" style="width:100px;height:50px;margin-left:100px;" OnClick="Button2_Click"/>
            </p>
            
        </center>
        </div>
    </form>
</body>
</html>
