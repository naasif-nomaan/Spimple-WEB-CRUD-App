package pack.spring.crud.service;

import java.util.Iterator;
import java.util.List;

import javax.annotation.PostConstruct;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pack.spring.crud.dao.CustomerDAO;
import pack.spring.crud.entity.Customer;

@Service
public class CustomerServiceImpl implements CustomerService{
	
	
	@Autowired
	private CustomerDAO customerDAO;
	
	
	
	@Override
	public Customer getCustomerById(int id) {
	
		return customerDAO.getCustomerById(id);
	}

	@Override
	public List<Customer> getAllCustomer() {
		
		return customerDAO.getAllCustomer();
	}

	@Override
	public Customer getCustomerByEmail(String email) {
		
		return customerDAO.getCustomerByEmail(email);
	}

	@Override
	public void createCustomer(Customer customer) {
		customerDAO.createCustomer(customer);
		
	}

	@Override
	public void deleteCustomerById(int id) {
		customerDAO.deleteCustomerById(id);
		
	}

	@Override
	public List<Customer> getAllAbsoluteCustomer() {
		return customerDAO.getAllAbsoluteCustomer();	
	}

	@Override
	public List<Customer> search(String data) {
		List<Customer> customers= customerDAO.search(data);
		for (Iterator<Customer> iter = customers.listIterator(); iter.hasNext(); ) {
		    Customer a = iter.next();
		    if(a.getEnabled().equals("false")){
		    	iter.remove();
		    }
		    
		}
		return customers;
	}

	@Override
	public List<Customer> searchAll(String data) {
		List<Customer> customers= customerDAO.search(data);
		return customers;
	}
	
	
	
}
