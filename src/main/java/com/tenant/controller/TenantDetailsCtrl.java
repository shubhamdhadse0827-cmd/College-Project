package com.tenant.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bms.dto.Tenant;
import com.bms.model.TenantModel;

@WebServlet("/TenantDetailsCtrl")
public class TenantDetailsCtrl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Manager ka building type session me se
        String buildingType = (String) session.getAttribute("building_name");

        // Safety check
        if (buildingType == null || buildingType.trim().isEmpty()) {
            request.setAttribute("error", "Building type not found in session!");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        // Model call
        TenantModel model = new TenantModel();
        ArrayList<Tenant> list = model.getTenantsByBuilding(buildingType);

        // List JSP me bhejna
        request.setAttribute("LIST", list);

        RequestDispatcher rd = request.getRequestDispatcher("6-Manager-TenantData.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
