package com.crunchify.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.crunchify.service.CartService;

import net.kzn.shoppingbackend.dao.AddressDAO;
import net.kzn.shoppingbackend.dao.CustomerDAO;
import net.kzn.shoppingbackend.dao.OrderDAO;
import net.kzn.shoppingbackend.dao.ProductDAO;
import net.kzn.shoppingbackend.dto.Address;
import net.kzn.shoppingbackend.dto.Cart;





@Controller
@RequestMapping("/cart")
public class CartController {
	
	
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private AddressDAO addressDAO;
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired 
	private CartService cartService;
	
	@Autowired 
	private CustomerDAO customerDAO;
	
	@RequestMapping("/show")
	public ModelAndView showCart(@RequestParam(name="result",required=false)String result) {
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Shopping Cart");
		mv.addObject("userClickShowCart", true);
		mv.addObject("cartLines",cartService.getCartLines());
		if(result!=null)
		{
			switch(result)
			{
			case "updated":
				mv.addObject("message","updated successfully");
				break;
			case "added":
				mv.addObject("message","added successfully");
				break;
			case "error":
				mv.addObject("message"," no updated successfully");
				break;
			case "deleted":
				mv.addObject("message"," deleted successfully");
				break;
			case "maximum":
				mv.addObject("message"," reached limit");
				break;
			case "unavailable":
				mv.addObject("message"," quanity unavailable");
				break;
			}
		}
		
		return mv;
		
	}
	
	/*@RequestMapping("/{cartLineID}/update")
	public String updateCartLine(@PathVariable int cartLineId,@RequestParam int count) {
		
		System.out.println("DVF");;
		
		String response=cartService.updateCartLine(cartLineId,count);
		//response
		
		
		return "redirect:/cart/show?"+response;
	}*/
	
	
	
	/*@RequestMapping("/{cartLineID}/delete")
	public String updateCartLine(@PathVariable int cartLineId) {
		
		System.out.println("DVF");;
		
		String response=cartService.deleteCartLine(cartLineId);
		//response
		
		
		return "redirect:/cart/show?"+response;
	}
	*/
	
	
	@RequestMapping("/{cartLineId}/delete")
	public String udpateCartLine(@PathVariable int cartLineId) {
		String response = cartService.deleteCartLine(cartLineId);		
		return "redirect:/cart/show?"+response;		
	}
	
	
	
	@RequestMapping("/{cartLineId}/update")
	public String udpateCartLine(@PathVariable int cartLineId, @RequestParam int count) {
		String response = cartService.updateCartLine(cartLineId, count);		
		return "redirect:/cart/show?"+response;		
	}
	
	
	/*@RequestMapping("/add/{product_id}/product")
	public String addCart(@PathVariable int product_id) {
		String response = cartService.addCartLine(product_id);		
		return "redirect:/cart/show?"+response;		
	}*/
	
	
	@RequestMapping("/add/{productId}/product")
	public String addCart(@PathVariable int productId) {
		System.out.println("hv");
		String response = cartService.addDDCartLine(productId);
		//System.out.println("hv");
		return "redirect:/cart/show?"+response;		
	}
	@RequestMapping("/checkout")
	public ModelAndView checkk()
	{
		
		ModelAndView mv=new ModelAndView("checkout");
		
		return mv;
		
	}
	
	
	@RequestMapping("/validate")
	public String validateCart() {	
		
		
		
		
		String response = cartService.validateCartLine();
		
		//System.out.println(response);
		if(!response.equals("result=success")) {
			return "redirect:/cart/show?"+response;
		}
		else {
			return "redirect:/cart/addItem";
		}
	}	
	
	/*@RequestMapping("/addItem")
	public String addItem() {
		
		
		//System.out.println(2);
		cartService.addItem();
		
		
		return "redirect:/cart/afterCheckout/";
		
	}	*/
	
	
	@RequestMapping("/afterCheckout")
	public ModelAndView trry() {
		ModelAndView mv=new ModelAndView("page");
		return mv;
	}
	@RequestMapping("/show/address")
	public ModelAndView showAdd()
	{
		ModelAndView mv=new ModelAndView("page");
		Cart cart= cartService.getCurrentCart();
		int cuid=cart.getCustomer().getId();
		mv.addObject("LOA",customerDAO.listShippingAddresses(cuid));
		mv.addObject("total",cart.getTotal());
		mv.addObject("userClickShowAddress",true);
		return mv;
		
	}
	
	
	@RequestMapping("/payment")
	public ModelAndView showAddsd()
	{
		
		
		ModelAndView mv=new ModelAndView("page");
		mv.addObject("payment",true);
		return mv;
		
	}
	
		
	
	
	
	@RequestMapping(value="/edit/address",method=RequestMethod.GET)
	public ModelAndView showManageProducts() {
		
		
		
		
		ModelAndView mv= new ModelAndView("page");
		mv.addObject("UserClickAddAddress",true);
		mv.addObject("title"," ADDRESS");
		Address newaddress =new Address();
		
		newaddress.setIs_billing(false);
		newaddress.setIs_shipping(true);
		newaddress.setCust_id(cartService.getCurrentCart().getCustomer().getId());
		
		mv.addObject("address",newaddress);
		
		
		
		return mv;
	}
	
	
	
	
	
	
	@RequestMapping(value="/address",method=RequestMethod.POST)
	public String handlinjjgform( @ModelAttribute("address") Address newaddress,HttpServletRequest request)
	{
		
		
		//new ProductValidator().validate(newproduct, results);
		
		addressDAO.add(newaddress);
		
		return "redirect:/cart/show/address";
		
	}
	
	@RequestMapping(value="/add/{id}/order",method=RequestMethod.GET)
	public ModelAndView editManageProducts(@PathVariable int id) {
		//System.out.println(id);
		cartService.addItem(id);
		ModelAndView mv= new ModelAndView("checkout");
		mv.addObject("UserCLickfinaladdress",true);
		return mv;
	}
	
	@RequestMapping("/history")
	public ModelAndView showhistory()
	{
		
		ModelAndView mv=new ModelAndView("page");
		mv.addObject("userClickhistory",true);
		mv.addObject("listhistory",cartService.listhistory());
		return mv;
		
	}
	
	
	
	
	

}
