package com.crunchify.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.crunchify.model.UserModel;

import net.kzn.shoppingbackend.dao.CustomerDAO;
import net.kzn.shoppingbackend.dto.Customer;

@ControllerAdvice
public class GlobalController {
	
	
	
	@Autowired
	private HttpSession session;
	@Autowired
	private CustomerDAO customerDAO;
	
	
	private UserModel userModel=null;
	
	@ModelAttribute("userModel")
	public UserModel getUserModel()
	{
		if(session.getAttribute("userModel")==null)
				{
			
			           Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
			           Customer customer=customerDAO.getByEmail(authentication.getName());
			           if(customer!=null) {
			        	   userModel=new UserModel();
			        	   userModel.setEmail(customer.getEmail());
			        	   userModel.setId(customer.getId());
			        	   userModel.setRole(customer.getRole());
			        	   userModel.setFullname(customer.getF_name()+" "+customer.getL_name());
			        	   
			        	   
			        	   if(userModel.getRole().equals("CUSTOMER"))
			        	   {
			        		   userModel.setCart(customer.getCart());
			        	   }
			        	   session.setAttribute("userModel", userModel);
			        	   return userModel;
			        	   
			           }
			
				}
		return (UserModel) session.getAttribute("userModel");
	}

}