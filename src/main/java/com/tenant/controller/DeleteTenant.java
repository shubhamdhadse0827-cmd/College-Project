package com.tenant.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bms.dto.Tenant;
import com.bms.model.TenantModel;

@WebServlet("/DeleteTenant")
public class DeleteTenant extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		TenantModel model = new TenantModel();
		int i = model.deleteTenant(id);
		
		ArrayList<Tenant> li = model.getAllTenants();
		RequestDispatcher rd = request.getRequestDispatcher("6-Manager-TenantData.jsp");
		
		if(i != 0) {
			request.setAttribute("msg", "Record Deleted Successfully");
			request.setAttribute("LIST", li);
		}
		else {
			request.setAttribute("msg", "Record Not Deleted Successfully");
			request.setAttribute("LIST", li);
		}
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
