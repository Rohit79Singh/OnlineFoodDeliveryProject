package com.springboot.main.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.main.Admin.AdminRepository;
import com.springboot.main.Admin.AdminUser;
import com.springboot.main.AdminCategoryProduct.Category;
import com.springboot.main.AdminCategoryProduct.CategoryRepository;
import com.springboot.main.AdminCategoryProduct.Product;
import com.springboot.main.AdminCategoryProduct.ProductRepository;
import com.springboot.main.UserEntity.RegisteredUser;
import com.springboot.main.repository.UserRepository;


@Service
public class UserServiceImpl implements UserService{

	@Autowired(required=true)
	private UserRepository userRepository;	

	//create user
	
	@Override
	public String createUser(RegisteredUser registeredUser) {
		//System.out.println("create ho raha");		
			userRepository.save(registeredUser);
		return "Created";
	}
	
	// Read User Name
	
	String userName;
	
	@Override
	public String readUserName() {
		return userName;
	}
	
	
	//Count How many Users
	
	@Override
	public Long userCount() {
		Long users = userRepository.count();
		return users;
	}
	
	
	//Check User Exists or Not
	@Override
	public boolean isRegisterDetailExists(String registerEmail) {
		List<RegisteredUser> registeredUser = userRepository.findAll();
		
		for (RegisteredUser registeredUsers : registeredUser) {
            if (registerEmail.equals(registeredUsers.getRegisterEmail())) {
                return true;
            }
        }
		
		return false;
	}
	
	
	//Read User
	
    @Override
	public boolean ValidUser(String email, String password) {
		
        List<RegisteredUser> registeredUser = userRepository.findAll();
		
        int i=0;
		while(i<registeredUser.size()){
			RegisteredUser registeredUsers = registeredUser.get(i);
			//System.out.println(registeredUsers.getId()+" "+registeredUsers.getRegisterEmail()+" "+registeredUsers.getRegisterPassword());
			if(email.equals(registeredUsers.getRegisterEmail()) && password.equals(registeredUsers.getRegisterPassword())) {
				//System.out.println("sahi hai");
				
				userName = registeredUsers.getUserName();
				
				return true;
			}

			i++;
			
		}		
		return false;
	}


    
  //We create Admin Service
    
    
    @Autowired(required=true)
	private AdminRepository adminRepository;	
    
    //creating Admin
    
	@Override
	public String createAdmin(AdminUser adminUser) {
		//System.out.println("admin create ho raha");		
		adminRepository.save(adminUser);	    
	return "Admin Created";
	}
	
	// Read Admin Name
	
	String adminName;
	
	@Override
	public String readAdminName() {
		return adminName;
	}
	
	
	//Check Admin Exists or Not
	@Override
	public boolean isRegisterAdminExists(String adminEmail) {
		List<AdminUser> adminUser = adminRepository.findAll();
		
		for (AdminUser adminUsers : adminUser) {
            if (adminEmail.equals(adminUsers.getAdminEmail())) {
                return true;
            }
        }
		return false;
	}	
	

     //Read admin data
	
	@Override
	public boolean ValidAdmin(String email, String password, String mobileNumber) {
    List<AdminUser> adminUser = adminRepository.findAll();
		
        int i=0;
		while(i<adminUser.size()){
			AdminUser adminUsers = adminUser.get(i);
			//System.out.println(adminUsers.getId()+" "+adminUsers.getAdminEmail()+" "+adminUsers.getAdminPassword()+" "+adminUsers.getAdminMobileNumber());
			if(email.equals(adminUsers.getAdminEmail()) && password.equals(adminUsers.getAdminPassword()) && mobileNumber.equals(adminUsers.getAdminMobileNumber())) {
				//System.out.println("admin sahi hai");
			adminName=adminUsers.getAdminName();
				return true;
			}

			i++;
			
		}		
		return false;
	}
	
	

	// Save Category in Databases
	
	 @Autowired(required=true)
	 private CategoryRepository categoryRepository;
	
	 //Create category by admin and save into Databases;
	 
	@Override
	public String createCategory(Category category) {
		categoryRepository.save(category);
	
		//System.out.println("Category create ho raha");
		return "Category created";
	}

	
	 //Check Category Exists or Not
	@Override
	public boolean isCategoryExists(String str) {
        List<Category> listCategory = categoryRepository.findAll();
		
        for (Category category : listCategory) {
            if (str.equals(category.getCategoryTitle())) {
                return true;
            }
        }
		return false;
		  
	}
	

	// Read Category
	
    List<Category> listCategories = new ArrayList<>();
	
	@Override
	public List<Category> readCategory() {
		List<Category> listCategory = categoryRepository.findAll();
		
		for(Category getCategories : listCategory) {
			Category storeCategory = new Category();
			storeCategory.setId(getCategories.getId());
			storeCategory.setCategoryTitle(getCategories.getCategoryTitle());
			//System.out.println(storeCategory.getId()+" "+storeCategory.getCategoryTitle());
			listCategories.add(storeCategory);
			
		}		
		
		return listCategories;
	}
	
	// Delete Category
	
	@Override
	public String deleteCategoryById(Long catId) {
		categoryRepository.deleteById(catId);		
		return "Deleted";
	}



	// Create Product by Admin and Save to databases
	
	
	@Autowired(required=true)
	 private ProductRepository productRepository;
	
	@Override
	public String createProduct(Product product) {
		//System.out.println("Product  is created ho raha");
		productRepository.save(product);
		return "Product Created";
	}
	
    //Read Category by Id
	
	@Override
	public Category getCategoryById(Long catId) {
		Category readCategoryById = categoryRepository.findById(catId).get();
		//System.out.println(readCategoryById);
		return readCategoryById;
	}

    //Read ALL Product
	
	List<Product> listOfProduct = new ArrayList<>();
	
	@Override
	public List<Product> readProduct() {
        List<Product> listProduct = productRepository.findAll();
		
		for(Product getProduct : listProduct) {
			Product storeProduct = new Product();
			storeProduct.setId(getProduct.getId());
			storeProduct.setProductName(getProduct.getProductName());
			storeProduct.setProductDesc(getProduct.getProductDesc());
			storeProduct.setProductPrice(getProduct.getProductPrice());
			storeProduct.setProductQuantity(getProduct.getProductQuantity());
			storeProduct.setProductPhoto(getProduct.getProductPhoto());
			storeProduct.setCategory(getProduct.getCategory());
			
			/*System.out.println(storeProduct.getId()+" "+storeProduct.getProductName()+" "+
			storeProduct.getProductPrice()+" "+storeProduct.getProductDesc()+" "+storeProduct.getProductQuantity()
			+" "+storeProduct.getProductPhoto()+" "+storeProduct.getCategory().getId()+"  "+storeProduct.getCategory());*/
			listOfProduct.add(storeProduct);
			
		}		
		
		return listOfProduct;
	}

	
	// Read Product By Id
	
		@Override
		public Product readProductById(Long catId) {
			Product product = productRepository.findById(catId).get();
			return product;
		}
		
	
	//read Product By Category Id
	
	List<Product> listProductByCategory = new ArrayList<>();
	
	@Override
	public List<Product> readProductByCategoryId(Long catId) {
        List<Product> listProduct = productRepository.findAll();
		
		for(Product getProduct : listProduct) {
			Product storeProduct = new Product();
			storeProduct.setId(getProduct.getId());
			storeProduct.setProductName(getProduct.getProductName());
			storeProduct.setProductDesc(getProduct.getProductDesc());
			storeProduct.setProductPrice(getProduct.getProductPrice());
			storeProduct.setProductQuantity(getProduct.getProductQuantity());
			storeProduct.setProductPhoto(getProduct.getProductPhoto());
			storeProduct.setCategory(getProduct.getCategory());
			
			if(catId==storeProduct.getCategory().getId()) {
			listProductByCategory.add(storeProduct);
			}
			
		}		
		
		return listProductByCategory;
	}	
	
	
	//Delete Product
	
	@Override
	public String deleteProductById(Long catId) {
		productRepository.deleteById(catId);
		return "Deleted";
	}
	
	
	//Check Product Exists or Not
	
	@Override
	public boolean isProductExists(String productPhoto) {
		List<Product> listProduct = productRepository.findAll();
		
		for (Product product : listProduct) {
            if (productPhoto.equals(product.getProductPhoto())) {
                return true;
            }
        }
		
		return false;
	}

	
}