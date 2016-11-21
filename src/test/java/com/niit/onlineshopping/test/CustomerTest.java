package com.niit.onlineshopping.test;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.onlineshopping.dao.CustomerDAO;
import com.niit.onlineshopping.model.Customer;

public class CustomerTest {

	public static void main(String[] args) 
	{
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.niit");
		context.refresh();
		
		CustomerDAO customerDAO = (CustomerDAO)context.getBean("customerDAO");
		Customer customer = (Customer)context.getBean("customer");
		
		customer.setCid(601);
		customer.setCname("SANTOSH");
		customer.setCaddress("RTNGR");
		customer.setCphone(78455);
		
		//customerDAO.addCustomer(customer);
		customerDAO.addCustomer(customer);
	}
}
