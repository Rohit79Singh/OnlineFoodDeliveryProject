package com.springboot.main.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.autoconfigure.ssl.SslProperties.Bundles.Watch.File;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PostMapping;

import com.springboot.main.Admin.*;
import com.springboot.main.AdminCategoryProduct.*;
import com.springboot.main.UserEntity.RegisteredUser;
import com.springboot.main.service.*;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;

import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
//import org.springframework.web.bind.annotation.RestController;

/*Use annotation for getting multipartdata means get photo video music*/
@MultipartConfig
/*-------------------*/

//@RestController

@Controller
public class Controllers {

	@GetMapping("/login")
	public String login() {
		return "LoginPage";
	}
  
	
	@Autowired
	private UserService userService;
	
	

	@PostMapping("/registerDetail")
	 public String registerDetail(RegisteredUser registeredUser, Model model) {
		
		boolean registerDetailExists = userService.isRegisterDetailExists(registeredUser.getRegisterEmail());
		
		if(registerDetailExists==true) {
			model.addAttribute("errorMessage", "User is already Exists");
		}
		else {			
			userService.createUser(registeredUser);	
			model.addAttribute("registerMessage", "You Have Successfully Registered");
		}
		
   	 return "LoginPage";
	 }
	
	
	 @PostMapping("/loginDetail")
	 public String loginDetail(@RequestParam("loginEmail") String email,
			                   @RequestParam("loginPassword") String password, Model model) {
		
		 //System.out.println(email+" "+password);
			
		
		 boolean isValidUser = userService.ValidUser(email, password);
		 		 
		 if(isValidUser==true) {
			 //System.out.println("right hai");
			 
			 //Send user id on home
			 //model.addAttribute("UserEmail", email);
			 /*-----------------*/
			 
			 userService.readProduct().clear();
			 userService.readCategory().clear();
			 
			 //Sending Product value on Home
			 model.addAttribute("SendingProductValue", userService.readProduct());
			 model.addAttribute("SendingCategory", userService.readCategory());		
			 
			 model.addAttribute("userName", userService.readUserName());
			 
			 /*---------*/
			 
			  return "Home";
		 }
		 else {
			 model.addAttribute("loginerror", "Invalid User");		
		 }
		 
		
  	 return "LoginPage";
	 }
	 
	 
	 
	 //GetProductByCategory
	 
	 @GetMapping("/getProductByCategory")
	 public String getProductByCategory(@RequestParam String category, Model model) {		 	
		 
		 if(category.equals("all")) {
			 userService.readProduct().clear();
			 userService.readCategory().clear();
			 
			 //Sending Product value on Home
			 model.addAttribute("SendingProductValue", userService.readProduct());
			 model.addAttribute("SendingCategory", userService.readCategory());		
			 
		 }
		 
		 else {
		 Long catId = Long.parseLong(category);
		 
		 userService.readProductByCategoryId(catId).clear();
		 userService.readCategory().clear();
		 
		 //Sending Product value on Home
		 model.addAttribute("SendingProductValue", userService.readProductByCategoryId(catId));
		 model.addAttribute("SendingCategory", userService.readCategory());		
		 }
		 
		 return "Home";
		 
	 }
	 
	 
	 //We are create Admin Controller
	 
	 @GetMapping("/admin")
	 public String admin() {
		 return "Admin";
	 }
	 
		
		//Register Admin
       
		@PostMapping("/registerAdmin")
		 public String registerAdmin(AdminUser adminUser, Model model) {
			
			boolean registerAdminExists = userService.isRegisterAdminExists(adminUser.getAdminEmail());
			
			if(registerAdminExists==true) {
				model.addAttribute("errorMessage", "Admin is already Exists");
			}
			else {			
				userService.createAdmin(adminUser);	
				model.addAttribute("adminregisterMessage", "You Have Successfully Registered");				
			}
						
	   	// return "AdminLogin";
			
			return "Admin";
		 }
		
		//Login Access to Admin
		
		 @PostMapping("/loginAdmin")
		 public String loginAdmin(@RequestParam("adminEmail") String email,
				                   @RequestParam("adminPassword") String password,
				                   @RequestParam("adminMobileNumber") String mobileNumber, Model model) {
			
			 //System.out.println(email+" "+password+" "+mobileNumber);
				
			
			 boolean isValidAdmin = userService.ValidAdmin(email, password, mobileNumber);
			 		 
			 if(isValidAdmin==true) {
				 //System.out.println("admin right hai");
				 
				 //Send admin id on AdminHome
				 	//		 model.addAttribute("AdminEmail", email);
				 /*-----------------*/
				
				 /*------------------*/
				 userService.readCategory().clear();
				 model.addAttribute("setCategory", userService.readCategory());
				 
				 userService.readProduct().clear();
				 model.addAttribute("SendingProductValue", userService.readProduct());
				 
				 model.addAttribute("users", userService.userCount());
				 
				 model.addAttribute("adminName", userService.readAdminName());
				 
				 return "AdminHome";
			 }
			 else {
				 model.addAttribute("adminloginerror", "Invalid Admin");		
			 }
			 
	  	 //return "AdminLogin";
			 
			 return "Admin";
		 } 
		 
		 
		 
     // Add Category and Product by Admin
		 
		 
		@PostMapping("/addCategory")
		 public String addCategory(Category category,  Model model) {
			// System.out.println("create ho raha");
			 
			
			boolean CategoryExists = userService.isCategoryExists(category.getCategoryTitle());
			
			if(CategoryExists==true) {
				model.addAttribute("errorMessage", "Your Category is already Exists");
				
			}
			else {			
			userService.createCategory(category);	
			model.addAttribute("Message", "Your Category is Added Successfully");
			}
			
			userService.readCategory().clear();
			model.addAttribute("setCategory", userService.readCategory());
			
			userService.readProduct().clear();
			model.addAttribute("SendingProductValue", userService.readProduct());
				
			model.addAttribute("users", userService.userCount());
			
			return "AdminHome";
		 }
		 
		
		//Delete Category By Id
		
		@GetMapping("/deleteCategory")
		 public String deleteCategory(@RequestParam String category, Model model) {		 	
			 
           //System.out.println(category);
           Long catId = Long.parseLong(category);
           
           List<Product> product = userService.readProductByCategoryId(catId);
           
           for(Product deleteProducts : product) {
        	   userService.deleteProductById(deleteProducts.getId());
           }
  		           
           userService.deleteCategoryById(catId);
           
           userService.readCategory().clear();
		   model.addAttribute("setCategory", userService.readCategory());
		   
		   userService.readProduct().clear();
		   model.addAttribute("SendingProductValue", userService.readProduct());			 
           
		   model.addAttribute("users", userService.userCount());
		   
		   model.addAttribute("Message", "Your Category is Deleted Successfully");
		   
		   return "AdminHome";
			 
		 }
		
		 
	// Add Product by Admin
		 
		 //get image
		 @Autowired
		    private ServletContext servletContext;
		 /*-----*/
		 
		 @PostMapping("/addProduct")
		 public String addProduct(@RequestParam("productName") String productName,
                                  @RequestParam("productDesc") String productDesc,
                                  @RequestParam("productPrice") int productPrice,
                                  @RequestParam("productQuantity") int productQuantity,
                                  @RequestParam("catId") Long catId,
                                  @RequestPart("productPhoto") Part productPhoto, Model model) throws IOException {	 
			 
			//System.out.println("create ho raha");
			 
			 //System.out.println(catId);
			 //System.out.println(productPhoto.getSubmittedFileName());
			 
			 Product product = new Product();
			 
			 product.setProductName(productName);
			 product.setProductDesc(productDesc);
			 product.setProductPrice(productPrice);
			 product.setProductQuantity(productQuantity);			 
			 product.setProductPhoto(productPhoto.getSubmittedFileName());
			 
			 //get Category Detail by Id
			 Category category = userService.getCategoryById(catId);
			 //System.out.println(category);
			 product.setCategory(category);
			 
			 
			 boolean ProductExists = userService.isProductExists(product.getProductPhoto());
				
				if(ProductExists==true) {
					model.addAttribute("errorMessage", "Your Product is already Exists");
				}
				else {			
					userService.createProduct(product);	
					model.addAttribute("Message", "Your Product Added Successfully");
				}
			 
			
			// Reading Image and send to Product Image Folder
			
			String path = servletContext.getRealPath("image") + File.separator + "ProductImage" + File.separator + productPhoto.getSubmittedFileName();
			//System.out.println(path);	
			
			FileOutputStream fos = new FileOutputStream(path);
					
			InputStream is = productPhoto.getInputStream();
						
			byte[] data = new byte[is.available()];
			is.read(data);
			
			fos.write(data);
		    fos.close();
			
			/*----------------*/
			
		    userService.readCategory().clear();
			model.addAttribute("setCategory", userService.readCategory());
			
			userService.readProduct().clear();
			model.addAttribute("SendingProductValue", userService.readProduct());
				
			model.addAttribute("users", userService.userCount());
			
	   	    return "AdminHome";
		 }
		
	//Delete Product By ProductId
		 @GetMapping("/deleteProduct")
		 public String deleteProduct(@RequestParam String product, Model model) {		 	
			 
           //System.out.println(product);
           Long catId = Long.parseLong(product);
  		           
           userService.deleteProductById(catId);
           
           userService.readCategory().clear();
		   model.addAttribute("setCategory", userService.readCategory());
			
		   userService.readProduct().clear();
		   model.addAttribute("SendingProductValue", userService.readProduct());
			 
		   model.addAttribute("users", userService.userCount());
           
		   model.addAttribute("Message", "Your Product Deleted Successfully");
		   
		   return "AdminHome";
			 
		 }
		 
	
	  // Update Product	 
		 @GetMapping("/updateProduct")
		 public String updateProduct(@RequestParam String product, Model model) {		 	
			 
           //System.out.println(product);
           Long catId = Long.parseLong(product);
           
           Product readproduct = userService.readProductById(catId);
           
           model.addAttribute("ProductId", readproduct.getId());
           model.addAttribute("ProductPhoto", readproduct.getProductPhoto());
           model.addAttribute("ProductName", readproduct.getProductName());
           model.addAttribute("ProductDesc", readproduct.getProductDesc());
           model.addAttribute("ProductPrice", readproduct.getProductPrice());
           model.addAttribute("ProductQuantity", readproduct.getProductQuantity());
           model.addAttribute("CategoryId", readproduct.getCategory().getId());
			           
           userService.readCategory().clear();
		   model.addAttribute("setCategory", userService.readCategory());
			 
           
		   return "editProduct";
			 
		 }
		 
	
	  // Set Product and Update on Database	 
		 
		@PostMapping("/setProduct")
		 public String setProduct(@RequestParam("productId") Long productId,
				                  @RequestParam("productName") String productName,
                                  @RequestParam("productDesc") String productDesc,
                                  @RequestParam("productPrice") int productPrice,
                                  @RequestParam("productQuantity") int productQuantity,
                                  @RequestParam("catId") Long catId,
                                  @RequestPart("productPhoto") Part productPhoto,
                                    Model model) throws IOException {	 
			 		 
	           
			 //System.out.println("set ho raha");
			 
			 //System.out.println(catId);
			// System.out.println(productPhoto.getSubmittedFileName());
			 
			 Product product = userService.readProductById(productId);
			 
			 product.setProductName(productName);
			 product.setProductDesc(productDesc);
			 product.setProductPrice(productPrice);
			 product.setProductQuantity(productQuantity);	
			 			 
			 if(productPhoto.getSubmittedFileName() != "") {				
				 product.setProductPhoto(productPhoto.getSubmittedFileName());
				 
				// Reading Image and send to Product Image Folder
					
					String path = servletContext.getRealPath("image") + File.separator + "ProductImage" + File.separator + productPhoto.getSubmittedFileName();
					//System.out.println(path);	
					
					FileOutputStream fos = new FileOutputStream(path);
							
					InputStream is = productPhoto.getInputStream();
								
					byte[] data = new byte[is.available()];
					is.read(data);
					
					fos.write(data);
				    fos.close();
					
					/*----------------*/
				 
			 }
			 
			 
			 //get Category Detail by Id
			 Category category = userService.getCategoryById(catId);
			 //System.out.println(category);
			 product.setCategory(category);				 
			 		
			 userService.createProduct(product);			
			
		     userService.readCategory().clear();
			 model.addAttribute("setCategory", userService.readCategory());
			
			 userService.readProduct().clear();
			 model.addAttribute("SendingProductValue", userService.readProduct());
				
			 model.addAttribute("users", userService.userCount());
			 
			 model.addAttribute("Message", "Your Product Updated Successfully");
			 
	   	     return "AdminHome";
	   	    
		 }
		
		
		//Sending Home Page to Admin
		
		@GetMapping("/sendhometoadmin")
		public String sendhome(Model model) {
			userService.readProduct().clear();
			 userService.readCategory().clear();
			
			 model.addAttribute("SendingProductValue", userService.readProduct());
			 model.addAttribute("SendingCategory", userService.readCategory());		
			 
			 /*---------*/
			 
			  return "Home";
		}		
		
		
		// Cancel Update Product
		
		@GetMapping("/cancelUpdateProduct")
		public String cancelUpdateProduct(Model model) {
			
			 userService.readCategory().clear();
			 model.addAttribute("setCategory", userService.readCategory());
			 
			 userService.readProduct().clear();
			 model.addAttribute("SendingProductValue", userService.readProduct());
			 
			 model.addAttribute("users", userService.userCount());
			 
			  return "AdminHome";
		}	
		
}