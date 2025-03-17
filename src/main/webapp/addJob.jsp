<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  HttpSession userSession = request.getSession(false);
  String role = (userSession != null) ? (String) userSession.getAttribute("role") : null;

  if (role == null || !role.equals("manager")) {
    response.sendRedirect("error.jsp?message=Unauthorized access. Managers only.");
    return;
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Job</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .container {
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
      width: 400px;
      text-align: center;
    }

    h2 {
      color: #333;
    }

    label {
      font-weight: bold;
      display: block;
      margin-top: 10px;
      text-align: left;
    }

    input, textarea {
      width: calc(100% - 20px);
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 16px;
    }

    textarea {
      resize: none;
    }

    button {
      width: 100%;
      padding: 10px;
      background-color: #ff6600;
      border: none;
      color: white;
      font-size: 18px;
      border-radius: 5px;
      cursor: pointer;
      margin-top: 20px;
      transition: 0.3s;
    }

    button:hover {
      background-color: #e65c00;
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Add New Job</h2>
  <form action="PostJobServlet" method="post">
    <label for="title">Job Title:</label>
    <input type="text" id="title" name="title" required>

    <label for="description">Job Description:</label>
    <textarea id="description" name="description" rows="4" required></textarea>

    <button type="submit">Post Job</button>
  </form>
</div>
</body>
</html>
