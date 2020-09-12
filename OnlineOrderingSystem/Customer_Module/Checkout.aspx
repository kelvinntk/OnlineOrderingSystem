<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="OnlineOrderingSystem.Customer_Module.Checkout" MasterPageFile="~/Customer_Module/CustomerMasterPage.Master" %>

<asp:Content ID="customerCart" ContentPlaceHolderID="CustomerContentPlaceHolder" runat="server">

    <h1>Checkout</h1>

    <br />

    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewPadding" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="CustomerID,ArtID" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
        
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

        <Columns>

            <asp:TemplateField HeaderText="">

                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Width="400px" Height="300px" ImageUrl='<%# "ShowImage.ashx?ArtID=" + Eval("ArtID") %>'/>
                </ItemTemplate>

            </asp:TemplateField>

            <asp:BoundField DataField="Art_Name" HeaderText="Art_Name" SortExpression="Art_Name" ReadOnly="True" />
            <asp:BoundField DataField="Price" HeaderText="Price (RM)" SortExpression="Price" ReadOnly="True" DataFormatString="{0:n}" HtmlEncode="False" />

            <asp:TemplateField HeaderText="Quantity">
                <EditItemTemplate>
                    <asp:TextBox ID="Quantity" runat="server" Text='<%# Bind("Quantity") %>' TextMode="Number" />

                    <br />

                    <asp:RangeValidator runat="server" Type="Integer" 
                        MinimumValue="1" MaximumValue='<%# Eval("NoOfStock") %>' ControlToValidate="Quantity" 
                        ErrorMessage='<%# "Value must be a whole number between 1 and " + Eval("NoOfStock") %>' />

                    <br />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ErrorMessage="Field cannot be empty!" 
                            ControlToValidate="Quantity"
                            CssClass="ValidationError"
                        ></asp:RequiredFieldValidator>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="labelApp" runat="server" Text='<%# Bind("Quantity") %>'/>
                </ItemTemplate>
            </asp:TemplateField>

            <%--<asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ValidateRequestMode="Enabled" />--%>

            <asp:BoundField DataField="Total" HeaderText="Total (RM)" SortExpression="Total" ReadOnly="True" DataFormatString="{0:n}" HtmlEncode="False" />
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

    <asp:Table ID="Table1" runat="server" style="text-align:left;">

        <asp:TableRow>

            <asp:TableCell>

                <b><asp:Label ID="Label1" runat="server" Text="Sub-total"></asp:Label></b>

            </asp:TableCell>

            <asp:TableCell>

                &nbsp;:&nbsp;<asp:Label ID="LabelTotalAmount" runat="server"></asp:Label>

            </asp:TableCell>

        </asp:TableRow>

        <asp:TableRow>

            <asp:TableCell>

                <b><asp:Label ID="Label2" runat="server" Text="10% SST"></asp:Label></b>

            </asp:TableCell>

            <asp:TableCell>

                &nbsp;:&nbsp;<asp:Label ID="LabelSST" runat="server"></asp:Label>

            </asp:TableCell>

        </asp:TableRow>

        <asp:TableRow>

            <asp:TableCell>

                <b><asp:Label ID="Label3" runat="server" Text="Grand Total"></asp:Label></b>

            </asp:TableCell>

            <asp:TableCell>

                &nbsp;:&nbsp;<asp:Label ID="LabelGrandTotal" runat="server"></asp:Label>

            </asp:TableCell>

        </asp:TableRow>

    </asp:Table>

    <br />
    <br />
    <br />

    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Customer_Module/Cart.aspx"><input id="B1" type="button" value="Cancel" style="padding:0.3em; background-color: transparent; border: 0.1em solid black; font-size: 1.75em; color: black;" /></asp:HyperLink>

    <asp:Button ID="Button1" runat="server" style="padding:0.3em;" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="0.1em" Font-Size="1.75em" ForeColor="Black" OnClick="Button1_Click" Text="Pay with Credit Card" />

    <br />
    <br />

    * Only payment by Credit Card is accepted. Payment modes other than Credit Card is unavailable.

    </div>

    <br />
    <br />
    <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM Cart WHERE CustomerID = @CustomerID AND ArtID = @ArtID" SelectCommand="SELECT C.CustomerID AS &quot;CustomerID&quot;, C.ArtID AS &quot;ArtID&quot;, C.Art_Name AS &quot;Art_Name&quot;, C.Price AS &quot;Price&quot;, C.Quantity AS &quot;Quantity&quot;, C.Total AS &quot;Total&quot;, C.Image AS &quot;Image&quot;, 
A.ArtID AS &quot;ArtID&quot;, A.NoOfStock AS &quot;NoOfStock&quot; 
FROM Cart C, Art A 
WHERE C.CustomerID = @CustomerID AND C.ArtID = A.ArtID" UpdateCommand="UPDATE Cart SET Quantity = @Quantity WHERE CustomerID = @CustomerID AND ArtID = @ArtID">
        <DeleteParameters>
            <asp:Parameter Name="CustomerID" />
            <asp:Parameter Name="ArtID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter Name="CustomerID" SessionField="CustomerID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Quantity" />
            <asp:Parameter Name="CustomerID" />
            <asp:Parameter Name="ArtID" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
