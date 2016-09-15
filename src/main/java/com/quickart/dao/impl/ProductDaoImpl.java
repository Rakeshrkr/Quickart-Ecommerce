package com.quickart.dao.impl;

import java.util.List;


import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.quickart.dao.*;
import com.quickart.model.Product;

@Repository
@Transactional
public class ProductDaoImpl implements ProductDao {
	@Autowired
	SessionFactory sessionFactory;
	
	public ProductDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void addProduct(Product product) {	
		sessionFactory.getCurrentSession().saveOrUpdate(product);
		
	}
	public void editProduct(Product product) {
		sessionFactory.getCurrentSession().update(product);
	}
	public void deleteProduct(int productId) {
		Product product = new Product();
		product.setProductId(productId);
		sessionFactory.getCurrentSession().delete(product);
	}
	public Product getProduct(int productId) {
		return sessionFactory.getCurrentSession().get(Product.class, productId);
	}
	public List<Product> getAllProduct() {
		 Query query = sessionFactory.getCurrentSession().createQuery("from Product") ;
		 List<Product> productList = query.list();
		 return productList ;
	}
}
