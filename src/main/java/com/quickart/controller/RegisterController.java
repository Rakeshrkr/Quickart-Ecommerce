package com.quickart.controller;
import java.util.List;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ecommerce.quickart.dao.UserDetailsDao;
import com.ecommerce.quickart.model.Category;
import com.ecommerce.quickart.model.User;
import com.ecommerce.quickart.model.UserDetails;




@Controller
public class RegisterController {
	
	@Autowired
	UserDetails userDetails ;
	
	@Autowired
	UserDetailsDao userDetailsDao ;

	@ModelAttribute("userDetails")
	public UserDetails newUserDetails(){
		return new UserDetails() ;
	}
	
    /*---------------------------------------------------*/
	

	@RequestMapping(value = "/addUser")
	public String goToRegisterPage(Model model) {
		model.addAttribute("userDetails", new UserDetails());
		return "Register";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public ModelAndView ForAddingUser(@ModelAttribute("userDetails") UserDetails userDetails, BindingResult result) {
		ModelAndView modelAndView = new ModelAndView("Login");

		if (result.hasErrors()) {
			userDetailsDao.saveUserDetails(userDetails);
			return modelAndView;
		} else {
			userDetailsDao.saveUserDetails(userDetails);
			return modelAndView;
		}
	}

	
    
}
