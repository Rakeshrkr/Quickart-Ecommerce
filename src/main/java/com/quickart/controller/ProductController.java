package com.quickart.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ecommerce.quickart.dao.CategoryDao;
import com.ecommerce.quickart.dao.ProductDao;
import com.ecommerce.quickart.dao.SupplierDao;
import com.ecommerce.quickart.dao.UserDetailsDao;
import com.ecommerce.quickart.model.*;
import com.quickart.util.FileUtilClass;

@Controller
public class ProductController implements ServletContextAware {
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

	private ServletContext servletContext;

	private String path = "H:\\quickartImg\\img";

	@ModelAttribute("Product")
	public Product myProduct() {
		return new Product();
	}

	/*
	 * ===========================================Loging-Logout=================
	 * ========================
	 */
	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public ModelAndView GoToHome(@RequestParam String name, @RequestParam String password, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
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
				mv = new ModelAndView("index");
				String fullName = userDetails.getFullName();
				String RoleId = userDetails.getRoleId();
				session.setAttribute("user", fullName);
				session.setAttribute("RoleId", RoleId);
				session.setAttribute("userId", userDetails.getUserId());
			}
		}
		return mv;
	}

	@RequestMapping(value = "/logout")
	public String goToindex(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.setAttribute("user", null);
		session.invalidate();
		return "index";
	}

	@RequestMapping(value = "admin/logout")
	public ModelAndView goToindexs(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("redirect:/logout");
		session.setAttribute("user", null);
		session.invalidate();
		return mv;
	}
	/*
	 * ========================================Admin-Product-CRUD===============
	 * =============================
	 */

	@RequestMapping(value = "/admin/addProduct", method = RequestMethod.GET)
	public ModelAndView goToAddProduct() {
		List<Product> productList = productDao.getAllProduct();
		List<Category> categorylist = categoryDao.CategoryList();
		List<Supplier> supplierlist = supplierDao.SupplierList();

		ModelAndView mav = new ModelAndView("/admin/Products");

		boolean isProductClicked = true;
		mav.addObject("isProductClicked", isProductClicked);
		mav.addObject("categorylist", categorylist);
		mav.addObject("ProductList", productList);
		mav.addObject("supplierlist", supplierlist);
		Product product = new Product();
		mav.addObject("Product", product);
		return mav;
	}

	@RequestMapping(value = "/admin/addProduct", method = RequestMethod.POST)
	public ModelAndView ForAddingProducts(@Valid @ModelAttribute("Product") Product product, BindingResult result,
			@RequestParam(value = "category") String category1, @RequestParam(value = "supplier") String supplier1,
			@RequestParam(value = "image", required = false) MultipartFile image) {

		if (!image.isEmpty()) {
			try {
				validateImage(image);

			} catch (RuntimeException re) {
				result.reject(re.getMessage());
				ModelAndView modelAndView = new ModelAndView("redirect:/admin/addProduct");
				return modelAndView;
			}

			try {
				saveImage(product.getProductId() + ".jpg", image);
			} catch (IOException e) {
				result.reject(e.getMessage());
				ModelAndView modelAndView = new ModelAndView("redirect:/admin/addProduct");
				return modelAndView;
			}
		}
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/addProduct");
		product.setSupplier(supplierDao.getSupplierByName(supplier1));
		product.setCategory(categoryDao.getCategoryByName(category1));
		productDao.addProduct(product);

		return modelAndView;
	}

	@RequestMapping(value = "/admin/edit/{productId}", method = RequestMethod.POST)
	public ModelAndView updation(@PathVariable("productId") int productId, @ModelAttribute("product") Product product) { //
		productDao.editProduct(product);
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/addProduct");
		return modelAndView;
	}

	@RequestMapping(value = "/admin/delete/{productId}", method = RequestMethod.GET)
	public ModelAndView deleteproduct(@PathVariable int productId) {
		productDao.deleteProduct(productId);
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/addProduct");
		List<Product> productList = productDao.getAllProduct();
		modelAndView.addObject("ProductList", productList);
		return modelAndView;
	}

	/*
	 * ==================================Admin-Category-CRUD====================
	 * =============================
	 */

	@RequestMapping(value = "/admin/Categories")
	public ModelAndView Categories() {
		List<Category> categoryList = categoryDao.CategoryList();
		ModelAndView mav = new ModelAndView("admin/Categories");
		mav.addObject("Category", category);
		mav.addObject("CategoryList", categoryList);
		return mav;
	}

	@RequestMapping(value = "/admin/addCategory")
	public ModelAndView goToAddCategory() {
		List<Category> categoryList = categoryDao.CategoryList();
		ModelAndView mav = new ModelAndView("admin/Categories");
		boolean isCategoryClicked = true;
		mav.addObject("isCategoryClicked", isCategoryClicked);
		mav.addObject("CategoryList", categoryList);
		mav.addObject("Category", category);
		return mav;
	}

	@RequestMapping(value = "/admin/addCategory", method = RequestMethod.POST)
	public ModelAndView ForAddingCategory(@ModelAttribute("Category") Category category, BindingResult result) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/addCategory");

		List<Category> categoryList = categoryDao.CategoryList();
		if (result.hasErrors()) {
			return modelAndView;
		} else {
			categoryDao.saveCategory(category);

			modelAndView.addObject("CategoryList", categoryList);

			return modelAndView;
		}
	}

	@RequestMapping(value = "/admin/editC/{categoryId}", method = RequestMethod.POST)
	public ModelAndView updationCategory(@PathVariable("categoryId") int categoryId,
			@ModelAttribute("category") Category category) { //
		category.setCategoryId(categoryId);
		categoryDao.updateCategory(category);
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/addCategory");
		return modelAndView;
	}

	@RequestMapping(value = "/admin/deleteC/{categoryId}", method = RequestMethod.GET)
	public ModelAndView deleteCategory(@PathVariable int categoryId) {
		categoryDao.deleteCategory(categoryId);
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/addCategory");
		List<Category> categoryList = categoryDao.CategoryList();
		modelAndView.addObject("CategoryList", categoryList);
		return modelAndView;
	}

	/*
	 * ======================================Admin-Supplier-CRUD================
	 * =============================
	 */

	@RequestMapping(value = "/admin/Suppliers")
	public ModelAndView Suppliers() {
		List<Supplier> supplierList = supplierDao.SupplierList();
		ModelAndView mav = new ModelAndView("admin/Suppliers");
		mav.addObject("Supplier", supplier);
		mav.addObject("SupplierList", supplierList);
		return mav;
	}

	@RequestMapping(value = "/admin/addSupplier")
	public ModelAndView goToAddSupplier() {
		List<Supplier> supplierList = supplierDao.SupplierList();
		ModelAndView mav = new ModelAndView("admin/Suppliers");
		boolean isSupplierClicked = true;
		mav.addObject("isSupplierClicked", isSupplierClicked);
		mav.addObject("Supplier", supplier);
		mav.addObject("SupplierList", supplierList);
		return mav;
	}

	@RequestMapping(value = "/admin/addSupplier", method = RequestMethod.POST)
	public ModelAndView ForAddingSupplier(@ModelAttribute("Supplier") Supplier supplier, BindingResult result) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/addSupplier");

		List<Supplier> supplierList = supplierDao.SupplierList();
		if (result.hasErrors()) {
			return modelAndView;
		} else {
			supplierDao.saveSupplier(supplier);
			modelAndView.addObject("SupplierList", supplierList);
			return modelAndView;
		}
	}

	@RequestMapping(value = "/admin/editS/{supplierId}", method = RequestMethod.POST)
	public ModelAndView updationSupplier(@PathVariable("supplierId") int supplierId,
			@ModelAttribute("supplier") Supplier supplier) { //
		supplier.setSupplierId(supplierId);
		supplierDao.updateSupplier(supplier);
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/addSupplier");
		return modelAndView;
	}

	@RequestMapping(value = "/admin/deleteS/{supplierId}", method = RequestMethod.GET)
	public ModelAndView deleteSupplier(@PathVariable int supplierId) {
		supplierDao.deleteSupplier(supplierId);
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/addSupplier");
		List<Supplier> supplierList = supplierDao.SupplierList();
		modelAndView.addObject("SupplierList", supplierList);
		return modelAndView;
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;

	}

	private void validateImage(MultipartFile image) {
		if (!image.getContentType().equals("image/jpeg")) {
			throw new RuntimeException("Only JPG images are accepted");
		}
	}

	private void saveImage(String filename, MultipartFile image) throws RuntimeException, IOException {
		try {
			File file = new File(servletContext.getRealPath("/") + "/" + filename);

			FileUtils.writeByteArrayToFile(file, image.getBytes());
			System.out.println("Go to the location:  " + file.toString()
					+ " on your computer and verify that the image has been stored.");
		} catch (IOException e) {
			throw e;
		}
	}

}