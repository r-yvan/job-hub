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
  <title>Job Applications</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background-color: #f4f4f4;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }

    .container {
      background: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      width: 80%;
      max-width: 800px;
    }

    h2 {
      text-align: center;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      padding: 10px;
      border: 1px solid #ddd;
      text-align: left;
    }

    th {
      background-color: #ff6600;
      color: white;
    }

    a {
      text-decoration: none;
      padding: 5px 10px;
      margin: 5px;
      border-radius: 5px;
      color: white;
      display: inline-block;
    }

    .approve {
      background-color: #28a745;
    }

    .reject {
      background-color: #dc3545;
    }

    .approve:hover {
      background-color: #218838;
    }

    .reject:hover {
      background-color: #c82333;
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Job Applications</h2>
  <table>
    <tr>
      <th>Job Title</th>
      <th>Applicant Name</th>
      <th>Status</th>
      <th>Action</th>
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
      <td><%= rs.getString("title") %>
      </td>
      <td><%= rs.getString("employee_name") %>
      </td>
      <td><%= rs.getString("status") %>
      </td>
      <td>
        <a class="approve" href="UpdateApplicationServlet?id=<%= rs.getInt("id") %>&status=Approved">Approve</a>
        <a class="reject" href="UpdateApplicationServlet?id=<%= rs.getInt("id") %>&status=Rejected">Reject</a>
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