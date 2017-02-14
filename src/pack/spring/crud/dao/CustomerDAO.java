package pack.spring.crud.dao;

import java.util.List;

import pack.spring.crud.entity.Customer;

public interface CustomerDAO {
	
	
	public Customer getCustomerById(int id);
	public List<Customer> getAllCustomer();
	public List<Customer> getAllAbsoluteCustomer();
	public Customer getCustomerByEmail(String email);
	public void createCustomer(Customer customer);
	public void deleteCustomerById(int id);
	
	

}
