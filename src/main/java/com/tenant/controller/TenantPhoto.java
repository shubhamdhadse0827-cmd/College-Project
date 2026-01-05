package com.tenant.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bms.model.TenantModel;

@WebServlet("/TenantPhoto")
public class TenantPhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		TenantModel model = new TenantModel();
		byte[]photo = model.getphoto(id);
		if(photo != null)
		{
			ServletOutputStream sos = response.getOutputStream();
			sos.write(photo);
		}
	}
}
