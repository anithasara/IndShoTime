package com.niit.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CartDAO;
import com.niit.dao.OrdersDAO;
import com.niit.dao.ProductDAO;
import com.niit.dao.UserDAO;
import com.niit.model.CartModel;
import com.niit.model.CategoryModel;
import com.niit.model.OrdersModel;
import com.niit.model.ProductModel;
import com.niit.model.UserModel;

@Controller
public class CartController
{
	@Autowired
	ProductDAO prodD;
	@Autowired
	CartDAO cartD;
	@Autowired
	UserDAO userD;
	@Autowired
	OrdersDAO orderD;
	@RequestMapping(value="/addingCart",method = RequestMethod.POST)
	public ModelAndView addToCart(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		try
		{
		
		int pid=Integer.parseInt(request.getParameter("cartpid"));
		double price=Double.parseDouble(request.getParameter("cartprice"));
		int qty=Integer.parseInt(request.getParameter("cartquant"));
		String cartImage=request.getParameter("cartImage");
		String cartProdName=request.getParameter("cartProdName");
		Principal  principal=request.getUserPrincipal();
		String userId=principal.getName();
		CartModel exist=cartD.getCartItem(pid, userId);
		
		if(exist==null)
		{
		CartModel cm=new CartModel();
		cm.setCartPrice(price);
		cm.setCartProductId(pid);
		cm.setCartQuantity(qty);
		cm.setCartImage(cartImage);
		cm.setCartProdName(cartProdName);
		UserModel c = userD.getUserDetail(userId);
		cm.setCartUserDetails(c);
		cartD.addCart(cm);
		}
		else
		{
			CartModel cm=new CartModel();
			cm.setCartId(exist.getCartId());
			cm.setCartPrice(price);
			cm.setCartProductId(pid);
			cm.setCartQuantity(exist.getCartQuantity()+qty);
			cm.setCartImage(cartImage);
			cm.setCartProdName(cartProdName);
			UserModel c = userD.getUserDetail(userId);
			cm.setCartUserDetails(c);
			cartD.updateCart(cm);
		}
		
		mv.addObject("cartDetails",cartD.getCartById(userId));
		mv.setViewName("cart");
		return mv;
		}
		catch(NullPointerException ex)
		{
			mv.setViewName("login");
			return mv;
		}
	}
	@RequestMapping("/checkoutAction")
	public ModelAndView checkout(HttpServletRequest request){
		ModelAndView mav=new ModelAndView("Checkout");
		Principal principal=request.getUserPrincipal();
		String userEmail=principal.getName();
		UserModel u=userD.getUserDetail(userEmail);
		List<CartModel> cart=cartD.getCartById(userEmail);

		
		
		mav.addObject("user",u);
		mav.addObject("cart", cart);
		
 
		return mav;
		
	}
	
	
	@RequestMapping(value="/checkoutAction",method=RequestMethod.POST)
	public ModelAndView orderSave(HttpServletRequest request){
		
		ModelAndView mav=new ModelAndView("Invoice");
		OrdersModel oo=new OrdersModel();
		Double d=Double.parseDouble(request.getParameter("totalprice"));
		String payment=request.getParameter("payment");
		Principal principal=request.getUserPrincipal();
		String email=principal.getName();
		UserModel user= userD.getUserDetail(email);
		
		oo.setOrderUserDetails(user);
		oo.setOrderTotal(d);
		oo.setOrderPayment(payment);
		orderD.addOrder(oo);
		mav.addObject("user",user);
		return mav;
	}
	@RequestMapping(value="/invoiceAction")
	public ModelAndView invoiceClick(HttpServletRequest request){
		return new ModelAndView("acknowledge");
	}
	@RequestMapping(value = "/cartDelete/{cartId}")
	public ModelAndView deleteProduct(@PathVariable("cartId") int cid,HttpServletRequest request) {
		Principal  principal=request.getUserPrincipal();
		String userId=principal.getName();
		cartD.delete(cid);
		ModelAndView mv=new ModelAndView("cart");
		mv.addObject("cartDetails",cartD.getCartById(userId));
		return mv;
	}
}