<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="messages"/>

<html>
<head>
  <title><fmt:message key="register.title"/></title>
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
    .register-container {
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
    input, select {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    button {
      width: 100%;
      padding: 10px;
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
    .language-switcher {
      margin-top: 15px;
    }
    .language-switcher a {
      text-decoration: none;
      margin: 0 10px;
      color: #007bff;
      font-weight: bold;
    }
    .language-switcher a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<div class="register-container">
  <h2><fmt:message key="register.title"/></h2>
  <form action="RegisterServlet" method="post">
    <input type="text" name="username" placeholder="<fmt:message key='register.username' />" required>
    <input type="password" name="password" placeholder="<fmt:message key='register.password' />" required>
    <select name="role">
      <option value="employee"><fmt:message key="register.employee"/></option>
      <option value="manager"><fmt:message key="register.manager"/></option>
    </select>
    <button type="submit"><fmt:message key="register.submit"/></button>
  </form>
  <div class="language-switcher">
    <a href="?lang=en">English</a> | <a href="?lang=fr">Français</a> | <a href="?lang=es">Español</a> | <a href="?lang=de">Deutsch</a>
  </div>
</div>
</body>
</html>
