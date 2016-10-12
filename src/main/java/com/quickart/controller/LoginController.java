package com.quickart.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ecommerce.quickart.dao.CategoryDao;
import com.ecommerce.quickart.dao.ProductDao;
import com.ecommerce.quickart.dao.SupplierDao;
import com.ecommerce.quickart.dao.UserDetailsDao;
import com.ecommerce.quickart.dao.UserDetailsDaoImp;
import com.ecommerce.quickart.model.Category;
import com.ecommerce.quickart.model.Product;
import com.ecommerce.quickart.model.Supplier;
import com.ecommerce.quickart.model.UserDetails;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private ProductDao productDao;

	@Autowired
	private Product product;

	@Autowired
	Category category;

	@Autowired
	CategoryDao categoryDao;

	@Autowired
	Supplier supplier;

	@Autowired
	SupplierDao supplierDao;

	@Autowired
	UserDetails userDetails;

	@Autowired
	UserDetailsDao userDetailsDao;
	@RequestMapping(value = "/")// , method=RequestMethod.GET)
	public String showlanding(){
		return "index" ;
	}
	
	@RequestMapping(value = "/index")// , method=RequestMethod.GET)
	public String showindex(ModelMap modalmap , Principal principal, HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		String name =  principal.getName();
		//UserDetailsDao.getUserDetails(name);
		logger.info("UserID " + name);
		session.setAttribute("user", name);
		modalmap.addAttribute("isProductClicked", true);
		modalmap.addAttribute("isCategoryClicked", true);
		modalmap.addAttribute("isSupplierClicked", true);
		return "index" ;
	}	
	
	@RequestMapping(value = "/user/index")// , method=RequestMethod.GET)
	public String showindexforUser(){
		return "index" ;
	}
	
	@RequestMapping(value = "/admin/index")// , method=RequestMethod.GET)
	public String showindexforAdmin(){
		return "index" ;
	}
	
	@RequestMapping(value = "/login" ,method = RequestMethod.GET)
	public String showLogin(){
		return "Login" ;
	}
	
	@RequestMapping(value = "/loginError" ,method = RequestMethod.GET)
	public String showLoginAgain(){
		return "Unsuccess" ;
	}
	
	@RequestMapping(value = "/ContactUs" , method=RequestMethod.GET)
	public String showContactUs(){
		return "ContactUs" ;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView GoToHome(@RequestParam String name, @RequestParam String password, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("Login (GoToHome method) begins ! ");
		HttpSession session = request.getSession();
		userDetails = userDetailsDao.isValidUser(name, password);

		ModelAndView mv = null;
		if (userDetails == null) {
			mv = new ModelAndView("Login");
			mv.addObject("errorMessage", "Invalid Credential , Please enter correct user name and password!");
		} else {
			if (userDetails.getRoleId().equals("ROLE_ADMIN")) {
				mv = new ModelAndView("redirect:/admin/addProduct");
				String fullName = userDetails.getFullName();
				String RoleId = userDetails.getRoleId();
				session.setAttribute("user", fullName);
				session.setAttribute("RoleId", RoleId);
				List<Product> productList = productDao.getAllProduct();
				List<Category> categoryList = categoryDao.CategoryList();
				List<Supplier> supplierList = supplierDao.SupplierList();
				mv.addObject("ProductList", productList);
				mv.addObject("CategoryList", categoryList);
				mv.addObject("SupplierList", supplierList);
			} else if (userDetails.getRoleId().equals("ROLE_USER")) {
				mv = new ModelAndView("redirect:/user/index");
				String fullName = userDetails.getFullName();
				String RoleId = userDetails.getRoleId();
				session.setAttribute("user", fullName);
				session.setAttribute("RoleId", RoleId);
				session.setAttribute("userId", userDetails.getUserId());
			}
		}
		logger.info("Login (GoToHome method) Ends here! ");
		return mv;
		
	}
	
	@RequestMapping(value = "/addCategory", method = RequestMethod.GET)
	public ModelAndView addproduct() {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/addCategory");
		List<Product> productList = productDao.getAllProduct();
		modelAndView.addObject("ProductList", productList);
		
		return modelAndView;
	}

	@RequestMapping(value = "/addSupplier", method = RequestMethod.GET)
	public ModelAndView addproduc() {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/addSupplier");
		List<Product> productList = productDao.getAllProduct();
		modelAndView.addObject("ProductList", productList);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public ModelAndView addproducs() {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/addProduct");
		List<Product> productList = productDao.getAllProduct();
		modelAndView.addObject("ProductList", productList);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/logout")
	public String goToindex(HttpServletRequest request, HttpServletResponse response) {
		logger.info("User LogOut (GoToIndex method) begins here! ");
		HttpSession session = request.getSession();
		session.setAttribute("user", null);
		session.invalidate();
		logger.info("User LogOut (GoToIndex method) Ends here! ");
		return "index";
	}

	@RequestMapping(value = "admin/logout")
	public ModelAndView goToindexs(HttpServletRequest request, HttpServletResponse response) {
		logger.info("Admin LogOut (GoToIndexs method) begins here! ");
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("redirect:/logout");
		session.setAttribute("user", null);
		session.invalidate();
		logger.info("Admin LogOut (GoToIndexs method) Ends here! ");
		return mv;
	}
	
	@RequestMapping(value = "user/logout")
	public ModelAndView goToindexsuser(HttpServletRequest request, HttpServletResponse response) {
		logger.info("User LogOut (GoToIndexsuser method) begins here! ");
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("redirect:/logout");
		session.setAttribute("user", null);
		session.invalidate();
		logger.info("User LogOut (GoToIndexs method) Ends here! ");
		return mv;
	}
}
