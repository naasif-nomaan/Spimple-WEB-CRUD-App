package pack.spring.crud.controller;

import java.util.Set;

import javax.validation.ConstraintViolation;

import javax.validation.executable.ExecutableValidator;
import javax.validation.metadata.BeanDescriptor;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import pack.spring.crud.entity.Customer;

public class Customervalidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return Customer.class.equals(arg0);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		Customer customer = (Customer) obj;

		if (customer.getFirstName() == "") {
			errors.rejectValue("firstName", "first name shouldn't be empty");
		}

	}

}
