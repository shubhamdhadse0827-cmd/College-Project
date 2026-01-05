package com.bms.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bms.model.AdminModel;
import com.bms.dto.Tenant;

@WebServlet("/TenantData")
public class TenantData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminModel model = new AdminModel();
		ArrayList<Tenant> list = model.getAllTenants();
		RequestDispatcher rd = request.getRequestDispatcher("5-Admin-TenantData.jsp");
		request.setAttribute("LIST", list);
		rd.forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
