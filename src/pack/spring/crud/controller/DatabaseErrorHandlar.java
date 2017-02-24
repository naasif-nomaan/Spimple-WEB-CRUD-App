package pack.spring.crud.controller;

import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

@ControllerAdvice
public class DatabaseErrorHandlar {

	@ExceptionHandler(DataAccessException.class)
	public String errorHandler(DataAccessException exp){
		System.out.println("Databse error");
		return "dberror";
	}
	
	
	
	
	
}
