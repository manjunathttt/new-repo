package com.niit.onlineshopping.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.niit.onlineshopping.dao.CustomerDAO;
import com.niit.onlineshopping.model.Customer;

@Controller
public class HomeController 
{
	@Autowired
	CustomerDAO customerDAO;
	
	@RequestMapping("/")
	public String getLanding()
	{
		System.out.println("Landing.......");
		return "index";
	}
	
	@RequestMapping("/home")
	public String getHome()
	{
		//System.out.println("Landing.......");
		return "index";
	}
	
	@RequestMapping("/customer")
	public ModelAndView newCustomer(Model m) {
		m.addAttribute("customer", new Customer());
		List<Customer> customers = customerDAO.listCustomers();
		String json = new Gson().toJson(customers);
		ModelAndView model = new ModelAndView("customer");
		model.addObject("customers", json);
		return model;
	}
	
	@RequestMapping(value = "/customer/add",method=RequestMethod.POST)
	public String addCustomer(Model model,@Valid @ModelAttribute("customer") Customer c, BindingResult result) {

		if(result.hasErrors())
			return "customer";
		
		customerDAO.addCustomer(c);
		
		return "redirect:/customer";
	
	}
	
	@RequestMapping("customer/remove/{cid}")
	public String deleteCategory(@PathVariable("cid") int id, ModelMap model) throws Exception {

		try {
			customerDAO.delete(id);
			model.addAttribute("message", "Successfully Deleted");
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}
		// redirectAttrs.addFlashAttribute(arg0, arg1)
		return "redirect:/customer";
	}
	

	@RequestMapping("customer/edit/{cid}")
	public String editCategory(@PathVariable("cid") int id, Model model) {
		System.out.println("editCustomer");
		model.addAttribute("customer", this.customerDAO.getCustomer(id));
		model.addAttribute("customers", this.customerDAO.listCustomers());
		return "customer";
	}
	
}
