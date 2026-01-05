package com.tenant.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bms.dto.Tenant;
import com.bms.model.TenantModel;

@WebServlet("/UpdateTenant")
@MultipartConfig
public class UpdateTenant extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		TenantModel model = new TenantModel();
		Tenant tn = model.getATenant(id);
		
		RequestDispatcher rd = request.getRequestDispatcher("6-Manager-Edit.jsp");
		request.setAttribute("tn", tn);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String contact_no = request.getParameter("contact_no");
		String aadhaar_no = request.getParameter("aadhaar_no");
		int flat_no = Integer.parseInt(request.getParameter("flat_no"));
		String building = request.getParameter("building_name");
		
		TenantModel model = new TenantModel();
		Tenant tn = model.getATenant(id);
		
		Part photo = request.getPart("photo");
		InputStream im = null;
		
		if(photo.getSize()>0) {
			im = photo.getInputStream();
		}
		
		Tenant te = new Tenant(name, email, contact_no, aadhaar_no, flat_no, building);
		te.setE_id(id);
		
		int i = model.updateTenant(te, im);
		ArrayList<Tenant> li = model.getAllTenants();
		RequestDispatcher rd = request.getRequestDispatcher("6-Manager-TenantData.jsp");
		
		if(i != 0) {
			request.setAttribute("msg", "Record Update Successfully.....");
			request.setAttribute("LIST", li);
		}
		else {
			request.setAttribute("msg", "Record Not Update Successfully.....");
			request.setAttribute("LIST", li);
		}
		rd.forward(request, response);		
	}
}