package com.niit.utk.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.utk.project_backend.dao.CategoryDAO;
import com.niit.utk.project_backend.dao.ProductDAO;
import com.niit.utk.project_backend.dao.UserDAO;
import com.niit.utk.project_backend.model.User;

@Controller
public class HomeController {

	@Autowired
	ProductDAO productDAO;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	UserDAO userDAO;

	public HomeController() {
		System.out.println("Home Controller instintiated");
	}

	@RequestMapping({ "/home", "/" })
	public ModelAndView home(ModelMap model, HttpServletRequest request) {
		Principal principal = request.getUserPrincipal();
		if (principal == null) {
			ModelAndView mav = new ModelAndView("home");
			model.addAttribute("clist", categoryDAO.getCategories());
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("home");
			model.addAttribute("clist", categoryDAO.getCategories());
			return mav;
		}

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
	
	@RequestMapping("/aboutus")
	public ModelAndView aboutUs() {
		ModelAndView mav = new ModelAndView("aboutus");
		return mav;
	}

	@RequestMapping("/contactus")
	public ModelAndView contactUs() {
		ModelAndView mav = new ModelAndView("contactus");
		return mav;
	}

	@RequestMapping("/careers")
	public ModelAndView careers() {
		ModelAndView mav = new ModelAndView("careers");
		return mav;
	}

	@RequestMapping("/admin")
	public ModelAndView admin() {
		ModelAndView mav = new ModelAndView("admin");
		return mav;
	}

	@RequestMapping("/productdetails/{productId}")
	public ModelAndView productDetail(@PathVariable int productId) {
		ModelAndView mav = new ModelAndView("productdetails");
		mav.addObject("product", productDAO.getProduct(productId));
		return mav;
	}

}
