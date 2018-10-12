package com.crunchify.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.crunchify.model.RegistrationModel;

import net.kzn.shoppingbackend.dao.CustomerDAO;
import net.kzn.shoppingbackend.dto.Address;
import net.kzn.shoppingbackend.dto.Cart;
import net.kzn.shoppingbackend.dto.Customer;

@Component
public class RegisterHandler {
	@Autowired
	private CustomerDAO customerDAO;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	public RegistrationModel init()
	{
		return new RegistrationModel();
	}
	
	public void addCustomer(RegistrationModel registrationModel,Customer customer) {
		
		
		registrationModel.setCustomer(customer);
	}
	
	
public void addBilling(RegistrationModel registrationModel,Address billing) {
		
		
		registrationModel.setBilling(billing);
	}
public String saveAll(RegistrationModel model)
{
	
	String transitionValue = "success";
	Customer customer = model.getCustomer();
	if (customer.getRole().equals("CUSTOMER")) {
		// create a new cart
		Cart cart = new Cart();
		cart.setCustomer(customer);
		customer.setCart(cart);
	}
	customer.setPassword(passwordEncoder.encode(customer.getPassword()));
	customerDAO.addUser(customer);
	
	Address billing = model.getBilling();
	billing.setCust_id(customer.getId());
	billing.setIs_billing(true);
	customerDAO.addAddress(billing);
	

	return transitionValue;
	
}

public String validateCustomer(Customer customer,MessageContext message)
{
	String transition="success";
	
	
	if(!(customer.getPassword().equals(customer.getConfirmPassword())))
			{
		
		         message.addMessage(new MessageBuilder().error().source("confirmPassword").defaultText("Password does not match").build());
		
		         transition="failure";
			}
	if(customerDAO.getByEmail(customer.getEmail())!=null) {
	    message.addMessage(new MessageBuilder().error().source(
	      "email").defaultText("Email address is already exists!").build());
	    transition = "failure";
	   }
	
	return transition;
}

}
