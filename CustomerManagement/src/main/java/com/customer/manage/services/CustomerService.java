package com.customer.manage.services;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import com.customer.manage.entity.Customer;


@Service
public class CustomerService
{
	private SessionFactory factory;
	private Session session;
	public CustomerService(SessionFactory factory)
	{
		System.out.println("Customer services");
		// TODO Auto-generated constructor stub
		this.factory = factory;
		try {
			this.session = factory.getCurrentSession();
		}
		catch(Exception e)
		{
			this.session = factory.openSession();
		}
		System.out.println("session created");
		System.out.println(this.session);
	}
	
	@Transactional
	public void saveOrUpdate(Customer customer)
	{
		System.out.println("save "+customer);
		Transaction tx = session.beginTransaction();

		session.saveOrUpdate(customer);

		tx.commit();
	}

	@Transactional
	public Customer findCustomerById(int id) 
	{
		Transaction tx = session.beginTransaction();

		Customer customer = session.get(Customer.class, id);

		tx.commit();
		return customer;
	}

	@Transactional
	public boolean delete(int id) 
	{
		try {
			Transaction tx = session.beginTransaction();

			Customer customer = session.get(Customer.class, id);
			session.delete(customer);

			tx.commit();
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	@Transactional
	public List<Customer> findAllCustomer()
	{
		Transaction tx = session.beginTransaction();
		
		List<Customer> customers = session.createQuery("from Customer").list();
				
		tx.commit();
		return  customers;
	}
	
	@Transactional
	public List<Customer> findCustomerByFnameOrEmail(String fname, String email)
	{
		String query = "";
		if (fname.length() != 0 && email.length() != 0)
			query = "from Customer where fname like '%" + fname + "%' or email like '%" + email + "%'";
		else if (fname.length() != 0)
			query = "from Customer where fname like '%" + fname + "%'";
		else if (email.length() != 0)
			query = "from Customer where email like '%" + email + "%'";
		else {
			System.out.println("cannot search as fname and email both are empty");
			return null;
		}
		List<Customer> customers = session.createQuery(query).list();
		return customers;
	}

}
