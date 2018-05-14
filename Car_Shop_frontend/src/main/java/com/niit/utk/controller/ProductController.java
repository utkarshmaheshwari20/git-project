package com.niit.utk.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.utk.project_backend.dao.CategoryDAO;
import com.niit.utk.project_backend.dao.ProductDAO;
import com.niit.utk.project_backend.dao.SupplierDAO;
import com.niit.utk.project_backend.dao.UserDAO;
import com.niit.utk.project_backend.model.Product;
import com.niit.utk.project_backend.model.User;

@Controller
@RequestMapping("/admin")
public class ProductController {

	@Autowired
	ProductDAO productDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	SupplierDAO supplierDAO;
	@Autowired
	UserDAO userDAO;

	public ProductController() {
		System.out.println("Product Controller instintiated");
	}
	
	@ModelAttribute
	public User userDetails(HttpServletRequest request) {
		Principal principal = request.getUserPrincipal();
		if (principal == null)  {
			return null;
		}
		else {
		String userEmail = principal.getName();
		User user = userDAO.findbyUserId(userEmail);
		return user;
		}
	}

	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public ModelAndView productlist(ModelMap model) {
		ModelAndView mav = new ModelAndView("listofproducts");
		model.addAttribute("plist", productDAO.getProducts());
		return mav;
	}

	@RequestMapping(value = "/products/addproductform", method = RequestMethod.GET)
	public ModelAndView productPage(ModelMap model) {
		ModelAndView mav = new ModelAndView("addproductform");
		model.addAttribute("catopt", categoryDAO.getCategories());
		model.addAttribute("supopt", supplierDAO.getSuppliers());
		mav.addObject("command", new Product());
		return mav;
	}

	@RequestMapping(value = "/products/addProduct", method = RequestMethod.POST)
	public ModelAndView addProduct(@RequestParam("productName") String productName,
			@RequestParam("productBrandName") String productBrandName,
			@RequestParam("productDescription") String productDescription,
			@RequestParam("productPrice") long productPrice, @RequestParam("categoryId") int categoryId,
			@RequestParam("supplierId") int supplierId, HttpServletRequest servletRequest,
			@RequestParam("images") List<MultipartFile> files) {
		
		Product p = new Product();
		String names = "";
		for (MultipartFile multipartFile : files) {
			String fileName = multipartFile.getOriginalFilename();
			names = names + fileName + ",";
			System.out.println(fileName);
		}

		if (null != files && files.size() > 0) {
			for (MultipartFile multipartFile : files) {

				String fileName = multipartFile.getOriginalFilename();

				File imageFile = new File(servletRequest.getServletContext().getRealPath("/resources/images"),
						fileName);
				try {
					multipartFile.transferTo(imageFile);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		p.setImgNames(names);
		p.setProductName(productName);
		p.setProductBrandName(productBrandName);
		p.setProductDescription(productDescription);
		p.setProductPrice(productPrice);
		p.setCategory(categoryDAO.getCategory(categoryId));
		p.setSupplier(supplierDAO.getSupplier(supplierId));
		productDAO.addProduct(p);
		ModelAndView mav = new ModelAndView("redirect:/admin/products");
		return mav;
	}

	@RequestMapping(value = "/products/editproduct/{productId}")
	public ModelAndView editProductPage(@PathVariable int productId, ModelMap model) {
		ModelAndView mav = new ModelAndView();
		Product p = productDAO.getProduct(productId);
		model.addAttribute("catopt", categoryDAO.getCategories());
		model.addAttribute("supopt", supplierDAO.getSuppliers());
		mav.addObject("p", p);
		mav.setViewName("updateproduct");
		return mav;
	}

	@RequestMapping(value = "/products/updateProduct", method = RequestMethod.POST)
	public ModelAndView updateProduct(@RequestParam("productId") int productId,
			@RequestParam("productName") String productName, @RequestParam("productBrandName") String productBrandName,
			@RequestParam("productDescription") String productDescription,
			@RequestParam("productPrice") long productPrice, @RequestParam("categoryId") int categoryId,
			@RequestParam("supplierId") int supplierId, @RequestParam("images") List<MultipartFile> files,
			HttpServletRequest servletRequest, ModelMap model) {
		ModelAndView mav = new ModelAndView();
		Product p = new Product();
		String names = "";
		for (MultipartFile multipartFile : files) {
			String fileName = multipartFile.getOriginalFilename();
			names = names + fileName + ",";
			System.out.println(fileName);
		}

		if (null != files && files.size() > 0) {
			for (MultipartFile multipartFile : files) {

				String fileName = multipartFile.getOriginalFilename();

				File imageFile = new File(servletRequest.getServletContext().getRealPath("/resources/images"),
						fileName);
				try {
					multipartFile.transferTo(imageFile);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		p.setImgNames(names);
		p.setProductId(productId);
		p.setProductName(productName);
		p.setProductBrandName(productBrandName);
		p.setProductDescription(productDescription);
		p.setCategory(categoryDAO.getCategory(categoryId));
		p.setSupplier(supplierDAO.getSupplier(supplierId));
		p.setProductPrice(productPrice);
		productDAO.updateProduct(p);
		model.addAttribute("plist", productDAO.getProducts());
		mav.setViewName("redirect:/admin/products");
		return mav;
	}

	@RequestMapping(value = "/products/removeproduct/{productId}")
	public ModelAndView deleteProduct(@PathVariable int productId, ModelMap model) {
		ModelAndView mav = new ModelAndView("redirect:/admin/products");
		productDAO.deleteProduct(productId);
		model.addAttribute("plist", productDAO.getProducts());
		return mav;
	}

}
