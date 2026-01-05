package com.employee.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bms.dto.Employee;
import com.bms.model.EmployeeModel;


@WebServlet("/ManagerEmployeeDetails")
public class ManagerEmployeeDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmployeeModel model = new EmployeeModel();
		ArrayList<Employee> list = model.getAllEmployees();
		RequestDispatcher rd = request.getRequestDispatcher("6-Manager-staffData.jsp");
		request.setAttribute("LIST", list);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
