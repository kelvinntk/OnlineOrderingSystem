<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreditCard.aspx.cs" Inherits="OnlineOrderingSystem.Customer_Module.CreditCard" MasterPageFile="~/Customer_Module/CustomerMasterPage.Master" %>

<asp:Content ID="customerCart" ContentPlaceHolderID="CustomerContentPlaceHolder" runat="server">

    <h1>Credit Card Details</h1>

    <div align="center">

        <br />

    <asp:Table ID="Table1" runat="server" BorderColor="Black" BorderStyle="Solid" CellPadding="50" CellSpacing="35" style="text-align:left;" Width="80%">

        <asp:TableRow>

            <asp:TableCell Width="25%">

                <asp:Label ID="Label1" runat="server" Text="Card Holder Name"></asp:Label>

            </asp:TableCell>

            <asp:TableCell>

                <asp:TextBox ID="TextBoxCardHolderName" runat="server" style="width:100%;" size="50" placeholder="Stephanie Heartily" pattern="[A-Z a-z]+" required="required"></asp:TextBox>

            </asp:TableCell>

        </asp:TableRow>

        <asp:TableRow>

            <asp:TableCell>

                <asp:Label ID="Label2" runat="server" Text="Card Number"></asp:Label>

            </asp:TableCell>

            <asp:TableCell>

                <asp:TextBox ID="TextBoxCardNumber" onKeyUp="masking(this.value,this,event);" runat="server" style="width:50%;" maxlength="19" placeholder="1234 1234 1234 1234" pattern="[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{4}" required="required" ></asp:TextBox>

            </asp:TableCell>

        </asp:TableRow>

        <asp:TableRow>

            <asp:TableCell>

                <asp:Label ID="Label3" runat="server" Text="CVV"></asp:Label>

            </asp:TableCell>

            <asp:TableCell>

                <asp:TextBox ID="TextBoxCVV" runat="server" size="5" maxlength="3" placeholder="010" pattern="[0-9]{3}" required="required" ></asp:TextBox>

            </asp:TableCell>

        </asp:TableRow>

        <asp:TableRow>

            <asp:TableCell>

                <asp:Label ID="Label4" runat="server" Text="Expiry Date"></asp:Label>

            </asp:TableCell>

            <asp:TableCell>

                <asp:Label ID="Label5" runat="server" Text="Month"></asp:Label>

                &nbsp;

                <asp:TextBox ID="TextBoxExpiryMonth" runat="server" size="5" maxlength="2" placeholder="05" pattern="[0-1]{1}[0-9]{1}" required="required"></asp:TextBox>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Label ID="Label6" runat="server" Text="Year"></asp:Label>

                &nbsp;

                <asp:TextBox ID="TextBoxExpiryYear" runat="server" size="5" maxlength="2" placeholder="21" pattern="[1-3]{1}[0-9]{1}" required="required"></asp:TextBox>
                <%--<asp:TextBox ID="TextBox1" runat="server" size="5" maxlength="2" placeholder="21" pattern="0[0-9]|1[0-9]" required="required"></asp:TextBox>--%>

            </asp:TableCell>

        </asp:TableRow>

        <asp:TableRow>

            <asp:TableCell>

                <asp:Label ID="Label7" runat="server" Text="Credit Card Type"></asp:Label>

            </asp:TableCell>

            <asp:TableCell>

                <asp:DropDownList ID="DropDownList1" runat="server" onchange="imageChange(this);">
                    <asp:ListItem>Visa</asp:ListItem>
                    <asp:ListItem>Master Card</asp:ListItem>
                    <asp:ListItem>American Express</asp:ListItem>
                </asp:DropDownList>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <img src="images/Visa_logo.png" id="companyLogo" style="height: 50px; width: 100px;" />

            </asp:TableCell>

        </asp:TableRow>

    </asp:Table>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

            <script type='text/javascript'>
                
                function masking(input, textbox, e)
                {
                    if (input.length == 4 || input.length == 9 || input.length == 14)
                    {
                        if (e.keyCode != 8)
                        {
                            input = input + ' ';
                        }

                        textbox.value = input;
                    }
                }

            </script>

        <script>
        
        function imageChange(dropDownList)
        {
            var dropDownList = document.getElementById(dropDownList.id);

            var companyLogo = document.getElementById("companyLogo");
            
            if (dropDownList.value == "Visa")
            {
                document.getElementById("companyLogo").src = "images/Visa_logo.png";
                companyLogo.style.height = '50px';
                companyLogo.style.width = '100px';
            }
            else if (dropDownList.value == "Master Card")
            {
                document.getElementById("companyLogo").src = "images/MasterCard_Logo.png";
                companyLogo.style.height = '50px';
                companyLogo.style.width = '80px';
            }
            else if (dropDownList.value == "American Express")
            {
                document.getElementById("companyLogo").src = "images/American_Express_logo.png";
                companyLogo.style.height = '50px';
                companyLogo.style.width = '50px';
            }
        }
        
    </script>

    <br />
    <br />
    <br />

    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Customer_Module/Checkout.aspx"><input id="B1" type="button" value="Cancel" style="padding:0.3em; background-color: transparent; border: 0.1em solid black; font-size: 1.75em; color: black;" /></asp:HyperLink>

    <asp:Button ID="Button1" runat="server" style="padding:0.3em;" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="0.1em" Font-Size="1.75em" ForeColor="Black" OnClick="Button1_Click" Text="Confirm" />

    </div>

    <br />
    <br />
    <br />

</asp:Content>
