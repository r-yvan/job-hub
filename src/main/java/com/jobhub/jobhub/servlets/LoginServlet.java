package com.jobhub.jobhub.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.jobhub.jobhub.models.User;
import com.jobhub.jobhub.services.UserService;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
      User user = new UserService().authenticate(username, password);

      if (user != null) {
        HttpSession session = request.getSession();
        session.setAttribute("user", user.getUsername());
        session.setAttribute("role", user.getRole());
        response.sendRedirect("overview");
      } else {
        response.sendRedirect("login?error=Invalid credentials");
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
