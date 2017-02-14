package pack.spring.crud.service;

import java.util.List;

import pack.spring.crud.entity.Customer;

public interface CustomerService {
	
	public Customer getCustomerById(int id);
	public List<Customer> getAllCustomer();
	public Customer getCustomerByEmail(String email);
	public void createCustomer(Customer customer);
	public void deleteCustomerById(int id);
	public List<Customer> getAllAbsoluteCustomer();
}
