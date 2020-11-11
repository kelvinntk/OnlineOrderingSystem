<%@ Page Language="C#" MasterPageFile="~/staffModule/staff.Master" AutoEventWireup="true" CodeBehind="viewItem.aspx.cs" Inherits="ItemModule.viewItem" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>View Art</title>
    <style>
    </style>
        <div>
            <u style="font-size: 20px;"><b>Item Posted</b></u><br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID,StaffID" DataSourceID="SqlDataSource1" BorderColor="White" >
                <Columns>
                    <asp:BoundField DataField="ItemID" HeaderText="Item ID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
                    <asp:BoundField DataField="StaffID" HeaderText="Staff ID" ReadOnly="True" SortExpression="StaffID" />
                    <asp:BoundField DataField="Item_Name" HeaderText="Item Name" SortExpression="Item_Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="NoOfStock" HeaderText="No Of Stock" SortExpression="NoOfStock" />
                    <asp:BoundField DataField="DateUploaded" HeaderText="Date Uploaded" SortExpression="DateUploaded" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="TimeUploaded" HeaderText="Time Uploaded" SortExpression="TimeUploaded" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="image1" runat="server" Height="300px" Width="400px" ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("Image"))%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Details">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"itemDetails.aspx?View=vsuccess&Id=" + Convert.ToInt32(Eval("ItemID")) + "&StaffID=" + Convert.ToInt32(Eval("StaffID"))%>'>View Detail</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE ([Status] = @Status)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="AVAILABLE" Name="Status" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            
            <br />
            <br />
            
        </div>
</asp:Content>


