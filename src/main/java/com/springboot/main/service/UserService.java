package com.springboot.main.service;

import java.util.List;

import com.springboot.main.Admin.AdminUser;
import com.springboot.main.AdminCategoryProduct.Category;
import com.springboot.main.AdminCategoryProduct.Product;
import com.springboot.main.UserEntity.RegisteredUser;

public interface UserService {
     String createUser(RegisteredUser registeredUser);
     boolean ValidUser(String email, String password);
     
     // Read User Name
     String readUserName();
     
     // Count How many Users
     Long userCount();
     
     //Check User Exists or Not
     boolean isRegisterDetailExists(String registerEmail);
     
   //We are create Admin Service
     
     String createAdmin(AdminUser adminUser);
     boolean ValidAdmin(String email, String password, String mobileNumber);
     
     // Read Admin Name
     String readAdminName();
     
   //Check Admin Exists or Not
     boolean isRegisterAdminExists(String adminEmail);
     
     //Create Category by admin
     
	 String createCategory(Category category);
	 
	 //Delete Category
	 String deleteCategoryById(Long catId);
	 
	 //Check Category Exists or Not
	 boolean isCategoryExists(String str);
	 
	 // Read Category
	 List<Category> readCategory();	 
	 
	 //Create Product by Admin
	 String createProduct(Product product);
	 
	 //Read Category by Id;
	 Category getCategoryById(Long catId);
	 
	 //Read Product
	 List<Product> readProduct();
	 
	//Read Product By Id
     Product readProductById(Long catId);
	 
	 //read Product By Category Id
	 List<Product> readProductByCategoryId(Long catId);
	 
	//Delete Product
    String deleteProductById(Long catId);	 
	 
	//Check Product Exists or Not
	boolean isProductExists(String productPhoto);
	
    
}
