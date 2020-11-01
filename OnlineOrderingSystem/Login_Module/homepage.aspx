<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="OnlineOrderingSystem.Login_Module.homepage" MasterPageFile="~/Login_Module/loginMaster.Master" %>

<asp:Content ID="customerHome" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">
<link href="css/loginCSS.css" rel="stylesheet" />
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
    <style type="text/css">
        a {
            font-family: 'Poppins';
            font-weight: 400;
        }
        h1 {
            font-family: 'Poppins';
            font-weight: 400;
        }
        .heading {
            font-size: 50px;
            color: black;
            font-weight: 600;
            text-align: center;
            align-items: center;
            z-index: 1;
        }
    </style>
    <h1 class="heading">Welcome to FoodX</h1>
    <div class="slideshow-container">

            <div class="mySlides fade">
                <img class="indexWallpaper" src="images/1.jpg" style="width:100%" alt="photo_1" />
                <div class="text"> <img class="miniLogoIMG" src="images/logo.jpeg" alt="logo" /> Arteria brings enlightenment to you </div>
            </div>

            <div class="mySlides fade">
                <img class="indexWallpaper" src="images/2.jpg" style="width:100%" alt="photo_2" />
                <div class="text"> <img class="miniLogoIMG" src="images/logo.jpeg" alt="logo" /> Great arts awaits </div>
            </div>

            <div class="mySlides fade">
                <img class="indexWallpaper" src="images/3.jpg" style="width:100%" alt="photo_3" />
                <div class="text"> <img class="miniLogoIMG" src="images/logo.jpeg" alt="logo" /> Amazing arts created with perfection </div>
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

    <asp:Button ID="Button1" runat="server" style="padding:0.3em;" Text="Log In" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="0.1em" Font-Size="1.75em" Font-Strikeout="False" ForeColor="Black" OnClick="Button1_Click" />

    </div>

<script>
            
   var slideIndex = 0;
            
   showSlides();
            
</script>

</asp:Content>
