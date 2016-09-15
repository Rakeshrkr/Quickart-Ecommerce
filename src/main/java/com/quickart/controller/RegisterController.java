package com.quickart.controller;

import java.util.List;
import java.util.Map;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.quickart.dao.*;
import com.quickart.model.*;
import com.quickart.service.ProductService;
import com.quickart.service.UserService;


@Controller
public class RegisterController {
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/Register", method = RequestMethod.GET)
	public ModelAndView getRegistrationForm() {
		ModelAndView modelandview = new ModelAndView("Register");
		return modelandview;
	}

	@RequestMapping(value = "/RegistrationSuccess", method = RequestMethod.POST)
	public ModelAndView submitRegistrationForm(@Valid @ModelAttribute() User user, BindingResult result) {

		if (result.hasErrors()) {
			ModelAndView modelandview = new ModelAndView("Register");
			return modelandview;
			
		} else {
			ModelAndView modelandview = new ModelAndView("RegistrationSuccess");
			return modelandview;
		}
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		binder.setDisallowedFields(new String[] {"password"});
		
	}
	@RequestMapping(value = "/addUser")
	public ModelAndView goToAddUser() {
		
		User user = new User();
		ModelAndView mav = new ModelAndView("Login");
		mav.addObject("User", user);
		return mav;
	}


	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public ModelAndView ForAddingProducts(@ModelAttribute("User") User user, BindingResult result) {

		ModelAndView modelAndView = new ModelAndView("Login");
		if (result.hasErrors()) {
			
			return modelAndView;
		} else {
			userService.addUser(user);
			return modelAndView;
		}
	}
}
