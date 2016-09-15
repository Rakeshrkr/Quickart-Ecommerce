package com.quickart.dao;

import java.util.List;
import com.quickart.model.Product;

public interface ProductDao {
 public void addProduct(Product product);
 public void editProduct(Product product);
 public void deleteProduct(int productId);
 public Product getProduct(int productId);
 public List<Product> getAllProduct();
}
