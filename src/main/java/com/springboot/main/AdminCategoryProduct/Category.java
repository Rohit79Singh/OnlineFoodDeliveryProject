package com.springboot.main.AdminCategoryProduct;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="add_category")
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String categoryTitle;

	@OneToMany(mappedBy = "category")
	List<Product> products = new ArrayList<>();
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCategoryTitle() {
		return categoryTitle;
	}

	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Category(String categoryTitle, List<Product> products) {
		
		this.categoryTitle = categoryTitle;
		this.products = products;
	}

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", categoryTitle=" + categoryTitle + 
				", products=" + (products != null ? products.size() : 0) + "]";
	}
	
	
}