package com.profile.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bms.dto.Tenant;

@WebServlet("/ShowTenantPhoto")
public class ShowTenantPhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session == null) return;
		
		Tenant tn = (Tenant) session.getAttribute("LOGGED_TENANT");
		if(tn == null || tn.getPhoto() == null) return;
		
		byte[] img = tn.getPhoto();
		
		response.setContentType("image/jpeg");
		response.getOutputStream().write(img);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
