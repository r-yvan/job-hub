<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="messages"/>

<%
  HttpSession userSession = request.getSession(false);
  String user = (userSession != null) ? (String) userSession.getAttribute("user") : null;
  String role = (userSession != null) ? (String) userSession.getAttribute("role") : null;

  if (user == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>

<html>
<head>
  <title><fmt:message key="dashboard.title"/></title>
  <!-- Import Roboto font from Google Fonts for modern typography -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <!-- Import Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      margin: 0;
      padding: 0;
      /* Subtle gradient background for depth */
      background: linear-gradient(to bottom, #e6f7ff, #ffffff);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .dashboard-container {
      background: #ffffff;
      padding: 40px;
      border-radius: 10px;
      /* Stronger shadow for a floating effect */
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      text-align: center;
      width: 100%;
      max-width: 600px;
      position: relative;
    }

    /* Logout link styling */
    .logout-link {
      text-align: right;
      margin-bottom: 20px;
    }

    .logout-link a {
      color: #007bff;
      text-decoration: none;
      font-weight: bold;
    }

    .logout-link a:hover {
      text-decoration: underline;
    }

    h1 {
      font-size: 2.5em;
      color: #333;
      margin-bottom: 20px;
    }

    h2 {
      font-size: 1.8em;
      color: #007bff;
      margin-bottom: 15px;
    }

    p {
      font-size: 1.2em;
      color: #555;
      margin-bottom: 20px;
    }

    /* Style the action list */
    .action-buttons {
      list-style: none;
      padding: 0;
    }

    .action-buttons li {
      margin: 10px 0;
    }

    .action-buttons a {
      display: block;
      max-width: 300px;
      margin: 0 auto 10px auto;
      padding: 10px 20px;
      background-color: #007bff;
      color: #ffffff;
      text-decoration: none;
      border-radius: 5px;
      font-weight: bold;
      /* Smooth transitions for hover effects */
      transition: all 0.3s;
    }

    .action-buttons a:hover {
      background-color: #0056b3;
      /* Slight scale-up on hover for interactivity */
      transform: scale(1.05);
    }

    .action-buttons a i {
      margin-right: 10px; /* Space between icon and text */
    }

    .language-switcher {
      margin-top: 30px;
    }

    .language-switcher a {
      margin: 0 10px;
      color: #007bff;
      text-decoration: none;
      font-size: 0.9em;
    }

    .language-switcher a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<div class="dashboard-container">
  <!-- Added logout link at the top right -->
  <div class="logout-link">
    <a href="logout.jsp"><fmt:message key="dashboard.logout"/></a>
  </div>

  <h1><fmt:message key="dashboard.welcome"><fmt:param value="<%= user %>"/></fmt:message></h1>

  <% if ("manager".equals(role)) { %>
  <h2><fmt:message key="dashboard.manager.title"/></h2>
  <p><fmt:message key="dashboard.manager.manage_jobs"/></p>
  <ul class="action-buttons">
    <li><a href="manage_jobs.jsp"><i class="fas fa-briefcase"></i> <fmt:message key="dashboard.manager.manage_jobs"/></a></li>
    <li><a href="applications.jsp"><i class="fas fa-eye"></i> <fmt:message key="dashboard.manager.view_applications"/></a></li>
  </ul>
  <% } else if ("employee".equals(role)) { %>
  <h2><fmt:message key="dashboard.employee.title"/></h2>
  <p><fmt:message key="dashboard.employee.apply"/></p>
  <ul class="action-buttons">
    <li><a href="apply_job.jsp"><i class="fas fa-paper-plane"></i> <fmt:message key="dashboard.employee.apply"/></a></li>
    <li><a href="applications.jsp"><i class="fas fa-user"></i> <fmt:message key="dashboard.employee.applications"/></a></li>
  </ul>
  <% } %>

  <div class="language-switcher">
    <a href="?lang=en">English</a>
    <a href="?lang=fr">Français</a>
    <a href="?lang=es">Español</a>
    <a href="?lang=de">Deutsch</a>
  </div>
</div>
</body>
</html>