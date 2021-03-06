package com.quickart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ecommerce.quickart.dao.CartDao;
import com.ecommerce.quickart.dao.OrderDao;
import com.ecommerce.quickart.model.BillingAddress;
import com.ecommerce.quickart.model.CardDetails;
import com.ecommerce.quickart.model.Cart;
import com.ecommerce.quickart.model.Order;
import com.ecommerce.quickart.model.ShippingAddress;

@Component
public class OrderHandler {
	
	@Autowired 
	Order order ;
	
	@Autowired
	HttpSession httpSession ;
	
	@Autowired
	Cart cart ;
	
	@Autowired
	CartDao cartDao ;
	
	@Autowired
	ShippingAddress shippingAddress ;
	
	@Autowired
	BillingAddress billingAddress ;
	
	@Autowired
	OrderDao orderDao ;
	
	@Autowired
	CardDetails cardDetails ;
	
	public Order initFlow(){
		Order order = new Order();
		String userId = (String) httpSession.getAttribute("user");
		List<Cart> cartList = (List<Cart>) cartDao.listCart(userId);
		order.setUserId(userId);
		order.setCartList(cartList);
		Double totalRs = cartDao.getTotalRs(userId) ;
		order.setTotalRs(totalRs);
		return order ;
	}
	
	public String addBillingAddress(Order order, BillingAddress billingAddress) {
		String loggedInUserId = (String) httpSession.getAttribute("user");
		this.billingAddress.setUserId(loggedInUserId);
		System.out.println("City_TOWN " + billingAddress.getCity_Town());
		return "positive";
	}
	public String addShippingAddress(Order order, ShippingAddress shippingAddress) {
		String loggedInUserId = (String) httpSession.getAttribute("user");
		this.shippingAddress.setUserId(loggedInUserId);
		return "positive";
	}
	public String addCardDetails(Order order, CardDetails cardDetails) {
		String loggedInUserId = (String) httpSession.getAttribute("user");
		this.cardDetails.setUserId(loggedInUserId);
		return "positive";
	}
	public String confirmOrder(Order order) {
		try {
			orderDao.saveorupdate(order);
		} catch (Exception e) {
			
			e.printStackTrace();
			return "negative" ;
		}
		return "positive";
	}
	
	public String endFlow(){
		
		String userId = (String) httpSession.getAttribute("user");
		
		cartDao.updateCart(userId);
		return "positive";
	}

}
