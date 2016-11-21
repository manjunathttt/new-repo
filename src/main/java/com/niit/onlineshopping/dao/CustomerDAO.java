package com.niit.onlineshopping.dao;

import java.util.List;

import com.niit.onlineshopping.model.Customer;

public interface CustomerDAO 
{
	public void addCustomer(Customer customer);
	public Customer getCustomer(int id);
	public void delete(int id);
	public List<Customer> listCustomers();
	
}
