package com.bms.complaint;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bms.dto.Complaint;
import com.bms.model.ComplaintModel;


@WebServlet("/AddComplaints")
public class AddComplaints extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tenantId = Integer.parseInt(request.getParameter("tenant_id"));
		String tenantName = request.getParameter("tenant_name");
		String category = request.getParameter("category");
		String description = request.getParameter("description");
		
		Complaint cm = new Complaint();
		cm.setTenantId(tenantId);
		cm.setTenantName(tenantName);
		cm.setCategory(category);
		cm.setDescription(description);
		
		ComplaintModel model = new ComplaintModel();
		model.addComplaint(cm);
		
		response.sendRedirect("9-Complaint-Success.jsp");
	}

}
