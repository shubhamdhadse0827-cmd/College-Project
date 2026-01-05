package com.bms.complaint;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bms.model.ComplaintModel;


@WebServlet("/UpdateComplaint")
public class UpdateComplaint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int c_id = Integer.parseInt(request.getParameter("c_id"));
		
		ComplaintModel model = new ComplaintModel();
		model.updateStatus(c_id);
		
		response.sendRedirect("6-Manager-Complaints.jsp");
	}
}
