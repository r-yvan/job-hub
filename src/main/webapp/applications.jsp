<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession, java.sql.*" %>
<%
  HttpSession sessionMgr = request.getSession(false);
  String mgr = (sessionMgr != null) ? (String) sessionMgr.getAttribute("user") : null;
  if (mgr == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Employment Requests</title>
  <style>
    body {
      font-family: "Helvetica", sans-serif;
      margin: 0;
      padding: 20px;
      background-color: #eef2f3;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }

    .wrapper {
      background: white;
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
      width: 85%;
      max-width: 850px;
    }

    h2 {
      text-align: center;
      color: #333;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 15px;
    }

    th, td {
      padding: 12px;
      border: 1px solid #ccc;
      text-align: left;
    }

    th {
      background-color: #0073e6;
      color: white;
    }

    a {
      text-decoration: none;
      padding: 7px 12px;
      margin: 5px;
      border-radius: 6px;
      color: white;
      display: inline-block;
      transition: 0.3s;
    }

    .confirm {
      background-color: #218838;
    }

    .deny {
      background-color: #c82333;
    }

    .confirm:hover {
      background-color: #1e7e34;
    }

    .deny:hover {
      background-color: #a71d2a;
    }
  </style>
</head>
<body>
<div class="wrapper">
  <h2>Employment Requests</h2>
  <table>
    <tr>
      <th>Position</th>
      <th>Candidate Name</th>
      <th>Application Status</th>
      <th>Options</th>
    </tr>
    <%
      try {
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/jobhub", "postgres", "Nry369&2008");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT a.id, j.title, a.employee_name, a.status FROM job_applications a JOIN jobs j ON a.job_id = j.id");
        while (rs.next()) {
    %>
    <tr>
      <td><%= rs.getString("title") %></td>
      <td><%= rs.getString("employee_name") %></td>
      <td><%= rs.getString("status") %></td>
      <td>
        <a class="confirm" href="UpdateApplicationServlet?id=<%= rs.getInt("id") %>&status=Approved">Confirm</a>
        <a class="deny" href="UpdateApplicationServlet?id=<%= rs.getInt("id") %>&status=Rejected">Deny</a>
      </td>
    </tr>
    <%
        }
        conn.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>
  </table>
</div>
</body>
</html>