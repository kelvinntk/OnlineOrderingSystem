<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="CustomerModule.Customer_Module.Cart" MasterPageFile="~/Customer_Module/CustomerMasterPage.Master" %>

<%@ Register TagPrefix="UserControl1" TagName="Header" Src="~/Customer_Module/ArtImageUserControl.ascx" %>

<asp:Content ID="customerCart" ContentPlaceHolderID="CustomerContentPlaceHolder" runat="server">

    <h1>Cart</h1>

    <br />

    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewPadding" OnDataBound="GridView1_DataBound" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="CustomerID,ItemID" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
        
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

        <Columns>

            <asp:TemplateField HeaderText="">

                <ItemTemplate>

                    <UserControl1:Header ID="Header1" runat="server"/>

                    <%--<asp:Image ID="Image1" runat="server" Width="400px" Height="300px" ImageUrl='<%# "ShowImage.ashx?ItemID=" + Eval("ItemID") %>'/>--%>
                </ItemTemplate>

            </asp:TemplateField>

            <asp:BoundField DataField="Item_Name" HeaderText="Item_Name" SortExpression="Item_Name" ReadOnly="True" />
            <asp:BoundField DataField="Price" HeaderText="Price (RM)" SortExpression="Price" ReadOnly="True" DataFormatString="{0:n}" HtmlEncode="False" />

            <asp:TemplateField HeaderText="Quantity">
                <EditItemTemplate>
                    <asp:TextBox ID="Quantity" runat="server" Text='<%# Bind("Quantity") %>' TextMode="Number" />

                    <br />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ErrorMessage="Field cannot be empty!" 
                            ControlToValidate="Quantity"
                            CssClass="ValidationError"
                        ></asp:RequiredFieldValidator>

                    <br />

                    <asp:RangeValidator runat="server" Type="Integer" 
                        MinimumValue="1" MaximumValue='<%# Eval("NoOfStock") %>' ControlToValidate="Quantity" 
                        ErrorMessage='<%# "Value must be a whole number between 1 and " + Eval("NoOfStock") %>' />

                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="labelApp" runat="server" Text='<%# Bind("Quantity") %>'/>
                </ItemTemplate>
            </asp:TemplateField>

            <%--<asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ValidateRequestMode="Enabled" />--%>

            <asp:BoundField DataField="Total" HeaderText="Total (RM)" SortExpression="Total" ReadOnly="True" DataFormatString="{0:n}" HtmlEncode="False" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton><br />
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton><br />
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        <EditRowStyle BackColor="#999999" ForeColor="White" />
        <EmptyDataTemplate>
            Your cart is empty!
        </EmptyDataTemplate>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

    <br />
    <br />
    <br />

    <div align="center">
        
    <asp:Button ID="Button3" runat="server" style="padding:0.3em;" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="0.1em" Font-Size="1.75em" ForeColor="Black" OnClick="Button3_Click" Text="Checkout" />

    </div>

    <br />
    <br />
    <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM Cart WHERE CustomerID = @CustomerID AND ItemID = @ItemID" SelectCommand="SELECT C.CustomerID AS &quot;CustomerID&quot;, C.ItemID AS &quot;ItemID&quot;, C.Item_Name AS &quot;Item_Name&quot;, C.Price AS &quot;Price&quot;, C.Quantity AS &quot;Quantity&quot;, C.Total AS &quot;Total&quot;, C.Image AS &quot;Image&quot;, 
A.ItemID AS &quot;ItemID&quot;, A.NoOfStock AS &quot;NoOfStock&quot; 
FROM Cart C, Item A 
WHERE C.CustomerID = @CustomerID AND C.ItemID = A.ItemID" UpdateCommand="UPDATE Cart SET Quantity = @Quantity WHERE CustomerID = @CustomerID AND ItemID = @ItemID">
        <DeleteParameters>
            <asp:Parameter Name="CustomerID" />
            <asp:Parameter Name="ItemID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter Name="CustomerID" SessionField="CustomerID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Quantity" />
            <asp:Parameter Name="CustomerID" />
            <asp:Parameter Name="ItemID" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />

</asp:Content>
