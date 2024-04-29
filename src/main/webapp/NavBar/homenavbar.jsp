<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>Delicious Food</title>
    <link rel="stylesheet" href="navstyle.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" /> 
    
  <!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"> -->
 
   </head>
<body>  

  <nav>
    <div class="navbar">
      <i class='bx bx-menu'></i>
      <div class="logo"><a href="#">FoodDelivery</a></div>
      <div class="nav-links">
        <div class="sidebar-logo">
          <span class="logo-name">FoodDelivery</span>
          <i class='bx bx-x' ></i>
        </div> 
        <ul class="links">
         <!-- <li><a href="#">HOME</a></li> -->
          <li>
            <a href="#"><strong style="font-size:18px;">Catgories</strong></a>
            <i class='bx bxs-chevron-down htmlcss-arrow arrow  '></i>
            <ul class="htmlCss-sub-menu sub-menu">
              <li><a href="#"><strong>Chicken</strong></a></li>
              <li><a href="#"><strong>Pizza</strong></a></li>
              <li><a href="#"><strong>Burger</strong></a></li>
              <li><a href="#"><strong>Biryani</strong></a></li>
              <li><a href="#"><strong>Fish Dish</strong></a></li>
              <li><a href="#"><strong>Veg</strong></a></li>
            
            </ul>
          </li>
          
          <li><a href="#"><strong style="font-size:18px;">About Us</strong></a></li>
          <li><a href="#"><strong style="font-size:18px;">Contact Us</strong></a></li>
       
  <li><a href="#!" data-toggle="modal" data-target="#cart"><i class="fas fa-cart-plus" style="font-size:24px; color:white;"></i><span class="cart-items" style="font-size:13px;">(0)</span></a></li>   
         <!--  <li><strong style="color:white;">Hello! rajveersingh</strong></li> -->
          
        </ul>
      </div>
  
      <div class="search-box">
        <i class='bx bx-search'></i>
        <div class="input-box">
          <input type="text" placeholder="Search...">
        </div>
      </div>

       <!-- -->

    <a href="login" style="text-decoration: none;"><i class="fas fa-sign-out-alt" style="font-size:18px; color:white;"></i><strong style="font-size:18px; color:white;">SignOut</strong></a>     
       
       <!-- -->       

</div>
  </nav>
    
  <script src="navscript.js"></script>


</body>
</html>