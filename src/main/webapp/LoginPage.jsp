<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Login & Signup Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="UserAdminLoginCssScript/style.css">
    
  </head>
  <body>
    <div class="wrapper">
      <div class="title-text">
        <div class="title login">Login</div>
        <div class="title signup">Signup</div>
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
        
        <% String str1 = (String) request.getAttribute("registerMessage"); %>
               <% if(str1!=null){ %>
               <div class="alert alert-success">
               <strong><%=str1 %>!</strong>
               </div>
               <% } %>
        
        <!-- -------- -->
        
        <!--  -->
              
               <% String str = (String) request.getAttribute("loginerror"); %>
               <% if(str!=null){ %>
               <div class="alert alert-danger">
               <strong><%=str %>!</strong>
               </div>
               <% } %>
               
               <!--  -->
        
        <!-- Login Page Form -->
                
        <div class="form-inner">
        
          <form action="loginDetail" class="login" method="post">
          
            <div class="field">
              <input type="email" name="loginEmail" id="LoginEmail" placeholder="Email Address" required>
            </div>
            <div class="field">
              <input type="password" name="loginPassword" id="LoginPassword" placeholder="Password" required>   
            </div>
            <div class="pass-link"><a href="#">Forgot password?</a></div>
            <div class="field btn">
              <div class="btn-layer"></div>
              <input type="submit" value="Login">
            </div>
            <div class="signup-link">Not a member? <a href="">Signup now</a></div>
          </form>
          
          <!-- Register Page form -->
          
          <form action="registerDetail" class="signup" method="post">
            <div class="field">
              <input type="text" name="userName" id="UserName" placeholder="Enter Your Name" required>   
            </div>
            <div class="field">
              <input type="email" name="registerEmail" id="RegisterEmail" placeholder="Email Address" required>   
            </div>
            <div class="field">
              <input type="password" name="registerPassword" id="RegisterPassword" placeholder="Password" required>    
            </div>
            <div class="field">
              <input type="password" placeholder="Confirm password" required>
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