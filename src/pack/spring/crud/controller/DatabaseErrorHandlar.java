package pack.spring.crud.controller;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class DatabaseErrorHandlar {

	@ExceptionHandler(DataAccessException.class)
	public String errorHandler(DataAccessException exp){
		return "dberror";
	}
	
	
	
	
	
}
