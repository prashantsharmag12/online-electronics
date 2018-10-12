package com.crunchify.model;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;

import net.kzn.shoppingbackend.dao.CustomerDAO;
import net.kzn.shoppingbackend.dto.Address;
import net.kzn.shoppingbackend.dto.Cart;
import net.kzn.shoppingbackend.dto.Customer;

public class RegistrationModel implements Serializable{
	
	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	private Customer customer;
	private Address billing;
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Address getBilling() {
		return billing;
	}
	public void setBilling(Address billing) {
		this.billing = billing;
	}
	
	
	

}
