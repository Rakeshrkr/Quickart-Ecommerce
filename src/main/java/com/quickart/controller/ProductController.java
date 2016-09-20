package com.quickart.controller;

import com.quickart.model.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.quickart.dao.ProductDao;
import com.quickart.dao.impl.ProductDaoImpl;
import com.quickart.model.Product;
import com.quickart.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public ModelAndView GoToHome(@RequestParam String name, @RequestParam String password, ModelMap model) {
		if (name.equalsIgnoreCase("Rakesh") && password.equals("rakesh123")) {
			model.addAttribute("user", name);
			model.put("AdminName", name);
			model.put("password", password);
			List<Product> productList = productService.getAllProduct();
			Product product = new Product();
			ModelAndView mav = new ModelAndView("Products");
			mav.addObject("user", name);
			mav.addObject("Product", product);
			mav.addObject("ProductList", productList);
			return mav;
			
		}
		ModelAndView mav = new ModelAndView("Unsuccess");
		return mav ;
	}

	@RequestMapping(value = "/adminPage")
	public String goToAdminHomePage() {
		return "AdminHomePage";
	}

	@RequestMapping(value = "/goback")
	public String GoToHomePage() {
		return "AdminHomePage";
	}

	@RequestMapping(value = "/addProduct")
	public ModelAndView goToAddProduct() {
		List<Product> productList = productService.getAllProduct();
		Product product = new Product();
		ModelAndView mav = new ModelAndView("Products");
		mav.addObject("Product", product);
		mav.addObject("ProductList", productList);
		return mav;
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public ModelAndView ForAddingProducts(@ModelAttribute("Product") Product product, BindingResult result) {
		ModelAndView modelAndView = new ModelAndView("redirect:/addProduct");

		List<Product> productlist = productService.getAllProduct();
		if (result.hasErrors()) {
			/*String message = "Error Occured: Please Enter Correct Details. Thank You. ";
			modelAndView.addObject("fail", message);*/
			return modelAndView;
		} else {
			productService.addProduct(product);
			/*String message = "Added to Your Products. Thank You";*/
			modelAndView.addObject("ProductList", productlist);
			/*modelAndView.addObject("success", message);*/
			return modelAndView;
		}
	}

	@RequestMapping(value = "/Products")
	public ModelAndView Products() {
		List<Product> productList = productService.getAllProduct();
		Product product = new Product();
		ModelAndView mav = new ModelAndView("Products");
		mav.addObject("Product", product);
		mav.addObject("ProductList", productList);
		return mav;
	}

	@RequestMapping(value = "/edit/{productId}", method = RequestMethod.POST)
	public ModelAndView updation(@PathVariable("productId") int  productId, @ModelAttribute("product") Product product) { //
		product.setProductId(productId);
		productService.editProduct(product);
		ModelAndView modelAndView = new ModelAndView("redirect:/addProduct");
		return modelAndView;
	}

	@RequestMapping(value = "/viewProduct")
	public ModelAndView getAllProducts() {
		List<Product> productList = productService.getAllProduct();
		return new ModelAndView("product", "productList", productList);
	}

	@RequestMapping(value = "/{productId}", method = RequestMethod.GET)
	public ModelAndView deleteproduct(@PathVariable int productId) {
		productService.deleteProduct(productId);
		ModelAndView modelAndView = new ModelAndView("redirect:/addProduct");
		List<Product> productList = productService.getAllProduct();
		modelAndView.addObject("ProductList", productList);
		return modelAndView;
	}
	
	
	
	 /*@RequestMapping(value="/editProduct/{productId}")  
	    public ModelAndView edit(@PathVariable int productId){  
	        Product product= productService.getProduct(productId); //dao.getEmpById(id);  
	        return new ModelAndView("Update","product",product);  
	    }
	 @RequestMapping(value="editProduct/editProducts",method = RequestMethod.POST)  
	    public ModelAndView editProduct(@ModelAttribute("product") Product product){  
	        productService.editProduct(product);
	        ModelAndView modelAndView = new ModelAndView("Products");
			List<Product> productList = productService.getAllProduct();
			modelAndView.addObject("ProductList", productList);
	        return modelAndView;
	    } */
	/*
	 * @RequestMapping(value="/product.do" , method=RequestMethod.POST) public
	 * String doActions(@ModelAttribute Product product,BindingResult
	 * result,@RequestParam String action,Map<String, Object> map){ Product
	 * productResult = new Product();
	 * 
	 * if(action.toLowerCase()=="add"){ productService.addProduct(product);
	 * productResult = product ; } else if(action.toLowerCase()=="edit"){
	 * productService.editProduct(product); productResult = product ; } else
	 * if(action.toLowerCase()=="delete"){
	 * productService.deleteProduct(product.getProductId()); productResult = new
	 * Product() ; }
	 * 
	 * else if(action.toLowerCase()=="search"){ Product searchedProduct =
	 * productService.getProduct(product.getProductId()); productResult =
	 * searchedProduct !=null ? searchedProduct : new Product(); } else{ }
	 * 
	 * map.put("product", product); map.put("productList",
	 * productService.getAllProduct()); return "Product" ; }
	 */

	/*
	 * @RequestMapping(value="/ProductTable" ,method=RequestMethod.GET) public
	 * ModelAndView ProdTab(){ List<Product> productList = new
	 * ArrayList<Product>(); Product product1 = new
	 * Product(101,"Tshirt","Clothing",400); Product product2 = new
	 * Product(102,"Jeans","Clothing",1400); Product product3 = new Product(103,
	 * "Dell 5050 ","Electronics",44000); Product product4 = new
	 * Product(104,"Sofa","Furniture",4000); productList.add(product1);
	 * productList.add(product2); productList.add(product3);
	 * productList.add(product4);
	 * 
	 * ModelAndView mav = new ModelAndView("ProductTable");
	 * mav.addObject("productlist", productList); return mav; }
	 */
}