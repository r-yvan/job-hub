package com.jobhub.jobhub.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.jobhub.jobhub.services.UserService;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String role = request.getParameter("role");

    try {
      boolean success = new UserService().registerUser(username, password, role);
      if (success) {
        response.sendRedirect("login?message=Registration successful");
      } else {
        response.sendRedirect("register?error=Registration failed");
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
