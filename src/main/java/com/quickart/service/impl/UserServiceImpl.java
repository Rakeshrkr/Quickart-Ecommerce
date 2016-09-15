package com.quickart.service.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.quickart.dao.UserDao;
import com.quickart.model.User;
import com.quickart.service.UserService;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	SessionFactory sessionFactory ;
	@Autowired
	UserDao userDao ;
	
	@Transactional
	public void addUser(User user) {
		userDao.addUser(user);
		
	}

}
