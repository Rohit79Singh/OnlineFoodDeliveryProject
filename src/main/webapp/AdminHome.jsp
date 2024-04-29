<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.springboot.main.AdminCategoryProduct.Category"
             import="com.springboot.main.AdminCategoryProduct.Product"                        
                   import="java.util.List"  %>  
    
   
     <%@ page isELIgnored = "false" %> 

<!DOCTYPE html>
<html lang="en">
<head>
  <title>AdminHomePage</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="NavBar/navstyle.css">
  <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<style>

  .col-lg {
     margin-right:1%;
     box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  }

div.card {
  
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  
}

  img {
  border-radius: 50%;
}

h3{
     color:Gray;
}

#categories td {
  border-bottom: 1px solid #ddd;
  padding: 8px;
}

#categories {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#categories tr:nth-child(even){background-color: #f2f2f2;}

#categories tr:hover {background-color: #ddd;}

#product {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#product th {
  border: 1px solid #ddd;
  padding: 8px;
  padding-top: 10px;
  padding-bottom: 10px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}

#product td {
  border: 1px solid #ddd;
}

#product tr:nth-child(even){background-color: #f2f2f2;}

#product tr:hover {background-color: #ddd;}

</style>

</head>
<body>


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
         
          <li>
            <a href="sendhometoadmin"><strong style="font-size:18px;">HOME</strong></a>
       
          </li>
          
          <li><a href="#" data-toggle="modal" data-target="#aboutUs"><strong style="font-size:18px;">About Us</strong></a></li>
          <li><a href="#" data-toggle="modal" data-target="#contactUs"><strong style="font-size:18px;">Contact Us</strong></a></li>
          
          <%
            String adminName = (String) request.getAttribute("adminName");
          %>
          <% if(adminName!=null){ %>
          
          <li><strong style="color:white;">Hello! <%=adminName %></strong></li>
          
          <% } %>
          
        </ul>
      </div>

    <a href="admin" style="text-decoration: none;"><i class="fas fa-sign-out-alt" style="font-size:18px; color:white;"></i><strong style="font-size:18px; color:white;">SignOut</strong></a>     
       
       <!-- -->       

</div>
  </nav>
  

<!-- End of Bar -->



<!-- Send Message on JSP Page -->
              
              <div style="margin-top:80px;">
              
               <% 
               String str1 = (String) request.getAttribute("errorMessage");
                  String str2 = (String) request.getAttribute("Message");
                  %>
                  
               <% if(str1!=null){ %>
               
               <div class="alert alert-danger">
               <strong><%=str1 %>!</strong>
               </div>
               
               <% } %>
               
               <% if(str2!=null){ %>
               
               <div class="alert alert-success">
               <strong><%=str2 %>!</strong>
               </div>
               
               <% } %>
               
               </div>
               
               <!-- End -->


<div class="container-fluid">

  <div class="container-fluid">
  
  <!-- first row -->
  
    <div class="row" style="margin:100px 250px 0px 0px;">
      <div class="col-lg" style="background-color:lavender;">
      
      <!-- first col -->
      
       <div class="card">
          <div class="card-body text-center">

             <img style="max-width:70px;" src="image/team.png"><br>
             <p style="font-size:27px;">${users }</p>
             <h3>USERS</h3>

      </div>
      </div>
      
      </div>
      <div class="col-lg" style="background-color:lavenderblush;">
      
      <!-- second col -->
      
      <div class="card" data-toggle="modal" data-target="#viewCategory">
          <div class="card-body text-center">

             <img style="max-width:70px;" src="image/categories.png"><br><br>
             <p>View Categories</p>
             <h3>CATEGORY</h3>

      </div>
      </div>
      
      </div>
      <div class="col-lg" style="background-color:lavender;">
      
      <!-- third col -->
      
      <div class="card" data-toggle="modal" data-target="#viewProduct">
          <div class="card-body text-center">

             <img style="max-width:70px;" src="image/products.png"><br><br>
             <p>View Products</p>
             <h3>PRODUCTS</h3>

      </div>
      </div>
      
      </div>
    </div>  
  </div>
  <br>
  
  <div class="container-fluid">
  
  <!-- second row -->
  
    <div class="row" style="margin-left:0px; margin-right:250px;">
      <div class="col-lg" style="background-color:lavenderblush;">
      
      <!-- fourth col -->
      
      <div class="card" data-toggle="modal" data-target="#add-category-modal">
          <div class="card-body text-center">

             <img style="max-width:70px;" src="image/addcategory.png"><br><br>
             <p>Click here to add category</p>
             <h3>ADD CATEGORY</h3>

      </div>
      </div>
      
      </div>
      <div class="col-lg" style="background-color:lavender;">
      
      <!-- five col -->
      
      <div class="card" data-toggle="modal" data-target="#add-product-modal">
          <div class="card-body text-center">

            <img style="max-width:70px;" src="image/additem.png"><br><br>
             <p>Click here to add products</p>
             <h3>ADD PRODUCTS</h3>

      </div>
      </div>
      
      </div>
      </div>  
  </div>
</div>


<!-- add category model -->

<!-- Modal -->
  <div class="modal fade" id="add-category-modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Add Category</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
        <div class="modal-body">                      
        
          <form action="addCategory" method="post">

               <div class="form-group">
               <input type="text" class="form-control" name="categoryTitle" placeholder="Enter Category Title" required />
               </div>

               <div class="containe text-center">
                   <input type="Submit" class="btn btn-outline-success" value="Add Category" />
               </div>
               
               <div class="containe">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>          
        </div>

           </form>          
          
          
          
        </div>
        
      </div>
      
    </div>
  </div>

<!-- end category model -->


<!-- Add product modal -->

<div class="modal fade" id="add-product-modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Add Product</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
           </div>
        <div class="modal-body">
        
        
         <form action="addProduct" method="post" enctype="multipart/form-data" >

               <div class="form-group">
               <input type="text" class="form-control" name="productName" placeholder="Enter Product Name" required />
               </div>
               
               <div class="form-group">
               <textarea style="height: 130px;" class="form-control" name="productDesc" placeholder="Enter Product Description"></textarea>
               </div>
               
               <div class="form-group">
               <input type="number" class="form-control" name="productPrice" placeholder="Enter Product Price" required />
               </div>
               
               <div class="form-group">
               <input type="number" class="form-control" name="productQuantity" placeholder="Enter Product Quantity" required />
               </div>
                            
                            
               <!-- Getting value from Database in setCategory -->         
             
                                 
               <div class="form-group">
                   <select name="catId" class="form-control" id="">
        
                   
                   <%         
                    List<Category> getCategory = (List<Category>) request.getAttribute("setCategory");                   
                   %>
                                      
                   <%
                       for(Category storeCategory: getCategory){                    	   
    	           %>
    	                              
                     <option value= " <%= storeCategory.getId() %> " > <%= storeCategory.getCategoryTitle() %>  </option>
                     
                   <% } %>
           
                          
                 <!-- End -->
                      
                   </select>                  
               </div>
               
               
               <!--  -->
               
               <div class="form-group">
               <label for="proPhoto">Select Picture of Product</label>
               <br>
               <input type="file" name="productPhoto" id="proPhoto" required />
               </div>

               <div class="containe text-center">
                   <input type="Submit" class="btn btn-outline-success" value="Add Product" />
               </div>
               
               <div class="containe">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>          
        </div>

           </form>
          
          
          
        </div>
        
      </div>
      
    </div>
  </div>

<!-- End product modal -->


<!-- View Category Modal -->

<div class="container">

  <!-- The Modal -->
  <div class="modal fade" id="viewCategory">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Categories</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        
         <!--  Modal body.. -->
         
              <table id="categories">
              
         <%
                       for(Category storeCategory: getCategory){                    	   
    	           %>
    	           
    	              <tr>
    	                 <td><%= storeCategory.getCategoryTitle() %></td>
 <td><a href="/deleteCategory?category=<%= storeCategory.getId() %>"><i class="fas fa-trash"></i></a></td>
    	              </tr>             
                                              
                   <% } %>
                   
                   </table>
         
         <!-- End Modal Body -->
          
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>

<!-- End View Category Modal -->


<!-- View Product Modal -->

<div class="container">

  <!-- The Modal -->
  <div class="modal fade" id="viewProduct">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Product List</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        
          <!-- Modal body.. -->
          
          <table id="product">
              <tr>
                 <th>Image</th>
                 <th>Name</th>
                 <th>Price</th>
                 <th>Description</th>
                 <th>Quantity</th>
                 <th>Update</th>
                 <th>Delete</th>
              </tr>
              
              <%
        List<Product> getProduct = (List<Product>) request.getAttribute("SendingProductValue");
     %>
     
             <%
      for(Product storeProduct: getProduct){                    	   
    	 %>    	                              
           
        <tr>
<td><img src="image/ProductImage/<%= storeProduct.getProductPhoto() %>" alt="Productimage" style="max-width:50px;"> </td>
           <td><%= storeProduct.getProductName() %></td>
           <td><%= storeProduct.getProductPrice() %></td>
           <td><%= storeProduct.getProductDesc() %></td>
           <td><%= storeProduct.getProductQuantity() %></td>
<td><a href="/updateProduct?product=<%= storeProduct.getId() %>"> Update </a> </td>
<td><a href="/deleteProduct?product=<%= storeProduct.getId() %>"><i class="fas fa-trash"></i></a></td>
       </tr>    
  
              <% } %>
               
          </table>
          
          <!-- End Modal body.. -->
          
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>

<!-- End View Product Modal -->


<!-- About Us Modal -->

  <!-- Modal -->
  <div class="modal fade" id="aboutUs">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">About Us</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Esse reiciendis quaerat nobis 
            deleniti amet non inventore. Reprehenderit recusandae voluptatibus minus tenetur itaque numquam 
            cum quos dolorem maxime. Quas, quaerat nisi. Lorem ipsum dolor sit, amet consectetur adipisicing 
            elit. Cumque facilis, quaerat cupiditate nulla quibusdam quo sunt esse tempore inventore vel 
            voluptate, amet laudantium adipisci veniam nihil quam molestiae omnis mollitia.
        </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

<!-- End About Us Modal -->


<!-- Contact Us Model -->

<!-- Modal -->
  <div class="modal fade" id="contactUs">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Contact Us</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <p>+91 XXXXXXXXXX/ +91 XXXXXXXXXX</p>
          <p>XXXXX@gmail.com</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

<!-- End Contact Us Model -->


<script src="NavBar/scriptforadminhome.js"></script>

</body>
</html>