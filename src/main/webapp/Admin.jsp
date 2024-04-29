<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Login & Signup Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="UserAdminLoginCssScript/style.css">    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    
  </head>
  <body>
    <div class="wrapper">
      <div class="title-text">
        <div class="title login">Admin Login</div>
        <div class="title signup">Admin Signup</div>
      </div>
      <div class="form-container">
        <div class="slide-controls">
          <input type="radio" name="slide" id="login" checked>
          <input type="radio" name="slide" id="signup">
          <label for="login" class="slide login">Login</label>
          <label for="signup" class="slide signup">Signup</label>
          <div class="slider-tab"></div>
        </div>
        
        <!-- -------- -->
        
        <% String str1 = (String) request.getAttribute("adminregisterMessage"); %>
               <% if(str1!=null){ %>
               <div class="alert alert-success">
               <strong><%=str1 %>!</strong>
               </div>
               <% } %>
        
        <!-- -------- -->
        
        <!--  -->
              
               <% String str = (String) request.getAttribute("adminloginerror"); %>
               <% if(str!=null){ %>
               <div class="alert alert-danger">
               <strong><%=str %>!</strong>
               </div>
               <% } %>
               
               <!--  -->        
        
        <!-- Admin Login Form -->
        
        <div class="form-inner">
          <form action="loginAdmin" class="login" method="post">
            <div class="field">
              <input type="email" name="adminEmail" id="AdminEmail" placeholder="Admin Email" required>   
            </div>
            <div class="field">
              <input type="password" name="adminPassword" id="AdminPassword" placeholder="Password" required>   
            </div>
            <div class="field">
              <input type="number" name="adminMobileNumber" id="AdminMobileNumber" placeholder="Mobile Number" required> 
            </div>
            <div class="pass-link"><a href="#">Forgot password?</a></div>
            <div class="field btn">
              <div class="btn-layer"></div>
              <input type="submit" value="Login">
            </div>
            <div class="signup-link">Not a member? <a href="">Signup now</a></div>
          </form>
          
          <!-- Admin Register Form -->
          
          <form action="registerAdmin" class="signup" method="post">
            <div class="field">
              <input type="text" name="adminName" id="AdminName" placeholder="Enter Admin Name" required>   
            </div>
            <div class="field">
              <input type="email" name="adminEmail" id="AdminEmail" placeholder="Admin Email" required>   
            </div>
            <div class="field">
             <input type="password" name="adminPassword" id="AdminPassword" placeholder="Admin Password" required>    
            </div>
            <div class="field">
              <input type="number" name="adminMobileNumber" id="AdminMobileNumber" placeholder="Mobile Number" required>   
            </div>
            <div class="field btn">
              <div class="btn-layer"></div>
              <input type="submit" value="Signup">
            </div>
          </form>
        </div>
      </div>
    </div>

    <script src="UserAdminLoginCssScript/script.js"></script>

  </body>
</html>