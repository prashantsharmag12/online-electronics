package com.crunchify.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.crunchify.model.UserModel;

import net.kzn.shoppingbackend.dao.OrderDAO;
import net.kzn.shoppingbackend.dto.Order_detail;


@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private GlobalController global;
	 
	
	
	@RequestMapping(value = "/undelivered")
	public ModelAndView showUndeliveredOrders() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Undelivered-Orders");
		//mv.addObject("categories", categoryDAO.list());
		mv.addObject("UserClickUndelivered", true);
		UserModel customerModel = global.getUserModel();
		mv.addObject("list",orderDAO.listOfUndeleivered(customerModel.getId()));//         getundelivered(customerModel.getId()));
		//System.out.println(orderDAO.getundelivered(customerModel.getId()).size());
		return mv;
	}
	
	@RequestMapping("/{orderId}/delivered")
	public String udpateOrdder(@PathVariable int orderId) {
		//System.out.println("fds");
		Order_detail order = orderDAO.getById(orderId);
		order.setDelivered(true);
		orderDAO.updateOrder(order);//(order);
		return "redirect:/employee/delivered";	
	}
	
	@RequestMapping(value = "/delivered")
	public ModelAndView showdeliveredOrders() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "delivered-Orders");
		//mv.addObject("categories", categoryDAO.list());
		mv.addObject("UserClickdelivered", true);
		UserModel customerModel = global.getUserModel();
		mv.addObject("alist",orderDAO.listOfdeleivered(customerModel.getId()));
		//System.out.println(orderDAO.getundelivered(customerModel.getId()).size());
		return mv;
	}

}