package com.bms.hr;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bms.dto.Employee;
import com.bms.model.HRModel;

@WebServlet("/AttendanceCtrl")
public class AttendanceCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    String[] present = request.getParameterValues("present");
	    LocalDate today = LocalDate.now();

	    // HR ki building session se lo
	    String building = (String) request.getSession().getAttribute("building_name");

	    HRModel model = new HRModel();

	    // Sirf HR ki building ke employees
	    List<Employee> employees = model.getUsersByBuilding(building);

	    for (Employee em : employees) {

	        String status = "Absent";

	        if (present != null) {
	            for (String p : present) {
	                if (em.getE_id() == Integer.parseInt(p)) {
	                    status = "Present";
	                }
	            }
	        }

	        // Prevent duplicate
	        if (!model.isAttendanceExists(em.getE_id(), today)) {
	            model.saveAttendance(em.getE_id(), em.getBuilding(), status, today);
	        }
	    }

	    response.sendRedirect("7-HR-AttendanceSuccess.jsp");
	}
}
