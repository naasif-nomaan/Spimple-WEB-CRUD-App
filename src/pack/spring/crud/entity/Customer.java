package pack.spring.crud.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.xml.ws.soap.Addressing;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Range;
import org.jboss.logging.Message;

@Entity
@Table(name="customer")
public class Customer {
	
	@Id
	@Column(name="id")
	private int id;
	
	@Column(name="first_name")
	@NotNull
	@Size(min=3, max=100,message="first name must be between 3 to 100 char")
	private String firstName;
	
	@Column(name="last_name")
	@NotNull
	@Size(min=3, max=100,message="last name must be between 3 to 100 char")
	private String lastName;
	
	@Column(name="email")
	@Email(regexp=".*\\@.*\\..*" , message="Not avalid email address")
	private String email;
	
	@Column(name="address")
	@NotNull
	@Size(min=10, max=250,message="Address should be between 10 to 250 char")
	private String address;
	
	@Column(name="mobile_no")
	@Mobile
	@NotNull
	@Size(min=1, message="Mobile Number Shouldn't be empty")
	@Pattern(regexp="(^$|[0-9]{11})", message="please enter a valid mobile number and it must be 11 digits")
	private String mobile_no;
	
	@Column(name="enabled")
	private String enabled;
	
	
	public Customer(){
		
		
	}


	public Customer(String firstName, String lastName, String email,  String mobile_no,String address, String enabled) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
		this.mobile_no = mobile_no;
		this.enabled = enabled;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getMobile_no() {
		return mobile_no;
	}


	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}


	public String getEnabled() {
		return enabled;
	}


	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}


	@Override
	public String toString() {
		return "Customer [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", address=" + address + ", mobile_no=" + mobile_no + ", enabled=" + enabled + "]";
	}
	
	
	

}
