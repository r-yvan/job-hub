<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Error</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f8d7da;
      color: #721c24;
      text-align: center;
      padding: 50px;
    }

    .error-container {
      background-color: #f5c6cb;
      padding: 20px;
      border-radius: 5px;
      display: inline-block;
    }

    a {
      display: block;
      margin-top: 20px;
      text-decoration: none;
      color: #721c24;
      font-weight: bold;
    }
  </style>
</head>
<body>
<div class="error-container">
  <h1>Something went wrong!</h1>
  <p><%= exception != null ? exception.getMessage() : "An unexpected error occurred." %>
  </p>
  <a href="index.jsp">Return to Home</a>
</div>
</body>
</html>
