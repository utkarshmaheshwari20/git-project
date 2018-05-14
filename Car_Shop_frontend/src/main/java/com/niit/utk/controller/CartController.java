package com.niit.utk.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.utk.project_backend.dao.CartDAO;
import com.niit.utk.project_backend.dao.OrderDAO;
import com.niit.utk.project_backend.dao.ProductDAO;
import com.niit.utk.project_backend.dao.UserDAO;
import com.niit.utk.project_backend.model.Card;
import com.niit.utk.project_backend.model.Cart;
import com.niit.utk.project_backend.model.Orders;
import com.niit.utk.project_backend.model.User;

@Controller
public class CartController {

	int a;
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	UserDAO userDAO;

	@Autowired
	CartDAO cartDAO;

	@Autowired
	OrderDAO orderDAO;
	
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
	
	@RequestMapping(value="/myCart")
	public ModelAndView cart(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("cart");
		Principal principal = request.getUserPrincipal();
		String userEmail = principal.getName();
		mav.addObject("cartInfo", cartDAO.findCartById(userEmail));
		return mav;
	}

	@RequestMapping(value = "/addToCart", method = RequestMethod.POST)
	public ModelAndView addToCart(@RequestParam("cartProductId") int cartProductId,
								  @RequestParam("cartPrice") long cartPrice,
								  @RequestParam("cartQuantity") int cartQuantity,
								  @RequestParam("cartImage") String cartImage,
								  @RequestParam("cartProductName") String cartProductName,
								  HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		try {
			Principal principal = request.getUserPrincipal();
			String userEmail = principal.getName();
			int quantity = cartQuantity;
			Cart cartExist = cartDAO.getCartById(cartProductId, userEmail);
			if (cartExist == null) {
				Cart cm = new Cart();
				cm.setCartPrice(cartPrice);
				cm.setCartProductId(cartProductId);
				cm.setCartQuantity(quantity);
				cm.setCartImage(cartImage);
				cm.setCartProductName(cartProductName);
				cm.setEmailId(userEmail);
				cartDAO.insert(cm);
			} else {
				Cart cm = new Cart();
				cm.setCartId(cartExist.getCartId());
				cm.setCartPrice(cartPrice);
				cm.setCartProductId(cartProductId);
				cm.setCartQuantity(cartQuantity);
				cm.setCartImage(cartImage);
				cm.setCartProductName(cartProductName);
				cm.setCartQuantity(cartExist.getCartQuantity() + quantity);
				cm.setEmailId(userEmail);
				cartDAO.update(cm);
			}
			mav.setViewName("redirect:/myCart");
			return mav;
		}

		catch (Exception ex) {
			ex.printStackTrace();
			mav.setViewName("productdetails");
			mav.addObject("product", productDAO.getProduct(cartProductId));
			mav.addObject("message", "Please login first");
			return mav;
		}
	}

	@RequestMapping("/checkout")
	public ModelAndView checkout(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView("checkout");
		Principal principal = request.getUserPrincipal();
		String userEmail = principal.getName();
		mav.addObject("cart", cartDAO.findCartById(userEmail));
		return mav;

	}

	@RequestMapping(value = "/invoiceprocess")
	public ModelAndView orderSave(@RequestParam("cardHolder") String cardHolder,
			 					  @RequestParam("cardNumber") String cardNumber,
			 					  @RequestParam("mm") int mm,
			 					  @RequestParam("yy") int yy,
			 					  @RequestParam("cvv") int cvv,
			 					  @RequestParam("total") long total,
			 					  HttpServletRequest request) {

		ModelAndView mav = new ModelAndView("invoice");
		Principal principal = request.getUserPrincipal();
		String userEmail = principal.getName();
		User user = userDAO.findbyUserId(userEmail);
		Orders o = new Orders();
		o.setTotal(total);
		o.setUser(user);
		Card c = new Card();
		c.setCardNumber(cardNumber);
		c.setCardHolder(cardHolder);
		c.setMm(mm);
		c.setYy(yy);
		c.setCvv(cvv);
		o.setPayment(c);
		orderDAO.addOrder(o);
		mav.addObject("order",o);
		mav.addObject("cart", cartDAO.findCartById(userEmail));
		return mav;
	}

	@RequestMapping(value = "/ackAction")
	public ModelAndView ack() {
		return new ModelAndView("acknowledgement");
	}

	@RequestMapping(value = "/deletePCart/{cardId}")
	public ModelAndView deleteProductFromCart(@PathVariable("cardId") int cartId) {
		ModelAndView mav = new ModelAndView();
		cartDAO.delete(cartId);
		mav.setViewName("redirect:/myCart");
		return mav;
	}

}
