package com.niit.utk.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.utk.project_backend.dao.UserDAO;
import com.niit.utk.project_backend.model.User;

@Controller
public class UserController {

	@Autowired
	UserDAO userDAO;

	public UserController() {
		System.out.println("User Controller instintiated");
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

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView signup() {
		return new ModelAndView("signup", "command", new User());
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("command") User user, ModelMap model) {
		user.setRole("customer");
		userDAO.addUser(user);
		return "home";
	}
	
	@RequestMapping(value= "/userDetails/{userId}")
	public ModelAndView userDetails(@PathVariable int userId) {
		ModelAndView mav = new ModelAndView("userdetails");
		mav.addObject(userDAO.getUser(userId));
		return mav;
	}
	
	@RequestMapping("/error")
	public  String errorPage(){
		return "error";
		
	}
	
	@RequestMapping("/userLogged")
	public  String userLogged(){
		return "redirect:/";
		
	}
	

}
