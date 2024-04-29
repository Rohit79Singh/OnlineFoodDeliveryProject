<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.springboot.main.AdminCategoryProduct.Category"
             import="com.springboot.main.AdminCategoryProduct.Product"                        
                        import="java.util.List"  %>
    
    <%@page isELIgnored = "false" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Delicious Food</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="js/script.js"></script>

  <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" /> 
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!--   <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> -->

  <!--  -->
  <link rel="stylesheet" href="NavBar/navstyle.css">
  <!--  -->
  
</head>
<body>

<%   
     List<Category> getCategory = (List<Category>) request.getAttribute("SendingCategory");
     
     List<Product> getProduct = (List<Product>) request.getAttribute("SendingProductValue");
     
                   %>

<!-- Navigation Bar -->

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
        <li><a href="/getProductByCategory?category=all"><strong>All Product</strong></a></li>
              
              <%
      for(Category storeCategory : getCategory){                    	   
    	 %>                
              
              <li><a href="/getProductByCategory?category=<%= storeCategory.getId() %>"><strong><%= storeCategory.getCategoryTitle() %></strong></a></li>
             
             <% } %>
              
              
            </ul>
          </li>
          
          <li><a href="#About"><strong style="font-size:18px;">About Us</strong></a></li>
          <li><a href="#help"><strong style="font-size:18px;">Contact Us</strong></a></li>
       <li><a href="#!" data-toggle="modal" data-target="#cart"><i class="fas fa-cart-plus" style="font-size:24px; color:white;"></i><span class="cart-items" style="font-size:13px;">(0)</span></a></li>   
          
          <%
            String userName = (String) request.getAttribute("userName");
          %>
          <% if(userName!=null){ %>
          
          <li><strong style="color:white;">Hello! <%=userName %></strong></li>
          
          <% } %>
          
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

<!-- End of Navigation Bar -->


 <section>

        <div class="main">

            <div class="men_text">
              <!--  <h1>Get Fresh<span>Food</span><br>in a Easy Way</h1> -->
                <h1>Get Fast<span>Food</span><br>Delivery</h1>
            </div>

            <div class="main_image">
             <!--  <img src="image/main_img.png"> -->
              <img src="image/food-delivery.png">
            </div>

        </div>

        <p>
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Esse reiciendis quaerat nobis 
            deleniti amet non inventore. Reprehenderit recusandae voluptatibus minus tenetur itaque numquam 
            cum quos dolorem maxime. Quas, quaerat nisi. Lorem ipsum dolor sit, amet consectetur adipisicing 
            elit. Cumque facilis, quaerat cupiditate nulla quibusdam quo sunt esse tempore inventore vel 
            voluptate, amet laudantium adipisci veniam nihil quam molestiae omnis mollitia.
        </p>

    </section>  



    <!--About-->

    <div class="about" id="About">
        <div class="about_main">

            <div class="image">
               <!-- <img src="image/Food-Plate.png"> -->
               <img src="image/pizzafor.png">
            </div>

            <div class="about_text">
                <h1><span>About</span>Us</h1>
                <h3>Why Choose us?</h3>
                <p>
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Expedita, est. Doloremque 
                    sapiente veritatis laboriosam corrupti optio et maxime. Ad, amet explicabo eaque labore 
                    cupiditate quasi nostrum nemo recusandae id quibusdam? Lorem ipsum dolor sit amet 
                    consectetur adipisicing elit. Doloremque ab, dolores pariatur cum exercitationem, illo nisi 
                    veritatis vitae ea deleniti fugiat quisquam tempora, accusantium corrupti excepturi optio. 
                    Inventore, cupiditate recusandae.
                </p>
            </div>

        </div>

    </div>



    <!--Menu-->

    <div class="menu" id="Menu">
        <h1>Our<span>Menu</span></h1> 
</div>

      <!-- ---product design---- -->

<div class="container">
<div class="row">

<%
      for(Product storeProduct: getProduct){                    	   
    	 %>  

<div class="col-sm-4"> 
<div class="card">
  <img src="image/ProductImage/<%= storeProduct.getProductPhoto() %>">
  <h3><%= storeProduct.getProductName() %></h3>
  <h6>&#8377;<%= storeProduct.getProductPrice() %></h6>
  <p><%= storeProduct.getProductDesc() %></p>
     <ul>
         <li><i class="fa fa-star checked"></i></li>
         <li><i class="fa fa-star checked"></i></li>
         <li><i class="fa fa-star checked"></i></li>
         <li><i class="fa fa-star"></i></li>
   </ul>
  <button onclick= "add_to_cart( <%= storeProduct.getId() %> , '<%= storeProduct.getProductName() %>' , <%= storeProduct.getProductPrice() %> ) ">Add to Cart</button>
</div>
</div>

 <% } %>


</div>
</div>  

      <!-- -----End----- -->


    <!--Gallary-->

    <div class="gallary" id="Gallary">
        <h1>Our<span>Gallary</span></h1>

        <div class="gallary_image_box">
            <div class="gallary_image">
              <!--  <img src="image/gallary_1.jpg"> -->
                  <img src="image/ProductImage/buger.jpg">

                <h3>Food</h3>
                <p>
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Commodi sint eveniet laboriosam 
                </p>
                <a href="#" class="gallary_btn">Order Now</a>
            </div>

            <div class="gallary_image">
              <!--  <img src="image/gallary_2.jpg"> -->
                 <img src="image/ProductImage/biryani.webp">

                <h3>Food</h3>
                <p>
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Commodi sint eveniet laboriosam 
                </p>
                <a href="#" class="gallary_btn">Order Now</a>
            </div>

            <div class="gallary_image">
                <img src="image/ProductImage/lasagna.webp">

                <h3>Food</h3>
                <p>
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Commodi sint eveniet laboriosam 
                </p>
                <a href="#" class="gallary_btn">Order Now</a>
            </div>

            <div class="gallary_image">
                <img src="image/ProductImage/pizza.jpg">

                <h3>Food</h3>
                <p>
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Commodi sint eveniet laboriosam 
                </p>
                <a href="#" class="gallary_btn">Order Now</a>
            </div>

            <div class="gallary_image">
                <img src="image/ProductImage/gallary_5.jpg">

                <h3>Food</h3>
                <p>
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Commodi sint eveniet laboriosam 
                </p>
                <a href="#" class="gallary_btn">Order Now</a>
            </div>

            <div class="gallary_image">
                <img src="image/ProductImage/gallary_6.jpg">

                <h3>Food</h3>
                <p>
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Commodi sint eveniet laboriosam 
                </p>
                <a href="#" class="gallary_btn">Order Now</a>
            </div>

        </div>

    </div>




    <!--Review-->

    <div class="review" id="Review">
        <h1>Customer<span>Review</span></h1>

        <div class="review_box">
            <div class="review_card">

                <div class="review_profile">
                    <img src="image/review_1.png">
                </div>

                <div class="review_text">
                    <h2 class="name">Janney Deo</h2>

                    <div class="review_icon">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>

                    <div class="review_social">
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-instagram"></i>
                        <i class="fa-brands fa-twitter"></i>
                        <i class="fa-brands fa-linkedin-in"></i>
                    </div>

                    <p>
                        Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellendus quam facere 
                        blanditiis in fugiat tempore necessitatibus aliquid. Id adipisci, rem corrupti 
                        asperiores distinctio delectus quae quia tenetur totam laboriosam quam.
                    </p>

                </div>

            </div>

            <div class="review_card">

                <div class="review_profile">
                    <img src="image/review_2.png">
                </div>

                <div class="review_text">
                    <h2 class="name">Brayden</h2>

                    <div class="review_icon">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>

                    <div class="review_social">
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-instagram"></i>
                        <i class="fa-brands fa-twitter"></i>
                        <i class="fa-brands fa-linkedin-in"></i>
                    </div>

                    <p>
                        Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellendus quam facere 
                        blanditiis in fugiat tempore necessitatibus aliquid. Id adipisci, rem corrupti 
                        asperiores distinctio delectus quae quia tenetur totam laboriosam quam.
                    </p>

                </div>

            </div>

            <div class="review_card">

                <div class="review_profile">
                    <img src="image/review_3.png">
                </div>

                <div class="review_text">
                    <h2 class="name">Sofia</h2>

                    <div class="review_icon">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>

                    <div class="review_social">
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-instagram"></i>
                        <i class="fa-brands fa-twitter"></i>
                        <i class="fa-brands fa-linkedin-in"></i>
                    </div>

                    <p>
                        Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellendus quam facere 
                        blanditiis in fugiat tempore necessitatibus aliquid. Id adipisci, rem corrupti 
                        asperiores distinctio delectus quae quia tenetur totam laboriosam quam.
                    </p>

                </div>

            </div>

            <div class="review_card">

                <div class="review_profile">
                    <img src="image/review_4.png">
                </div>

                <div class="review_text">
                    <h2 class="name">John Deo</h2>

                    <div class="review_icon">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>

                    <div class="review_social">
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-instagram"></i>
                        <i class="fa-brands fa-twitter"></i>
                        <i class="fa-brands fa-linkedin-in"></i>
                    </div>

                    <p>
                        Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellendus quam facere 
                        blanditiis in fugiat tempore necessitatibus aliquid. Id adipisci, rem corrupti 
                        asperiores distinctio delectus quae quia tenetur totam laboriosam quam.
                    </p>

                </div>

            </div>

        </div>

    </div>

    <!--Team-->

    <div class="team">
        <h1>Our<span>Team</span></h1>

        <div class="team_box">
            <div class="profile">
                <img src="image/chef1.png">

                <div class="info">
                    <h2 class="name">Chef</h2>
                    <p class="bio">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>

                    <div class="team_icon">
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-twitter"></i>
                        <i class="fa-brands fa-instagram"></i>
                    </div>

                </div>

            </div>

            <div class="profile">
                <img src="image/chef2.png">

                <div class="info">
                    <h2 class="name">Chef</h2>
                    <p class="bio">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>

                    <div class="team_icon">
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-twitter"></i>
                        <i class="fa-brands fa-instagram"></i>
                    </div>

                </div>

            </div>

            <div class="profile">
                <img src="image/chef3.jpg">

                <div class="info">
                    <h2 class="name">Chef</h2>
                    <p class="bio">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>

                    <div class="team_icon">
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-twitter"></i>
                        <i class="fa-brands fa-instagram"></i>
                    </div>

                </div>

            </div>

            <div class="profile">
                <img src="image/chef4.jpg">

                <div class="info">
                    <h2 class="name">Chef</h2>
                    <p class="bio">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>

                    <div class="team_icon">
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-twitter"></i>
                        <i class="fa-brands fa-instagram"></i>
                    </div>

                </div>

            </div>

        </div>

    </div>



    <!--Footer-->

    <footer id="help">
        <div class="footer_main">

            <div class="footer_tag">
                <h2>Location</h2>
                <p>Sri Lanka</p>
                <p>USA</p>
                <p>India</p>
                <p>Japan</p>
                <p>Italy</p>
            </div>

            <div class="footer_tag">
                <h2>Quick Link</h2>
                <p>Category</p>
                <p>About</p>
                <p>Menu</p>
                <p>Gallary</p>
                <p>Order</p>
            </div>

            <div class="footer_tag">
                <h2>Contact</h2>
                <p>+91 7856443389</p>
                <p>+91 7856443389</p>
                <p>ravisinha123@gmail.com</p>
                <p>foodshop123@gmail.com</p>
            </div>

            <div class="footer_tag">
                <h2>Our Service</h2>
                <p>Fast Delivery</p>
                <p>Easy Payments</p>
                <p>24 x 7 Service</p>
            </div>

            <div class="footer_tag">
                <h2>Follows</h2>
                <i class="fa-brands fa-facebook-f"></i>
                <i class="fa-brands fa-twitter"></i>
                <i class="fa-brands fa-instagram"></i>
                <i class="fa-brands fa-linkedin-in"></i>
            </div>

        </div>

        <p class="end">Design by<span><i class="fa-solid fa-face-grin"></i> Rohit Kumar Singh</span></p>

    </footer>


<%@include file="modals/commonmodal.jsp" %>

<!-- --------- -->
<script src="NavBar/navscript.js"></script>
<!-- ---------- -->

</body>
</html>
