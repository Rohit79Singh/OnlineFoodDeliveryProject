<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.springboot.main.AdminCategoryProduct.Category"                  
                   import="java.util.List"  %>  
    
   
     <%@ page isELIgnored = "false" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 
</head>
<body>

<!-- Update Product Modal -->

       <%
           Long categoryId = (Long) request.getAttribute("CategoryId");  
           %>

<div class="container" style="width:700px; border:1px solid;">
      
       <h2 style="text-align:center;">Update Product</h2>
      
         <form action="setProduct" method="post" enctype="multipart/form-data" >
               
               <input type="hidden" name="productId" id="productId" value="${ProductId }">
                              
               <div class="form-group">
               <label for="ProductName">Product Name:</label>
               <input type="text" class="form-control" name="productName" id="ProductName" placeholder="Enter Product Name" value="${ProductName }" required />
               </div>
               
               <div class="form-group">
               <label for="ProductDesc">Product Description:</label>
               <textarea style="height: 130px;" class="form-control" name="productDesc" id="ProductDesc" placeholder="Enter Product Description">${ProductDesc }</textarea>
               </div>
               
               <div class="form-group">
               <label for="ProductPrice">Product Price:</label>
               <input type="number" class="form-control" name="productPrice" id="ProductPrice" placeholder="Enter Product Price" value="${ProductPrice }" required />
               </div>
               
               <div class="form-group">
               <label for="ProductQuantity">Product Quantity:</label>
               <input type="number" class="form-control" name="productQuantity" id="productQuantity" placeholder="Enter Product Quantity" value="${ProductQuantity }" required />
               </div>
                            
                            
               <!-- Getting value from Database in setCategory -->         
             
               <%         
                 List<Category> getCategory = (List<Category>) request.getAttribute("setCategory");                   
                   %>          
                                 
               <div class="form-group">
                   <label for="productcategory">Select Category:</label>
                   <select name="catId" class="form-control" id="productcategory">
                                      
                   <%
                       for(Category storeCategory: getCategory){                    	   
    	           %>
    	                              
                     <option value= " <%= storeCategory.getId() %> " 
                     
                     <% if(categoryId.equals(storeCategory.getId())){ %>
                      selected >
                      <%} else { %>
                          >
                      <%} %>
                      
                       <%= storeCategory.getCategoryTitle() %>  </option>        
                     
                  
                   <% } %>  
                          
                 <!-- End -->
                      
                   </select>                  
               </div>
               
               <img src="image/ProductImage/${ProductPhoto }" style="max-width:100px; border-radius: 50%;"> 
               <!--  -->
               
               <div class="form-group">
               <label for="proPhoto">Select Picture of Product</label>
               <br>
               <input type="file" name="productPhoto" id="proPhoto">
               </div>

             <div class="row" style="margin-left:35%; margin-bottom:2%;">

               <div class="col-sm-2">
                   <input type="Submit" class="btn btn-primary" value="Update" />
               </div>
               <div class="col-sm-2">
                 <a class="btn btn-primary" href="cancelUpdateProduct">Cancel</a>
               </div>

             </div>

           </form>

</div>

<!-- End Update Product Modal -->

</body>
</html>