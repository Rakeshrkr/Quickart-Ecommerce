package com.quickart.service;

import java.util.List;

import com.quickart.model.Product;

public interface ProductService {
	
		 public void addProduct(Product product);
		 public void editProduct(Product product);
		 public void deleteProduct(int productId);
		 public Product getProduct(int productId);
		 public List<Product> getAllProduct();
	
}
