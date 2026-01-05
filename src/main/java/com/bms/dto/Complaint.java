package com.bms.dto;

public class Complaint {
	private int c_id;
	private int tenantId;
	private String tenantName;
	private String category;
	private String description;
	private String status;
	private String created_at;
	private String updated_at;
	
	public Complaint() {
		super();

	}
	
	public Complaint(int c_id, int tenantId, String tenantName, String category, String description, String status,
			String created_at, String updated_at) {
		super();
		this.c_id = c_id;
		this.tenantId = tenantId;
		this.tenantName = tenantName;
		this.category = category;
		this.description = description;
		this.status = status;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}
	
	
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getTenantId() {
		return tenantId;
	}
	public void setTenantId(int tenantId) {
		this.tenantId = tenantId;
	}
	public String getTenantName() {
		return tenantName;
	}
	public void setTenantName(String tenantName) {
		this.tenantName = tenantName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}
}
