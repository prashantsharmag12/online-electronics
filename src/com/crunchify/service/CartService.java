package com.crunchify.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crunchify.model.UserModel;

import net.kzn.shoppingbackend.dao.Cart_lineDAO;
import net.kzn.shoppingbackend.dao.CustomerDAO;
import net.kzn.shoppingbackend.dao.Item_detailDAO;
import net.kzn.shoppingbackend.dao.OrderDAO;
import net.kzn.shoppingbackend.dao.ProductDAO;
import net.kzn.shoppingbackend.dto.Address;
import net.kzn.shoppingbackend.dto.Cart;
import net.kzn.shoppingbackend.dto.Cart_line;
import net.kzn.shoppingbackend.dto.Customer;
import net.kzn.shoppingbackend.dto.Item_detail;
import net.kzn.shoppingbackend.dto.Order_detail;
import net.kzn.shoppingbackend.dto.Product;

@Service("cartService")
public class CartService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	
	
	@Autowired
	private CustomerDAO customerDAO;
	
	@Autowired
	private Cart_lineDAO cart_lineDAO ;
	
	@Autowired
	private ProductDAO productDAO ;
	
	@Autowired
	private Item_detailDAO itemdetailDAO;
	
	
	@Autowired
	private HttpSession session;
	
	private Cart getCart() {
		
		return ((UserModel)session.getAttribute("userModel")).getCart();
	}
	
	public List<Cart_line> getCartLines() {
		
		Cart cart = this.getCart();
		return cart_lineDAO.list(cart.getId());
	}
	public Cart getCurrentCart()
	{
		Cart cart = this.getCart();
		return cart;
	}

	public String updateCartLine(int cartLineId, int count) {
		
		
		Cart_line cart_line=cart_lineDAO.get(cartLineId);
		//System.out.println("dfdff");
		if(cart_line==null)
		{
			return "result=error";
		}
		else
		{
			
			Product product=cart_line.getProduct();
			double old_total=cart_line.getTotal();
			if(product.getQuantity()<count)
			{
				return "result=unavailable";
			}
			
			cart_line.setQuantity(count);
			cart_line.setProduct_price((int)product.getPrice());
			cart_line.setTotal(count*(int)product.getPrice());
			cart_lineDAO.update(cart_line);
				Cart cart=this.getCart();
				
				 cart.setTotal(cart.getTotal()-old_total+cart_line.getTotal());
		    	 
		    	 cart_lineDAO.updateCart(cart);
			
			
			return "result=updated";
		}
		
		
		
		
	}

	public String deleteCartLine(int cartLineId) {
		// TODO Auto-generated method stub
		Cart_line cart_line=cart_lineDAO.get(cartLineId);
		if(cart_line==null)
		{
			return "result=error";
		}
		else
		{
			Cart cart=this.getCart();
			cart.setTotal(cart.getTotal()-cart_line.getTotal());
			cart.setCart_lines(cart.getCart_lines()-1);
			cart_lineDAO.updateCart(cart);
			cart_lineDAO.delete(cart_line);
			return "result=deleted";
			
		}
		
	}

	/*public String addCartLine(int productId) {
		String response = null;
		Cart cart = this.getCart();
		Cart_line cart_line = cart_lineDAO.getByCartAndProduct(cart.getId(), productId);
		System.out.println("Outside");
		if(cart_line == null) {
			cart_line = new Cart_line();
			
			Product product = productDAO.get(productId);
			
			cart_line.setCart_id(cart.getId());
			cart_line.setProduct_price((int)product.getPrice());
			cart_line.setProduct(product);
			cart_line.setQuantity(1);
			cart_line.setTotal((int)product.getPrice());
			cart_line.setIs_available(true);
			
			cart_lineDAO.add(cart_line);
			cart.setCart_lines(cart.getCart_lines()+1);
			cart.setTotal(cart.getTotal()+cart_line.getTotal());
			cart_lineDAO.updateCart(cart);
			
			System.out.println("inside");
			response = "result=added";
			
		}
		else {
			if(cart_line.getQuantity()<10) {
				response = this.updateCartLine(cart_line.getId(), cart_line.getQuantity()+1);
			}
			else {
				response = "result=maximum";
			}
		}
		
		
			
		return response;
	}*/

	public String addDDCartLine(int productId) {
		
		String response = null;
				Cart cart = this.getCart();
				

		Cart_line cart_line = cart_lineDAO.getByCartAndProduct(cart.getId(), productId);
		System.out.println("hgvds");
		System.out.println("Outside");
		if(cart_line == null) {
			cart_line = new Cart_line();
			
			Product product = productDAO.get(productId);
			
			cart_line.setCart_id(cart.getId());
			cart_line.setProduct_price((int)product.getPrice());
			cart_line.setProduct(product);
			cart_line.setQuantity(1);
			cart_line.setTotal((int)product.getPrice());
			cart_line.setIs_available(true);
			
			cart_lineDAO.add(cart_line);
			cart.setCart_lines(cart.getCart_lines()+1);
			cart.setTotal(cart.getTotal()+cart_line.getTotal());
			cart_lineDAO.updateCart(cart);
			
			System.out.println("inside");
			response = "result=added";
			
		}
		else {
			if(cart_line.getQuantity()<10) {
				response = this.updateCartLine(cart_line.getId(), cart_line.getQuantity()+1);
			}
			else {
				response = "result=maximum";
			}
		}
		
		
			
		return response;
	}
	
	public String validateCartLine() {
		Cart cart = this.getCart();
		List<Cart_line> cart_line = cart_lineDAO.list(cart.getId());
		double grandTotal = 0.0;
		int lineCount = 0;
		String response = "result=success";
		boolean changed = false;
		Product product = null;
		for(Cart_line cartline : cart_line) {					
			product = cartline.getProduct();
			changed = false;
			// check if the product is active or not
			// if it is not active make the availability of cartLine as false
			if((!product.isActive() && product.getQuantity() == 0) && cartline.isIs_available()) {
				cartline.setIs_available(false);
				changed = true;
			}			
			// check if the cartLine is not available
			// check whether the product is active and has at least one quantity available
			if((product.isActive() && product.getQuantity() > 0) && !(cartline.isIs_available())) {
					cartline.setIs_available(true);
					changed = true;
			}
			
			// check if the buying price of product has been changed
			if(cartline.getProduct_price() != product.getPrice()) {
				// set the buying price to the new price
				cartline.setProduct_price((int)product.getPrice());
				// calculate and set the new total
				cartline.setTotal((int)(cartline.getQuantity() * product.getPrice()));
				changed = true;				
			}
			
			// check if that much quantity of product is available or not
			if(cartline.getQuantity() > product.getQuantity()) {
				cartline.setQuantity(product.getQuantity());										
				cartline.setTotal((int)(cartline.getQuantity() * product.getPrice()));
				changed = true;
				
			}
			
			// changes has happened
			if(changed) {				
				//update the cartLine
				cart_lineDAO.update(cartline);
				// set the result as modified
				response = "result=modified";
			}
			
			grandTotal += cartline.getTotal();
			lineCount++;
		}
		
		cart.setCart_lines(lineCount++);
		cart.setTotal(grandTotal);
		cart_lineDAO.updateCart(cart);

		return response;
	}

	public void addItem(int v) {
		
		
		/*System.out.println(3);
		
		
		Date d=new Date();
		Cart cart=this.getCart();
		Order_detail order_detail=new Order_detail();
		order_detail.setAmount((int)cart.getTotal());
		order_detail.setBilling_id(customerDAO.getBillingAddress(cart.getCustomer().getId()).getId());
		order_detail.setQuantity(cart.getCart_lines());
		order_detail.setUser_id(cart.getCustomer().getId());
		
		order_detail.setShipping_id(v);
		order_detail.setOrder_date(d);
		order_detail.setDelivered(false);
		orderDAO.addOrder(order_detail);*/
		
		//System.out.println(order_detail.getShipping_id());
		/*int sum=0;
		for(Cart_line cartline : cart_line)
		{
			sum+=(cartline.getProduct_price()*cartline.getQuantity());
			
		}*/
		
		Cart cart = this.getCart();
		double total =0.0;
		Order_detail order = new Order_detail();
		Customer customer = cart.getCustomer();
		order.setUser_id(customer.getId());
		order.setDelivered(false);
		
		//List<Cart_line> cartLines = cartLineDAO.list(cart.getId());
		order.setQuantity(cart.getCart_lines());
		Address b_address = customerDAO.getBillingAddress(customer.getId());
		
		order.setBilling_id(3);
		order.setShipping_id(v);
		
		order.setAmount((int)cart.getTotal());
		Date d = new Date();
		
		order.setOrder_date(d);
		orderDAO.addOrder(order);
		
		List<Cart_line> cartlines = cart_lineDAO.list(cart.getId());
		
		
		for(Cart_line cart_line : cartlines) {
			Item_detail itemLine = new Item_detail();
			itemLine.setOrder_id(order.getId());
			Product product = cart_line.getProduct();
			product.setPurchases(product.getPurchases()+cart_line.getQuantity());
			product.setQuantity(product.getQuantity()-cart_line.getQuantity());
			productDAO.update(product);
			
			itemLine.setPrice((int)product.getPrice());
			itemLine.setProduct_id(product.getId());
			itemLine.setQuantity(cart_line.getQuantity());
			
			itemLine.setTotal(cart_line.getTotal());
			itemdetailDAO.add(itemLine);
				
			}
	}
	
	public List<Order_detail> listhistory(){
		
		Cart cart = this.getCart();
		Customer customer = cart.getCustomer();
		return orderDAO.listhistory(customer.getId());
	}
	
	
	
}