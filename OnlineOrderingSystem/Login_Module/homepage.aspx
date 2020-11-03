<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="OnlineOrderingSystem.Login_Module.homepage" MasterPageFile="~/Login_Module/loginMaster.Master" %>

<asp:Content ID="customerHome" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">

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
        .button {
            background-color: white;
            color: black;
            border: 2px solid #555555;
            font-size: 20px;
            font-weight: 600;
            padding-top: 10px;
            padding-bottom: 10px;
            padding-left: 20px;
            padding-right: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 25px 0px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, color 0.3s;
        }
        .button:hover {
            background-color: #3FFF33;
            border: 2px solid #3FFF33;
            color: white;
        }
    </style>
    <br />
    <h1 class="heading">Welcome to FoodX</h1>
    <br />
    <div class="slideshow-container">

            <div class="mySlides fade">
                <img class="indexWallpaper" src="images/food.jpg" style="width:100%" alt="photo_1" />
                <div class="text"> <img class="miniLogoIMG" src="images/logo.jpeg" alt="logo" /> FoodX Brings Happiness to You </div>
            </div>

            <div class="mySlides fade">
                <img class="indexWallpaper" src="images/friedRice.jpg" style="width:100%" alt="photo_2" />
                <div class="text"> <img class="miniLogoIMG" src="images/logo.jpeg" alt="logo" /> We use wok to cook Egg Fried Rice </div>
            </div>

            <div class="mySlides fade">
                <img class="indexWallpaper" src="images/delicous.jpg" style="width:100%" alt="photo_3" />
                <div class="text"> <img class="miniLogoIMG" src="images/logo.jpeg" alt="logo" /> Delicious Food created with perfection </div>
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

    <asp:Button ID="Button1" runat="server" style="padding:0.3em;" class="button" Text="START"  BorderWidth="0.1em" Font-Size="1.75em" Font-Strikeout="False" OnClick="Button1_Click" />

    </div>

<script>
            
   var slideIndex = 0;
            
   showSlides();
            
</script>

</asp:Content>
