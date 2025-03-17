package com.jobhub.jobhub.servlets;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.jobhub.jobhub.services.ApplicationService;

import java.io.IOException;

@WebServlet("/ApplyJobServlet")
public class
ApplyJobServlet extends HttpServlet {


  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("user") == null) {
      response.sendRedirect("login.jsp");
      return;
    }

    int jobId = Integer.parseInt(request.getParameter("jobId"));
    String user = (String) session.getAttribute("user");

    try {
      new ApplicationService().applyForJob(jobId, user);
    } catch (Exception e) {
      e.printStackTrace();
    }
    response.sendRedirect("dashboard.jsp");
  }
}
