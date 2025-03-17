package com.jobhub.jobhub.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import com.jobhub.jobhub.services.ApplicationService;

import java.io.IOException;

@WebServlet("/UpdateApplicationServlet")
public class UpdateApplicationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int applicationId = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        try {
            new ApplicationService().updateApplicationStatus(applicationId, status);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("applications.jsp");
    }
}
