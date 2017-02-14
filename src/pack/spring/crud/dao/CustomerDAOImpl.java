package pack.spring.crud.dao;

import java.util.List;

import javax.annotation.PostConstruct;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pack.spring.crud.entity.Customer;


@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	SessionFactory   sessionFactory;
	
	public CustomerDAOImpl(){
		
	}
	
	
	
	@Override
	@Transactional
	public Customer getCustomerById(int id) {
     Session session= sessionFactory.getCurrentSession();
		Customer customer=session.get(Customer.class, id);
		
	
		return customer;
	}

	


	@Override
	@Transactional
	public List<Customer> getAllCustomer() {
		// get the current hibernate session
				Session currentSession = sessionFactory.getCurrentSession();
				
				// create a query
				Query<Customer> theQuery = currentSession.createQuery("from Customer s  where s.enabled='true'", Customer.class);
					
				// get the result list
				List<Customer> customers = theQuery.getResultList();
				
				
				
		return customers;
	}



	@Override
	@Transactional
	public Customer getCustomerByEmail(String email) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<Customer> theQuery = currentSession.createQuery("from Customer s where s.email='"+email+"'", Customer.class);
				
		Customer customer=theQuery.getSingleResult();
		return customer;
	}



	@Override
	@Transactional
	public void createCustomer(Customer customer) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(customer);
	}



	@Override
	@Transactional
	public void deleteCustomerById(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
     Customer customer=currentSession.get(Customer.class, id);
     currentSession.delete(customer);
		
	}



	@Override
	@Transactional
	public List<Customer> getAllAbsoluteCustomer() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<Customer> theQuery = currentSession.createQuery("from Customer", Customer.class);
			
		// get the result list
		List<Customer> customers = theQuery.getResultList();
		
		
		
    return customers;
	}



	@Override
	@Transactional
	public List<Customer> search(String theSearchName) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = null;
		
		//
		// only search by name if theSearchName is not empty
		//
		if (theSearchName != null && theSearchName.trim().length() > 0) {

			// search for firstName or lastName ... case insensitive
			theQuery =currentSession.createQuery("from Customer where lower(firstName) like :theName or lower(lastName) like :theName", Customer.class);
			theQuery.setParameter("theName", "%" + theSearchName.toLowerCase() + "%");

		}
		else {
			// theSearchName is empty ... so just get all customers
			theQuery =currentSession.createQuery("from Customer", Customer.class);			
		}
		
		// execute query and get result list
		List<Customer> customers = theQuery.getResultList();
				
		// return the results		
		return customers;
	
	
}
	
}
