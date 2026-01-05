package com.bms.dto;

import java.sql.Timestamp;

public class Employee1 {

    private int e_id;
    private String name;
    private String email;
    private String role;
    private String contact_no;
    private String aadhaar_no;
    private String building;
    private byte[] photo;
    private Timestamp created_at;

    public Employee1() {
        super();
    }

    public Employee1(int e_id, String name, String email, String role,
                    String contact_no, String aadhaar_no, String building, byte[] photo) {
        this.e_id = e_id;
        this.name = name;
        this.email = email;
        this.role = role;
        this.contact_no = contact_no;
        this.aadhaar_no = aadhaar_no;
        this.building = building;
        this.photo = photo;
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

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }
    
    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }
}
