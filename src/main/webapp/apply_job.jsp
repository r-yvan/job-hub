<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession, java.sql.*" %>
<%
  HttpSession sessionUser = request.getSession(false);
  String user = (sessionUser != null) ? (String) sessionUser.getAttribute("user") : null;
  if (user == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Apply for Job</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .apply-container {
      background: white;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      text-align: center;
      width: 100%;
      max-width: 400px;
    }

    h2 {
      margin-bottom: 20px;
    }

    label, select, button {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
    }

    select {
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    button {
      background: #ff6600;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: 0.3s;
      font-size: 1.1em;
    }

    button:hover {
      background: #cc5500;
    }
  </style>
</head>
<body>
<div class="apply-container">
  <h2>Apply for a Job</h2>
  <form action="ApplyJobServlet" method="post">
    <label for="jobId">Select Job:</label>
    <select name="jobId" required>
      <%
        try {
          Class.forName("org.postgresql.Driver");
          Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/jobhub", "postgres", "Nry369&2008");
          Statement stmt = conn.createStatement();
          ResultSet rs = stmt.executeQuery("SELECT id, title FROM jobs");
          while (rs.next()) {
      %>
      <option value="<%= rs.getInt("id") %>"><%= rs.getString("title") %>
      </option>
      <%
          }
          conn.close();
        } catch (Exception e) {
          e.printStackTrace();
        }
      %>
    </select>
    <button type="submit">Apply</button>
  </form>
</div>
</body>
</html>