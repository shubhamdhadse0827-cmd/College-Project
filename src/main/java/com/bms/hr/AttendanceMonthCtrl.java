package com.bms.hr;

import java.io.IOException;
import java.time.YearMonth;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bms.dto.Employee;
import com.bms.model.HRModel;

@WebServlet("/AttendanceMonthCtrl")
public class AttendanceMonthCtrl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ❌ user_id हटाया क्योंकि उसकी जरूरत नहीं
        int month = Integer.parseInt(request.getParameter("month"));
        int year = Integer.parseInt(request.getParameter("year"));

        HttpSession session = request.getSession(false);
        String building = (session != null) ? (String) session.getAttribute("building_name") : null;

        HRModel model = new HRModel();
        
        // building के employees की list
        List<Employee> empList = model.getUsersByBuilding(building);

        // attendance map: empId -> (day -> status)
        Map<Integer, Map<Integer, String>> attendanceMap = new HashMap<>();
        for (Employee emp : empList) {
            Map<Integer, String> monthly = model.getMonthlyAttendanceMap(emp.getE_id(), month, year);
            attendanceMap.put(emp.getE_id(), monthly);
        }

        // month me total days
        YearMonth ym = YearMonth.of(year, month);
        int totalDays = ym.lengthOfMonth();

        request.setAttribute("empList", empList);
        request.setAttribute("attendanceMap", attendanceMap);
        request.setAttribute("month", month);
        request.setAttribute("year", year);
        request.setAttribute("totalDays", totalDays);

        request.getRequestDispatcher("7-HR-MonthlyAttendance.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("7-HR-MonthlyAttendance.jsp").forward(request, response);
    }
}
