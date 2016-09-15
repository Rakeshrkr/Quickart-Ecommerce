package com.quickart.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table//(name="PRODUCT")
public class Product {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	int productId ;
	
	String productName;
	
	String productCategory ;
	
	int quantity ;
	
	float price ;
	
	public Product(int productId, String productName, String productCategory, int quantity ,float price) {
		this.productId = productId;
		this.productName = productName;
		this.productCategory = productCategory;
		this.price = price;
		this.quantity=quantity;
	}
	
	public Product() {
		
	}

	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public float getPrice() {
		return price;
	}
	
	public void setPrice(float price) {
		if(price<=0){
			System.out.println("Minimum Price should be 10,000");
			price= 0;
			
		}
		this.price = price;
	}	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
