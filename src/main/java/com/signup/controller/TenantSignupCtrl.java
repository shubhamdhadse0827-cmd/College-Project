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

@WebServlet("/TenantSignupCtrl")
@MultipartConfig
public class TenantSignupCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String contact_no = request.getParameter("contact_no");
		String aadhaar_no = request.getParameter("aadhaar_no");
		Part photo = request.getPart("photo");
		String building = request.getParameter("building_name");
		int flat_no = Integer.parseInt(request.getParameter("flat_no"));
		double rent = Double.parseDouble(request.getParameter("rent"));
		double electricity_bill = Double.parseDouble(request.getParameter("electricity_bill"));

		

		
		AdminModel model = new AdminModel();

		// role ko model me pass karo
		int i = model.tenantSignUp(name, email, pwd, contact_no, aadhaar_no, photo, building, flat_no, rent, electricity_bill);

		if (i != 0) {
			response.sendRedirect("4-Login.jsp");
		} else {
			response.sendRedirect("4-error.jsp");
		}
	}
}
