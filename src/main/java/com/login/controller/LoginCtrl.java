package com.login.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.bms.model.AdminModel;
import com.bms.model.ProfileModel;
import com.bms.dto.Employee1;
import com.bms.dto.Tenant;

@WebServlet("/LoginCtrl")
public class LoginCtrl extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String role = request.getParameter("role");
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");

        AdminModel model = new AdminModel();
        int userId = model.checklogin(role, email, pwd);

        if (userId != 0) {

            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("role", role);
            session.setAttribute("user_id", userId);

            ProfileModel pm = new ProfileModel();

            if (role.equalsIgnoreCase("tenant")) {
                Tenant tn = pm.getTenantById(userId);
                session.setAttribute("LOGGED_TENANT", tn);

                // ⭐ Correct building from DB
                session.setAttribute("building_name", tn.getBuilding());

                response.sendRedirect("9-Tenant-Dashboard.jsp");
                return;

            } else {
                Employee1 emp = pm.getEmployeeById(userId);
                session.setAttribute("LOGGED_EMP", emp);

                // ⭐ Correct building from DB
                session.setAttribute("building_name", emp.getBuilding());
            }

            // Redirect role-based
            switch (role.toLowerCase()) {
                case "admin":
                    response.sendRedirect("5-Admin-Dashboard.jsp");
                    break;
                case "manager":
                    response.sendRedirect("6-Manager-Dashboard.jsp");
                    break;
                case "hr":
                    response.sendRedirect("7-HR-Dashboard.jsp");
                    break;
                case "accountant":
                    response.sendRedirect("8-Accountant-Dasboard.jsp");
                    break;
                case "staff":
                    response.sendRedirect("10-Staff-Dashboard.jsp");
                    break;
                default:
                    response.sendRedirect("default-dashboard.jsp");
            }

        } else {
            request.setAttribute("msg", "Incorrect Email or Password!");
            request.getRequestDispatcher("/4-Login.jsp").forward(request, response);
        }
    }
}
