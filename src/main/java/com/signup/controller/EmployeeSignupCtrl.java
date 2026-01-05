package com.signup.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bms.model.AdminModel;

@WebServlet("/EmployeeSignupCtrl")
@MultipartConfig
public class EmployeeSignupCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String role = request.getParameter("role");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String contact_no = request.getParameter("contact_no");
		String aadhaar_no = request.getParameter("aadhaar_no");
		Part photo = request.getPart("photo");
		String building_name = request.getParameter("building_name");		
		AdminModel model = new AdminModel();
		int i = model.employeeSignUp(name, email, pwd, contact_no, aadhaar_no, photo, role, building_name);
		
		if (i != 0) {
			response.sendRedirect("4-Login.jsp");
		} else {
			response.sendRedirect("4-error.jsp");
		}	
	}
}
