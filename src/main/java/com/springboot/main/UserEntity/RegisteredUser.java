package com.springboot.main.UserEntity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="register_user")
public class RegisteredUser {
	
	  @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  private Long id;
	
	  private String userName;
      private String registerEmail;
      private String registerPassword;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRegisterEmail() {
		//System.out.println("get ho raha");
		return registerEmail;
	}

	public void setRegisterEmail(String registerEmail) {
		//System.out.println("Set ho raha");
		this.registerEmail = registerEmail;
	}

	public String getRegisterPassword() {
		return registerPassword;
	}

	public void setRegisterPassword(String registerPassword) {
		this.registerPassword = registerPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

    
}
