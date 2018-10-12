package com.crunchify.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import FileUploadUtility.FileUploadUtility;
import net.kzn.shoppingbackend.dao.CategoryDAO;
import net.kzn.shoppingbackend.dao.CustomerDAO;
import net.kzn.shoppingbackend.dao.E_notiDAO;
import net.kzn.shoppingbackend.dao.OrderDAO;
import net.kzn.shoppingbackend.dao.ProductDAO;
import net.kzn.shoppingbackend.dto.Category;
import net.kzn.shoppingbackend.dto.E_noti;
import net.kzn.shoppingbackend.dto.Order_detail;
//import net.kzn.shoppingbackend.dto.Notification;
import net.kzn.shoppingbackend.dto.Product;

@Controller
@RequestMapping("/manage")
public class ManagementController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private E_notiDAO e_notiDAO;
	
	@Autowired
	private CustomerDAO customerDAO;
	
	@Autowired
	private OrderDAO orderDAO;
	
	@RequestMapping(value="/products",method=RequestMethod.GET)
	public ModelAndView showManageProducts(@RequestParam(name="operation",required=false) String operation) {
		
		ModelAndView mv= new ModelAndView("page");
		mv.addObject("UserClickManageProducts",true);
		mv.addObject("title","Manage Products");
		Product newproduct =new Product();
		
		newproduct.setActive(true);
		
		mv.addObject("product",newproduct);
		
		if(operation!=null)
		{
			if(operation.equals("product"))
			{
				mv.addObject("message","Added to the database successfully!");
			}
			else if(operation.equals("category"))
				mv.addObject("message"," Category Added to the database successfully!");
				
		}
		
		return mv;
	}
	
	
	
	
	@RequestMapping(value="/notificat",method=RequestMethod.GET)
	public ModelAndView showManageProducts() {
		//System.out.println("1");
		ModelAndView mv= new ModelAndView("page");
		mv.addObject("UserClickManageNotification",true);
		mv.addObject("title","Manage Notification");
		E_noti enoti =new E_noti();
		
		
		mv.addObject("enoti",enoti);
		//System.out.println("2");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="{id}/products",method=RequestMethod.GET)
	public ModelAndView editManageProducts(@PathVariable int id) {
		
		ModelAndView mv= new ModelAndView("page");
		mv.addObject("UserClickManageProducts",true);
		mv.addObject("title","Manage Products");
		Product newproduct =productDAO.get(id);
		
		mv.addObject(newproduct);
		
		
		
		return mv;
	}
	
	
	@ModelAttribute("categories")
	public List<Category> getCategories()
	{
		
		return categoryDAO.list();
		
	}
	
	
	@RequestMapping(value="/products",method=RequestMethod.POST)
	public String handlingform( @ModelAttribute("product") Product newproduct,HttpServletRequest request)
	{
		
		
		//new ProductValidator().validate(newproduct, results);
		if(newproduct.getName().equals(""))
			return "redirect:/manage/products";
		if(newproduct.getBrand().equals(""))
			return "redirect:/manage/products";
		if(newproduct.getDescription().equals(""))
			return "redirect:/manage/products";
		
		if(newproduct.getId()==0)
		productDAO.add(newproduct);
		else
			productDAO.update(newproduct);
		
		if(!newproduct.getFile().getOriginalFilename().equals(""))
		{
			FileUploadUtility.uploadFile(request,newproduct.getFile(),newproduct.getProduct_code());
		}
		return "redirect:/manage/products?operation=product";
		
	}
	
	
	
	@RequestMapping(value="/notificat",method=RequestMethod.POST)
	public String handllingform( @Valid @ModelAttribute("enoti") E_noti enoti,BindingResult results,HttpServletRequest request)
	{
		
		
		//new ProductValidator().validate(newproduct, results);
	    
		
		Date d= new Date();	
		enoti.setNoti_date(d);
		 e_notiDAO.addnew(enoti);
		 
		 
			return "redirect:/manage/notificat";
		   
		
	}
	
	
	@RequestMapping(value="/activation/{id}/products")
	public void activating(@PathVariable int id)
	{
		
		Product product =productDAO.get(id);
		boolean active = product.isActive();
		product.setActive(!active);
		productDAO.update(product);
		
		
		return ;
		
		
	}
	
	@RequestMapping(value="/category" , method=RequestMethod.POST)
	public String handleCategorySubmission(@ModelAttribute Category category)
	{
		
		
		categoryDAO.add(category);
		return "redirect:/manage/products?operation=category";
		
		
	}
	
	
	
	@ModelAttribute("category")
	public Category getCategory() {
		return new Category();
	}
	
	
	@RequestMapping(value="/activation/{id}/employees")
	public void activatinemployee(@PathVariable int id)
	{
		
		/*Customer customer =customerDAO.get(id);
		boolean active = product.isActive();
		product.setActive(!active);
		productDAO.update(product);*/
		System.out.println("hello!");
		
		
		return ;
		
		
	}
	
	@RequestMapping(value = "/orders")
	public ModelAndView assignOrders() {
		
		ModelAndView mv = new ModelAndView("page");
		
		mv.addObject("userClickManageOrders", true);
		mv.addObject("title","Manage Orders");
		mv.addObject("listOrders",orderDAO.listOfUnassigned());
		mv.addObject("deliveryboys",customerDAO.listActiveEmployee());
		mv.addObject("peesu",-1);
		//System.out.println(customerDAO.listDelivery_boys().size());
		//mv.addObject("listBoys",customerDAO.listDelivery_boys());
		//System.out.println(customerDAO.listDelivery_boys().size());
		return mv;
	}
	
	@RequestMapping("/{orderId}/{Emp_id}")
	public String udpateOrdder(@PathVariable int orderId,@PathVariable int Emp_id) {
		Order_detail order = orderDAO.getById(orderId);
		order.setEmp_id(Emp_id);
		orderDAO.updateOrder(order);
		return "redirect:/manage/orders";	
	}
	

}
