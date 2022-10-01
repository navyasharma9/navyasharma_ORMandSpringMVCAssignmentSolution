package com.customer.manage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.customer.manage.entity.Customer;
import com.customer.manage.services.*;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/list")
	public String findAllCustomer(Map<String, List<Customer>> map)
	{
		List<Customer> customers = customerService.findAllCustomer();
		map.put("customer", customers);
		return "customerlist";
	}
	
	@GetMapping("/showform")
	public String showFormForSave(Model model )
	{
		
		Customer customer = new Customer();
		model.addAttribute(customer);
		return "customerform";
	}
	
	@GetMapping("/edit/{id}")
	public String showFormForSave(Model model, @PathVariable int id )
	{
		
		Customer customer = this.customerService.findCustomerById(id);
		model.addAttribute(customer);
		return "customerform";
	}
	
	@PostMapping("/save")
	public String saveorupdate(Customer customer)
	{
		Customer savedcustomer = null;
		System.out.println(customer);
		if(customer.getId() != 0)
		{
			savedcustomer = customerService.findCustomerById(customer.getId());
			savedcustomer.setFname(customer.getFname());
			savedcustomer.setLname(customer.getLname());
			savedcustomer.setEmail(customer.getEmail());
			System.out.println("if");
		}
		else
			savedcustomer = new Customer(customer.getFname(), customer.getLname(), customer.getEmail());
		this.customerService.saveOrUpdate(savedcustomer);
		return "redirect:list";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id)
	{
		this.customerService.delete(id);
		return "redirect:/customer/list";
	}
	
	@GetMapping("/search")
	public String searchByFnameOrEmail(@RequestParam String fname, 
			@RequestParam String email, Map<String, List<Customer>> map)
	{
		System.out.println(fname);
		System.out.println(email);
		if(fname.trim().isEmpty() && email.trim().isEmpty())
			return "redirect:/cutomer/list";
		
		List<Customer> customers = this.customerService.findCustomerByFnameOrEmail(fname, email);
		map.put("customer", customers);
		return "customerlist";
	}
}
