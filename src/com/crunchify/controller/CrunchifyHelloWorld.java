package com.crunchify.controller;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.kzn.shoppingbackend.dao.CategoryDAO;
import net.kzn.shoppingbackend.dao.CustomerDAO;
import net.kzn.shoppingbackend.dao.E_notiDAO;
import net.kzn.shoppingbackend.dao.ProductDAO;
import net.kzn.shoppingbackend.dto.Category;
import net.kzn.shoppingbackend.dto.Product;

//import net.kzn.shoppingbackend.dao.CategoryDAO;
//import net.kzn.shoppingbackend.dto.Category;


 
/*
 * author: Crunchify.com
 * 
 */
 
@Controller
public class CrunchifyHelloWorld {
 
	
	
	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private E_notiDAO e_notiDAO;
	
	@RequestMapping(value= {"/","/home","/index"})
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","Home");	
		mv.addObject("categories",categoryDAO.list());
		mv.addObject("UserClickHome",true);
		return mv;
	}
	
	
	@RequestMapping(value= "show/all/product")
	public ModelAndView showallproducts() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","all-products");	
		mv.addObject("categories",categoryDAO.list());
		mv.addObject("UserClickAllProducts",true);
		return mv;
	}
	
	
	@RequestMapping(value="/show/category/{id}/products")
	public ModelAndView showcategoryproducts(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("page");
		Category category =null;
		category= categoryDAO.get(id);
		System.out.println(id);
		
		mv.addObject("title",category.getName());	
		mv.addObject("categories",categoryDAO.list());
		mv.addObject("category",category);
		mv.addObject("UserClickCategoryProducts",true);
		return mv;
	}
	
	@RequestMapping(value="/about")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","About Us");
		mv.addObject("UserClickAbout",true);
		return mv;
	}
	
	@RequestMapping(value="/contact")
	public ModelAndView contact() {
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","Contact Us");
		mv.addObject("UserClickContact",true);
		return mv;
	}
	/*@RequestMapping(value = "/show/${id}/product")
	public ModelAndView singleproduct(@PathVariable("id") int id)
	{
		System.out.println("fdfdf");
		ModelAndView mv= new ModelAndView("page");
		Product product = productDAO.get(id);
		product.setViews(product.getViews()+1);
		mv.addObject(product);
		mv.addObject("title",product.getName());
		mv.addObject("UserClickShowProduct",true);
		return mv;
	}*/
	
	@RequestMapping(value="/show/{id}/product")
	public ModelAndView showsingleproducts(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("page");
		Product product =null;
		product= productDAO.get(id);
		product.setViews(product.getViews()+1);
		productDAO.update(product);
		mv.addObject("title",product.getName());	
		//mv.addObject("categories",categoryDAO.list());
		mv.addObject("product",product);
		mv.addObject("UserClickShowProduct",true);
		return mv;
	}
	
	
	/*@RequestMapping(value = "/show/{id}/product") 
	public ModelAndView showSingleProduct(@PathVariable int id) {
		
		ModelAndView mv = new ModelAndView("page");
		
		Product product = productDAO.get(id);
		
		
		// update the view count
		product.setViews(product.getViews() + 1);
		productDAO.update(product);
		//---------------------------
		
		mv.addObject("title", product.getName());
		mv.addObject("product", product);
		
		mv.addObject("UserClickShowProduct", true);
		
		
		return mv;
		
	}
	*/
	
	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam	(name="error",required=false)String error,@RequestParam	(name="logout",required=false)String logout) {
		ModelAndView mv = new ModelAndView("login");
		
		if(logout!=null)
			mv.addObject("logout","ok you are logged out");
		
		
		if(error!=null)
			mv.addObject("message","invalid credential");
		mv.addObject("title","Login");
		
		return mv;
	}
	
	@RequestMapping(value="/perform-logout")
	public String logout(HttpServletRequest request,HttpServletResponse response) {
		
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth!=null)
		{
			new SecurityContextLogoutHandler().logout(request, response, auth);
			
		}
		
		return "redirect:/login?logout";
	}
	
	
	@RequestMapping(value="/display/employee")
	public ModelAndView displayEmployee() {
		
		
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("EL",customerDAO.listAllEmployee());
		mv.addObject("title","DisplayEmployee");
		mv.addObject("userClickDisplayEmployee",true);
		
		
		return mv;
	}
	
	@RequestMapping("/update/order")
	public ModelAndView updateorder()
	{
		ModelAndView mv=new ModelAndView("page");
		mv.addObject("userClickUpdateOrder",true);
		
		return mv;
		
		
	}
	
	@RequestMapping("/show/all/notifications")
	public ModelAndView shownotification()
	{ 
		System.out.println("fdfdf");
		ModelAndView mv=new ModelAndView("page");
		mv.addObject("userClickShowNotification",true);
		mv.addObject("LN",e_notiDAO.getallnoti());
		return mv;
		
		
	}
	
	
	
	
	
	
	
}