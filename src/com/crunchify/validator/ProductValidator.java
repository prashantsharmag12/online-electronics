package com.crunchify.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import net.kzn.shoppingbackend.dto.Product;

public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Product.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub

		
		Product product =(Product)target;
		if(product.getFile()==null || product.getFile().getOriginalFilename().equals(""))
		{
			errors.rejectValue("file", null ,"Please select the image of the product");
			return ;
		}
		if(!(product.getFile().getContentType()!="/image/png" || product.getFile().getContentType()!="/image/jpeg" || product.getFile().getContentType()!="/image/jpg"))
{
			errors.rejectValue("file", null ,"Please select the image only");
			return ;
}
			
	}

}
