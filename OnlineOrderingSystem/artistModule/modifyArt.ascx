<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="modifyArt.ascx.cs" Inherits="OnlineOrderingSystem.artistModule.modifyArt" %>
<style type="text/css">
    .auto-style1 {
        width: 50%;
        border-spacing: 20px;
    }
    .auto-style2{
        text-align: right;
    }
</style>

<div style="text-align: center;">
    <u style="font-size: 30px;"><b>Update Art</b></u><br /><br />
    <asp:Label ID="Label3" runat="server"></asp:Label>
</div>
<br />
<asp:DetailsView ID="DetailsView2" runat="server" HorizontalAlign="Center" AutoGenerateRows="False" GridLines="None" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
    <Fields>
        <asp:TemplateField ControlStyle-BorderStyle="None">
            <ItemTemplate>
                <asp:Image ID="image1" runat="server" Height="300px" Width="400px" ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("Image"))%>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" Visible="false" />
    </Fields>
</asp:DetailsView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Image], [Status] FROM [Art] WHERE (([ArtID] = @ArtID) AND ([ArtistID] = @ArtistID))">
    <SelectParameters>
        <asp:QueryStringParameter Name="ArtID" QueryStringField="Id" Type="Int32" />
        <asp:QueryStringParameter Name="ArtistID" QueryStringField="AtisID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<br />
<br />
<table class="auto-style1" align="center">
    <tr>
        <td class="auto-style2">Art ID:</td>
        <td><asp:TextBox ID="ArtIDTextBox" runat="server" Enabled="false"/></td>
    </tr>
    <tr>
        <td class="auto-style2">Artist ID:</td>
        <td><asp:TextBox ID="ArtistIDTextBox" runat="server" Enabled="false"/></td>
    </tr>
    <tr>
        <td class="auto-style2">Art Name:</td>
        <td>
            <asp:TextBox ID="Art_NameTextBox" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredFieldArtName" runat="server"
                ErrorMessage="Art Name is required." Font-Italic="true" ForeColor="Red" ControlToValidate="Art_NameTextBox">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorString" runat="server"
                ErrorMessage="Do not include special character (e.g. @,!,#,$,%,^,...)" Font-Italic="true" ForeColor="Red"
                ValidationExpression="[a-zA-Z0-9 ]*" ControlToValidate="Art_NameTextBox">
            </asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Description:</td>
        <td>
            <asp:TextBox ID="DescriptionTextBox" TextMode="MultiLine" Columns="40" Rows="4" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredFieldDescription" runat="server"
                ErrorMessage="Description is required." Font-Italic="true" ForeColor="Red" ControlToValidate="DescriptionTextBox">
            </asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Category:</td>
        <td>
            <asp:Label ID="CategoryLabel" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="-1">--Select Category--</asp:ListItem>
                <asp:ListItem>Abstract</asp:ListItem>
                <asp:ListItem>Drawings-illustration</asp:ListItem>
                <asp:ListItem>Painting</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldDropDownList1" runat="server"
                ErrorMessage="Please select the category back if it remains the same." Font-Italic="true" ForeColor="Red" InitialValue="-1" ControlToValidate="DropDownList1">
            </asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Price:</td>
        <td>
            <asp:TextBox ID="PriceTextBox" placeholder="e.g 2.00" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredFieldPrice" runat="server"
                ErrorMessage="Price is required." Font-Italic="true" ForeColor="Red" ControlToValidate="PriceTextBox">
            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="ComparePrice" runat="server" ErrorMessage="The price must be in 2 decimal point."
                Font-Italic="true" ForeColor="Red" Operator="DataTypeCheck" Type="Double" ControlToValidate="PriceTextBox" >
            </asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Number Of Stock:</td>
        <td>
            <asp:TextBox ID="NoOfStockTextBox" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredFieldNOS" runat="server"
                ErrorMessage="Number of stock is required." Font-Italic="true" ForeColor="Red" ControlToValidate="NoOfStockTextBox">
            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareNOS" runat="server" ErrorMessage="The Number Of Stock must be in positive value and whole number."
                Font-Italic="true" ForeColor="Red" Operator="DataTypeCheck" Type="Integer" ControlToValidate="NoOfStockTextBox" >
            </asp:CompareValidator>
        </td>
    </tr>
    <tr id="uploadRow" runat="server">
        <td class="auto-style2">Image: </td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Status: </td>
        <td>
            <asp:Label ID="StatusLabel" runat="server"></asp:Label>
        </td>
    </tr>
    <tr id="dll2" runat="server">
        <td></td>
        <td>
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem Value="-1">--Select Status--</asp:ListItem>
                <asp:ListItem>AVAILABLE</asp:ListItem>
                <asp:ListItem>UNAVAILABLE</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ErrorMessage="Please select the category back if it remains the same." Font-Italic="true" ForeColor="Red" InitialValue="-1" ControlToValidate="DropDownList2">
            </asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Date Uploaded:</td>
        <td>
            <asp:TextBox ID="DateUploadedTextBox" runat="server" Enabled="false"/>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Time Uploaded:</td>
        <td>
            <asp:TextBox ID="TimeUploadedTextBox" runat="server" Enabled="false"/>
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Button ID="UpdateButton" runat="server" Text="Update" OnClick="Button1_Click"/>
            &nbsp;&nbsp; <asp:Button ID="CancelButton" runat="server" Text="Cancel" OnClick="Button2_Click" />
        &nbsp;&nbsp; <asp:Button ID="DeleteButton" runat="server" Text="Delete" OnClick="Button3_Click" />
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/artistModule/viewArt.aspx">View Art</asp:HyperLink>
        </td>
    </tr>
</table>