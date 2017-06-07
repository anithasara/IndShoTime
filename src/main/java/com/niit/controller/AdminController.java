package com.niit.controller;

import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.*;

import com.niit.model.CategoryModel;
import com.niit.model.ProductModel;
import com.niit.model.SupplierModel;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	CategoryDAO catD;
	@Autowired
	SupplierDAO supD;
	@Autowired
	ProductDAO proD;
	private static final String UPLOAD_DIRECTORY = "/resources/image/";


	@RequestMapping(value = "/SupplierList")
	public ModelAndView SupplierListData() {

		ModelAndView model = new ModelAndView("SupplierList");
		model.addObject("supplierList", supD.getAllSupplierDetails());
		return model;
	}
	@ModelAttribute
	public void addAttributes(Model model) {
		model.addAttribute("catList", catD.getAllCategoryDetails());
	}
	@RequestMapping(value = "/ProductList")
	public ModelAndView ProductListData() {

		ModelAndView model = new ModelAndView("ProductList");
		model.addObject("productList", proD.getAllProductDetails());
		return model;
	}

	@RequestMapping(value = "/CategoryList")
	public ModelAndView CategoryListData() {

		ModelAndView model = new ModelAndView("CategoryList");
		model.addObject("categoryList", catD.getAllCategoryDetails());
		return model;
	}

	@RequestMapping("/Adding")
	public ModelAndView showform() {
		ModelAndView model = new ModelAndView("Adding");
		model.addObject("category", catD.getAllCategoryDetails());
		model.addObject("supplier", supD.getAllSupplierDetails());
		return model;

	}

	@RequestMapping(value = "/actionCat", method = RequestMethod.POST)
	public ModelAndView addCategory(@RequestParam("cid") int cid, @RequestParam("cname") String cname) {

		CategoryModel c = new CategoryModel();
		c.setCategoryId(cid);
		c.setCategoryName(cname);

		catD.addCategory(c);
		// return new ModelAndView("Adding");
		return new ModelAndView("modelDialog");

	}

	@RequestMapping(value = "/actionSup", method = RequestMethod.POST)
	public ModelAndView addSupplier(@RequestParam("sid") int sid, @RequestParam("sname") String sname) {
		SupplierModel c = new SupplierModel();

		c.setSupplierId(sid);
		c.setSupplierName(sname);

		supD.addSupplier(c);
		return new ModelAndView("modelDialogS");
	}

	@RequestMapping(value = "/actionProd", method = RequestMethod.POST)
	public ModelAndView addProduct(@RequestParam("file") MultipartFile file, HttpServletRequest request) {

		System.out.println("in Products Controller");
		int id = Integer.parseInt(request.getParameter("pid"));
		String pname = request.getParameter("pname");
		Double price = Double.parseDouble(request.getParameter("pprice"));
		String pdesc=request.getParameter("pdesc");
		int stock = Integer.parseInt(request.getParameter("pstock"));
		int cid = Integer.parseInt(request.getParameter("categoryitems"));
		int sid = Integer.parseInt(request.getParameter("supplieritems"));
		String filename = id + file.getOriginalFilename();
		System.out.println(id + "-" + pname + "-" + price + "-" + cid + "-" + sid + "---");
		CategoryModel c = catD.getCategoryDetail(cid);
		SupplierModel s = supD.getSupplierDetail(sid);

		proD.addProduct(new ProductModel(id, pname,pdesc,stock, price, c, s, filename));

		String path = request.getSession().getServletContext().getRealPath("/");

		System.out.println(path + "" + filename);

		byte[] bytes;
		try {
			bytes = file.getBytes();
			BufferedOutputStream stream;
			stream = new BufferedOutputStream(new FileOutputStream(path + "/resources/image/"+filename));
			stream.write(bytes);
			stream.flush();
			stream.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ModelAndView mv = new ModelAndView("modelDialogP");

		return mv;
	}
	
	@RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
	public ModelAndView updateProduct(@RequestParam("file") MultipartFile file, HttpServletRequest request) {

		System.out.println("WELCOME");
		int pid = Integer.parseInt(request.getParameter("pid"));
		String pname = request.getParameter("pname");
		Double price = Double.parseDouble(request.getParameter("pprice"));
		String pdesc=request.getParameter("pdescp");
		int stock = Integer.parseInt(request.getParameter("pinstock"));
		int cid = Integer.parseInt(request.getParameter("categoryitems"));
		int sid = Integer.parseInt(request.getParameter("supplieritems"));
		String filename = pid + file.getOriginalFilename();
		CategoryModel c = catD.getCategoryDetail(cid);
		SupplierModel s = supD.getSupplierDetail(sid);

		proD.updateProductDetails(new ProductModel(pid, pname,pdesc,stock, price, c, s, filename));
		String path = request.getSession().getServletContext().getRealPath(UPLOAD_DIRECTORY);

		System.out.println(path + "" + filename);

		byte barr[];
		try {
			barr = file.getBytes();
			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(path + filename));
			bout.write(barr);
			bout.flush();
			bout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		ModelAndView mv = new ModelAndView("modelDialogP");

		return mv;
	}

/*	@RequestMapping(value = "/productDelete/{prodId}")
	public ModelAndView deleteProduct(@PathVariable("prodId") int pid) {
		proD.delete(proD.getProductDetail(pid));
		return new ModelAndView("ProductList");
	}*/
	
	@RequestMapping(value = "/productDelete/{prodId}", method=RequestMethod.GET)
	public String deleteProduct(@PathVariable("prodId") int pid) {
		proD.delete(proD.getProductDetail(pid));
		return "redirect:/admin/ProductList";
	}

	@RequestMapping(value = "/productEdit")
	public ModelAndView editProducts(@RequestParam("id") int pid) {
		ModelAndView mv = new ModelAndView("UpdateProduct");
		mv.getModelMap().addAttribute("eproduct", proD.getProductDetail(pid));
		mv.getModelMap().addAttribute("ecategories", catD.getAllCategoryDetails());
		mv.getModelMap().addAttribute("esuppliers", supD.getAllSupplierDetails());
		return mv;
	}

}