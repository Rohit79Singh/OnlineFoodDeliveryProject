<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
 <script src="js/script.js"></script>

<!--  -->
  <link rel="stylesheet" href="NavBar/navstyle.css">
  <!--  -->

</head>
<body>

<!--  -->
<%@include file="NavBar/homenavbar.jsp" %>
<!--  -->


<div class="container">

<div class="row" style="margin-top:70px;">

<div class="col-md-6">

<!-- card -->
<div class="card">

<div class="card-body">

<h2>Selected Items</h2>

<div class="cart-body">

</div>

</div>

</div>

</div>

<div class="col-md-6">
   <!-- form details -->
     <!-- card -->
     <div class="card">

<div class="card-body">

<h3 class="text-center mb-5" >Your details for order</h3>
<form action="#!">

<div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
  <div class="form-group">
    <label for="name">Your Name</label>
    <input type="email" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
     </div>

<div class="form-group">
    <label for="exampleFormControlTextarea1">Your Shipping Address</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="Enter Your Address" rows="3"></textarea>
  </div>

<div class="container">

<button class="btn btn-outline-success">Order Now</button>
<button class="btn btn-outline-success">Continue Shopping</button>

</div>

</form>

</div>

</div>


</div>

</div>

</div>

<!--  -->
<%@include file="modals/commonmodal.jsp" %>
<!--  -->

<!-- --------- -->
<script src="NavBar/navscript.js"></script>
<!-- ---------- -->

</body>
</html>