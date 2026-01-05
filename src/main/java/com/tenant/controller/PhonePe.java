package com.tenant.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PhonePe")
public class PhonePe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String amount = req.getParameter("amount");

        resp.sendRedirect("9-Tenant-DummyPe.jsp?amount=" + amount);
    }
}
