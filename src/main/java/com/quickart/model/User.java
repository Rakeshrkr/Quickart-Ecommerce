package com.quickart.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
@Entity
@Table//(name="User")
public class User {
	// @Pattern(regexp="[^0-9]^", message = "Name can not contain digits.")
	@Size(min=3,max=30, message="Please enter a value for Name field between {2} and {1} character." )
	private String fullName ;
	@NotNull
	@Email(message="Please enter valid email address")
	private String email ;
	@Size(min=3, max=7, message="Password must between 3 and 7 characters")
	private String password ;
	@NotEmpty
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private String mobilenumber ;
	@DateTimeFormat(pattern="dd/MM/yyyy") 
	@Past(message="Please enter valid date of birth!")
	private Date birthDate ;
	
	private String country ;
	private String gender ;
	
	public String getMobilenumber() {
		return mobilenumber;
	}
	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
}
