package pack.spring.crud.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.spring.crud.dao.CustomerDAO;
import pack.spring.crud.entity.Customer;
import pack.spring.crud.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;
	
	
	
	
	@GetMapping("/customermanagement")
	public String showManagement(){
		
		return "CustomerManagement";
	}
	
	@GetMapping("/createcustomer")
	public String showCreate(Model model){
		model.addAttribute("customer", new Customer());
		return "newCustomer";
	}
	@GetMapping("/editcustomer")
	public String editCustomerPage(Model model){
		model.addAttribute("customers",customerService.getAllAbsoluteCustomer());
		return "editcustomer";
	}
	
	@PostMapping("/create")
	public String creteCustomer(@ModelAttribute("customer") Customer theCustomer, Model model){
		
		
	
	
			customerService.createCustomer(theCustomer);
			model.addAttribute("customers",customerService.getAllCustomer());
			return "index";
		
	}
	@PostMapping("/update")
	public String updateCustomer(@ModelAttribute("customer") Customer theCustomer, Model model){
		
		
	
	
			customerService.createCustomer(theCustomer);
			model.addAttribute("customers",customerService.getAllAbsoluteCustomer());
			return "editcustomer";
		
	}
	
	@GetMapping("/editcustomerby")
	public String editCustomer(@RequestParam("customerId") int id, Model model){
		
		Customer customer=customerService.getCustomerById(id);
		
		model.addAttribute("customer",customer);
		
		return "update";
	}
	@GetMapping("/deleteLink")
	public String deleteCustomer(@RequestParam("customerId") int id,Model model){
		customerService.deleteCustomerById(id);
		model.addAttribute("customers",customerService.getAllAbsoluteCustomer());
		return "editcustomer";
	}
	
	
	
}
