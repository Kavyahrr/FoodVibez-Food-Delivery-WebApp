package com.tap.model;

import java.sql.Timestamp;

public class User {
	
	private int id;
	private String name;
	private String email;
	private String password;
	private String address;
	private String role;
	private Timestamp created_at;
	private Timestamp last_login_at;
	

	public User( String name, String email, String password, String address, String role) {
		super();
		
		this.name = name;
		this.email = email;
		this.password = password;
		this.address = address;
		this.role = role;
	}

    

	public User(int id, String name, String email, String password, String address, String role,
			Timestamp created_at, Timestamp last_login_at) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.address = address;
		this.role = role;
		this.created_at = created_at;
		this.last_login_at = last_login_at;
	}



	public int getUserId() {
		return id;
	}

	public void setUserId(int userId) {
		this.id = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	

	public Timestamp getCreated_at() {
	    return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
	    this.created_at = created_at;
	}

	public Timestamp getLast_login_at() {
	    return last_login_at;
	}

	public void setLast_login_at(Timestamp last_login_at) {
	    this.last_login_at = last_login_at;
	}

	

	@Override
	public String toString() {
		return "User [userId=" + id + ", name=" + name + ", email=" + email + ", password=" + password
				+ ", address=" + address + ", role=" + role + ", created_at=" + created_at + ", last_login_at="
				+ last_login_at + "]";
	}

	
	
	

}
