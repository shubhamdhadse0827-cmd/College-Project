package com.bms.dto;

import java.sql.Timestamp;

public class Tenant {
	private int e_id;
	private String name;
	private String email;
	private String pwd;
	private String role;
	private String contact_no;
	private String aadhaar_no;
	private String building;
	private int flat_no;
	private double rent;
	private double eb;
	private byte[] photo;
	private Timestamp created_at;
	public Tenant() {

	}

	

	public String getPwd() {
		return pwd;
	}



	public Timestamp getCreated_at() {
		return created_at;
	}



	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}



	public void setPwd(String pwd) {
		this.pwd = pwd;
	}



	public Tenant(int e_id, String name, String email, String pwd, String role, String contact_no, String aadhaar_no,
			String building, int flat_no, double rent, double eb, byte[] photo) {
		super();
		this.e_id = e_id;
		this.name = name;
		this.email = email;
		this.pwd = pwd;
		this.role = role;
		this.contact_no = contact_no;
		this.aadhaar_no = aadhaar_no;
		this.building = building;
		this.flat_no = flat_no;
		this.rent = rent;
		this.eb = eb;
		this.photo = photo;
	}
	
	public Tenant(int e_id, String name, String email, String role, String contact_no,
			byte[] photo, String building, int flat_no) {
		this.e_id = e_id;
		this.name = name;
		this.email = email;
		this.role = role;
		this.contact_no = contact_no;
		this.photo = photo;
		this.building = building;
		this.flat_no = flat_no;
	}
	
	public Tenant(String name, String email, String contact_no, String aadhaar_no, int flat_no, String building) {
		this.name = name;
		this.email =email;
		this.contact_no = contact_no;
		this.aadhaar_no = aadhaar_no;
		this.flat_no = flat_no;
		this.building = building;
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

	public double getRent() {
		return rent;
	}

	public void setRent(double rent) {
		this.rent = rent;
	}
	
	public double getEb() {
		return eb;
	}

	public void setEb(double eb) {
		this.eb = eb;
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

	public int getFlat_no() {
		return flat_no;
	}

	public void setFlat_no(int flat_no) {
		this.flat_no = flat_no;
	}

	

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}
}
