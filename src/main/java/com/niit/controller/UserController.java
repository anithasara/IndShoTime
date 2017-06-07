package com.niit.controller;



import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;
import com.niit.dao.UserDAO;
import com.niit.model.ProductModel;
import com.niit.model.UserModel;

@Controller
//@RequestMapping("/user")
public class UserController {
	@Autowired
	UserDAO userD;
	@Autowired
	CategoryDAO catD;
	@Autowired
	ProductDAO proD;

	@RequestMapping(value={"/","/home"})
	public ModelAndView welcome() {
		ModelAndView model = new ModelAndView("index");
		model.addObject("catList", catD.getAllCategoryDetails());
		return model;
	}

	

	@RequestMapping("/notaccessible")
	public String notaccess() {
		return "notaccessible";
	}
	
	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}
	@RequestMapping(value = "/userLogged")
	public String userLogged(){
		return "redirect:/";
	}

	@RequestMapping(value = "/productCustList")
	public ModelAndView displayCustProducts(@RequestParam("cid") int cid) {
		System.out.println(cid);
		ModelAndView mv = new ModelAndView("ProductCustList");
		mv.getModelMap().addAttribute("custProducts", proD.getProductsByCategory(cid));

		return mv;
	}

	/*@RequestMapping("/signup")
	public ModelAndView signup() {
		ModelAndView mv = new ModelAndView("signup");
		return mv;
	}*/
/*
	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	public ModelAndView addUser(HttpServletRequest request) {
		UserModel um = new UserModel();
		um.setUserName(request.getParameter("username"));
		um.setUserMailId(request.getParameter("useremail"));
		um.setUserPassword(request.getParameter("userpassword"));
		um.setUserAddress(request.getParameter("useraddress"));
		um.setUserPhoneNo(request.getParameter("userphone"));
		um.setUserRole("user");
		um.setUserenabled(true);
		userD.addUser(um);
		ModelAndView mv = new ModelAndView("login");
		return mv;

	}*/
	
	@RequestMapping("/registration")
	public ModelAndView registerUser()
	{
		ModelAndView mv=new ModelAndView("registration");
		mv.addObject("user", new UserModel());
		return mv;
	}
	
	@RequestMapping(value="/userLogin", method = RequestMethod.POST)
	public ModelAndView doRegister(@Valid @ModelAttribute("user") UserModel user,BindingResult result)
	{
		ModelAndView mv=new ModelAndView();
		if(result.hasErrors())
		{
		mv.setViewName("registration");
		return mv;
		}
		else
		{
		user.setUserRole("ROLE_USER");
		user.setUserenabled(true);
		userD.addUser(user);
		mv.setViewName("login");
		return mv;
		}
	}
	 @RequestMapping(value="/productDetail/{pid}")
	 public ModelAndView getProductDetail(@PathVariable("pid") int pid)
	 {
		 ModelAndView mv=new ModelAndView("checkProductDetails");
		 ProductModel product=proD.getProductDetail(pid);
		 mv.addObject("product",product);
		 return mv;
	 }
	
}
