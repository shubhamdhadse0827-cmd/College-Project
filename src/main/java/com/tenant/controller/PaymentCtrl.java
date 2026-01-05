package com.tenant.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.bms.model.TenantModel;
import com.bms.dto.Tenant;

@WebServlet("/PaymentCtrl")
public class PaymentCtrl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String amount = request.getParameter("amount");
        String password = request.getParameter("pwd");

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("4-Login.jsp");
            return;
        }

        // Prefer getting Tenant object from session (since you used LOGGED_TENANT earlier)
        Tenant loggedTenant = (Tenant) session.getAttribute("LOGGED_TENANT");
        String email = null;
        if (loggedTenant != null) {
            email = loggedTenant.getEmail();
        } else {
            // fallback to any plain email session attribute if you used it elsewhere
            email = (String) session.getAttribute("email");
        }

        if (email == null) {
            response.sendRedirect("4-Login.jsp");
            return;
        }

        TenantModel tnModel = new TenantModel();
        boolean ok = tnModel.checkUserPassword(email, password);

        System.out.println("DEBUG PaymentCtrl -> email: " + email + ", amount: " + amount + ", ok: " + ok);

        if (ok) {
            // payment success — you can also record transaction in DB here
            response.sendRedirect("9-Tenant-Success.jsp?amount=" + amount);
        } else {
            // on error, pass an error message
            response.sendRedirect("9-Tenant-DummyPe.jsp?amount=" + amount + "&error=Invalid+Password");
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("9-Tenant-DummyPe.jsp");
    }
}
