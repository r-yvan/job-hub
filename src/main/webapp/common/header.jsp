<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 3/3/2025
  Time: 7:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession userSession = request.getSession(false);
    String user = (userSession != null) ? (String) userSession.getAttribute("user") : null;
    String role = (userSession != null) ? (String) userSession.getAttribute("role") : null;
%>

<nav>
    <ul>
        <li><a href="dashboard.jsp">Home</a></li>
        <% if (role != null && role.equals("manager")) { %>

        <li><a href="applications.jsp">Job Applications</a></li>
        <li><a href="addJob.jsp">Add New Job</a></li>
        <% } else if (role != null && role.equals("employee")) { %>
        <li><a href="apply_job.jsp">Apply for Job</a></li>
        <li><a href="my_applications.jsp">My Applications</a></li>
        <% } %>
        <% if (user != null) { %>
        <li><a href="LogoutServlet">Logout</a></li>
        <% } else { %>
        <li><a href="login.jsp">Login</a></li>
        <% } %>
    </ul>
</nav>
