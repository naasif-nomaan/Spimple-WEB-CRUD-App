package pack.spring.crud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import pack.spring.crud.dao.CustomerDAO;
import pack.spring.crud.service.CustomerService;

@Controller
public class HomeController {
	@Autowired
	CustomerService customerService;
		
	
	
	@GetMapping("/")
	public String showHome(Model model){
		model.addAttribute("customers",customerService.getAllCustomer());
		return "index";
	}
	@GetMapping("/about")
	public String showAbout(Model model){
		
		return "about";
	}

}
