package com.employee.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bms.dto.Employee1;
import com.bms.model.EmployeeModel;

@WebServlet("/EmployeeByBuildingCtrl")
public class EmployeeByBuildingCtrl extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Manager ka complete object session me stored hota hai
        Employee1 emp = (Employee1) session.getAttribute("LOGGED_EMP");

        if (session == null || emp == null) {
            response.sendRedirect("4-Login.jsp");
            return;
        }

        // Correct building fetch
        String building = emp.getBuilding();

        EmployeeModel model = new EmployeeModel();
        ArrayList<Employee1> list = model.getEmployeesByBuilding(building);

        request.setAttribute("LIST", list);
        request.getRequestDispatcher("6-Manager-View-Employee.jsp").forward(request, response);
    }
}
