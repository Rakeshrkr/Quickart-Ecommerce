package com.quickart.service.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.quickart.dao.ProductDao;
import com.quickart.model.Product;
import com.quickart.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao productDao;
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public void addProduct(Product product) {
		productDao.addProduct(product);

	}

	@Transactional
	public void editProduct(Product product) {
		productDao.editProduct(product);
	}

	@Transactional
	public void deleteProduct(int productId) {
		productDao.deleteProduct(productId);
	}

	@Transactional
	public Product getProduct(int productId) {
		return productDao.getProduct(productId);
	}

	@Transactional
	public List<Product> getAllProduct() {
		Transaction tx = sessionFactory.openSession().beginTransaction();

		try {
			if (!tx.isActive())
				tx.begin();
			List<Product> productList = productDao.getAllProduct();
			tx.commit();
			return productList;
		} catch (Exception e) {
			tx.rollback();
		}
		return null;

	}
}
