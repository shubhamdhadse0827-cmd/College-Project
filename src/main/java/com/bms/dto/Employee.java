package com.bms.dto;

public class Employee {
	private int e_id;
	private String name;
	private String email;
	private String role;
	private String contact_no;
	private String aadhaar_no;
	private String building;
	public Employee() {
		super();
		
	}

	public Employee(int e_id, String name, String building, String role) {
		this.e_id = e_id;
		this.name = name;
		this.building = building;
		this.role = role;
	}
	
	public Employee(String name, String email, String role, String contact_no, String aadhaar_no) {
		super();
		this.name = name;
		this.email = email;
		this.role = role;
		this.contact_no = contact_no;
		this.aadhaar_no = aadhaar_no;

	}

	public int getE_id() {
		return e_id;
	}

	public void setE_id(int e_id) {
		this.e_id = e_id;
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

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getContact_no() {
		return contact_no;
	}

	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}

	public String getAadhaar_no() {
		return aadhaar_no;
	}

	public void setAadhaar_no(String aadhaar_no) {
		this.aadhaar_no = aadhaar_no;
	}

	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
	}
}
