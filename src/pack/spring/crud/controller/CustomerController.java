package pack.spring.crud.controller;

import java.util.Iterator;
import java.util.List;

import javax.validation.Valid;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.org.apache.bcel.internal.generic.NEW;
import com.sun.xml.internal.org.jvnet.staxex.NamespaceContextEx.Binding;

import pack.spring.crud.dao.CustomerDAO;
import pack.spring.crud.entity.Customer;
import pack.spring.crud.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;

	@GetMapping("/customermanagement")
	public String showManagement() {

		return "CustomerManagement";
	}

	@GetMapping("/createcustomer")
	public String showCreate(Model model) {
		model.addAttribute("customer", new Customer());
		return "newCustomer";
	}

	@GetMapping("/editcustomer")
	public String editCustomerPage(Model model) {
		model.addAttribute("customers", customerService.getAllAbsoluteCustomer());
		return "editcustomer";
	}

	@PostMapping("/create")
	public String creteCustomer(Model model, @Valid @ModelAttribute("customer") Customer theCustomer,
			BindingResult result) {

		if (result.hasErrors()) {

			return "newCustomer";

		}

		// checking email address is already exists or not
		for (Iterator<Customer> itarator = customerService.getAllAbsoluteCustomer().listIterator(); itarator
				.hasNext();) {
			Customer c = itarator.next();
			if (c.getEmail().equals(theCustomer.getEmail())) {

				if (c.getEnabled().equals("true")) {
					result.rejectValue("email", "ExistEmail.customer.email");
					return "newCustomer";
				} else {
					result.rejectValue("email", "ExistEmailD.customer.email");
					return "newCustomer";
				}

			}
		}

		customerService.createCustomer(theCustomer);
		model.addAttribute("customers", customerService.getAllCustomer());
		return "index";

	}

	@PostMapping("/update")
	public String updateCustomer(Model model, @Valid @ModelAttribute("customer") Customer theCustomer,
			BindingResult result) {

		if (result.hasErrors()) {

			return "update";

		}

		customerService.createCustomer(theCustomer);
		model.addAttribute("customers", customerService.getAllAbsoluteCustomer());
		return "editcustomer";

	}

	@GetMapping("/editcustomerby")
	public String editCustomer(@RequestParam("customerId") int id, Model model) {

		Customer customer = customerService.getCustomerById(id);

		model.addAttribute("customer", customer);

		return "update";
	}

	@GetMapping("/deleteLink")
	public String deleteCustomer(@RequestParam("customerId") int id, Model model) {
		customerService.deleteCustomerById(id);
		model.addAttribute("customers", customerService.getAllAbsoluteCustomer());
		return "editcustomer";
	}

}
