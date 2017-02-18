package pack.spring.crud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.spring.crud.dao.CustomerDAO;
import pack.spring.crud.service.CustomerService;

@Controller
public class HomeController {
	@Autowired
	CustomerService customerService; // Customer Service
		
	
	
	@GetMapping("/")
	public String showHome(Model model){
		model.addAttribute("customers",customerService.getAllCustomer());
		return "index";
	}
	@GetMapping("/about")
	public String showAbout(Model model){
		
		return "about";
	}
	
	@PostMapping("/search")
	public String search(@RequestParam("theSearchName")String data, Model model){
		
		model.addAttribute("customers", customerService.search(data));
		
		return "search";
	}
	@PostMapping("/searchall")
	public String searchall(@RequestParam("theSearchName")String data, Model model){
		
		model.addAttribute("customers", customerService.searchAll(data));
		
		return "searchall";
	}

}
