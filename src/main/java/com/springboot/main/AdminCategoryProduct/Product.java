package com.springboot.main.AdminCategoryProduct;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="add_product")
public class Product {
      
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String productName;
	private String productDesc;
	private String productPhoto;
	private int productPrice;
	private int productQuantity;
	
	@ManyToOne
	private Category category;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public String getProductPhoto() {
		return productPhoto;
	}
	public void setProductPhoto(String productPhoto) {
		this.productPhoto = productPhoto;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	
	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	
	public Product(String productName, String productDesc, String productPhoto, int productPrice, int productQuantity,
			Category category) {
		
		this.productName = productName;
		this.productDesc = productDesc;
		this.productPhoto = productPhoto;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
		this.category = category;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", productName=" + productName + ", productDesc=" + productDesc + ", productPhoto="
				+ productPhoto + ", productPrice=" + productPrice + ", productQuantity=" + productQuantity
				+ ", category=" + (category != null ? category.getCategoryTitle() : "null") + "]";
	}
	
	
}
