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
   <%-- <asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">--%>

   <%-- <img src="img/admin.jpg" Style="width:90%;margin-left:5%"/>--%>

    <script>
        
        var repeatSlideshow;
        
    function showSlides()
    {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        
        for (i = 0; i < slides.length; i++)
        {
            slides[i].style.display = "none";  
        }
        
        slideIndex++;
        
        if (slideIndex > slides.length)
        {
            slideIndex = 1;
        }
        
        for (i = 0; i < dots.length; i++)
        {
            dots[i].className = dots[i].className.replace(" thisSlide", "");
        }
        
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " thisSlide";
        repeatSlideshow = setTimeout(showSlides, 2500); // Change image every ? seconds
    }
    
    function currentSlide(n)
    {
        clearTimeout(repeatSlideshow);
        chooseSlides(slideIndex = n);
    }

    function chooseSlides(n)
    {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");

        if (n > slides.length)
        {
            slideIndex = 1;
        }    

        if (n < 1)
        {
            slideIndex = slides.length;
        }

        for (i = 0; i < slides.length; i++)
        {
            slides[i].style.display = "none";  
        }

        for (i = 0; i < dots.length; i++)
        {
            dots[i].className = dots[i].className.replace(" thisSlide", "");
        }

        slides[slideIndex-1].style.display = "block";  
        dots[slideIndex-1].className += " thisSlide";

        repeatSlideshow = setTimeout(showSlides, 2500);
    }

        </script>

    <div class="slideshow-container">

            <div class="mySlides fade">
                <img class="indexWallpaper" src="images/admin.jpg" style="width:100%" alt="photo_1" />
                <%--<div class="text"> <img class="miniLogoIMG" src="images/logo.jpeg" </div>--%>
            </div>

            <div class="mySlides fade">
                <img class="indexWallpaper" src="images/background.jpg" style="width:100%" alt="photo_2" />
                <%--<div class="text"> <img class="miniLogoIMG" src="images/logo.jpeg"</div>--%>
            </div>

            <div class="mySlides fade">
                <img class="indexWallpaper" src="images/back4.jpg" style="width:100%" alt="photo_3" />
                <%--<div class="text"> <img class="miniLogoIMG" src="images/logo.jpeg" </div>--%>
            </div>

        </div>
        
        <br/>

        <div style="text-align:center">
            <span class="dot" onclick="currentSlide(1)"></span> 
            <span class="dot" onclick="currentSlide(2)"></span> 
            <span class="dot" onclick="currentSlide(3)"></span>
        </div>

    <br />

    <div align="center">

    <asp:Button ID="Button1" runat="server" style="padding:0.3em;" Text="View Staff" BackColor="#999999" BorderColor="Black" BorderStyle="Solid" Font-Size="1.21em" ForeColor="Black" OnClick="Button1_Click" Height="103px" Width="450px" />
    <asp:Button ID="Button2" runat="server" Text="View Customer" BackColor="#999999" BorderColor="Black" BorderStyle="Solid" Font-Size="1.21em" ForeColor="Black" OnClick="Button2_Click" Height="103px" Width="450px" />
    </div>

    <script>
            
            var slideIndex = 0;
            
            showSlides();
            
        </script>


    <%--<div Style="margin-top:10%">
        <a href="viewStaff.aspx" class="frst">View Staff</a>
        <a href="viewCust.aspx" class="scd">View Customer</a>
    </div>--%>
</asp:Content>
