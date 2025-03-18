<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Welcome to JobHub</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }
    .hero {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      text-align: center;
      background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('https://source.unsplash.com/1600x900/?office,work');
      background-size: cover;
      color: white;
    }
    .hero-content {
      max-width: 600px;
      padding: 20px;
    }
    h1 {
      font-size: 3em;
      margin-bottom: 10px;
    }
    p {
      font-size: 1.2em;
      margin-bottom: 20px;
    }
    .btn {
      display: inline-block;
      padding: 12px 25px;
      font-size: 1.2em;
      color: white;
      background: #ff6600;
      text-decoration: none;
      border-radius: 5px;
      margin: 10px;
      transition: 0.3s;
    }
    .btn:hover {
      background: #cc5500;
    }
  </style>
</head>
<body>
<div class="hero">
  <div class="hero-content">
    <h1><%= "Welcome to JobHub!" %></h1>
    <p>Find your dream job or hire top talents effortlessly.</p>
    <a href="login" class="btn">Login</a>
    <a href="register" class="btn">Apply for a Job</a>
  </div>
</div>
</body>
</html>
