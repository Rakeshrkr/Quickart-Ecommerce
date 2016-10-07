package com.quickart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	@RequestMapping(value = "/")// , method=RequestMethod.GET)
	public String showlanding(){
		return "index" ;
	}
	
	@RequestMapping(value = "/index")// , method=RequestMethod.GET)
	public String showindex(){
		return "index" ;
	}	
	
	
	@RequestMapping(value = "/Login" ,method = RequestMethod.GET)
	public String showLogin(){
		return "Login" ;
	}
	
	@RequestMapping(value = "/ContactUs" , method=RequestMethod.GET)
	public String showContactUs(){
		return "ContactUs" ;
	}
	
}
