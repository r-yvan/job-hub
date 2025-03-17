package com.jobhub.jobhub.servlets;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import com.jobhub.jobhub.services.JobService;

@WebServlet("/PostJobServlet")
public class PostJobServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }


        if (!"manager".equals(session.getAttribute("role"))) {
            response.sendRedirect("error.jsp?message=Unauthorized access.");
            return;
        }

        String title = request.getParameter("title");
        String description = request.getParameter("description");

        try {
            new JobService().postJob(title, description);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("dashboard.jsp?message=Job added successfully.");
    }
}