<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Tri7 Cinematics</title>
  <!-- Link to your custom CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <!-- Google Fonts & Font Awesome -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&family=Sen:wght@400;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
</head>
<body>
  <!-- Navbar -->
  <div class="navbar">
    <div class="navbar-container">
      <div class="logo-container">
        <h1 class="logo">Tri7 Cinematics</h1>
      </div>
      <div class="menu-container">
        <ul class="menu-list">
          <li class="menu-list-item"><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
          <!-- Additional menu items can be added here -->
        </ul>
      </div>
      <div class="profile-container">
        <c:choose>
          <c:when test="${not empty sessionScope.user}">
            <span class="nav-link">Xin chào, ${sessionScope.user.customerName}</span>
            <a class="logout-btn nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
          </c:when>
          <c:otherwise>
            <button class="login-button" onclick="window.location.href='${pageContext.request.contextPath}/login.jsp'">Login</button>

          </c:otherwise>
        </c:choose>
        
        <div class="toggle">
          <i class="fas fa-moon toggle-icon"></i>
          <i class="fas fa-sun toggle-icon"></i>
          <div class="toggle-ball"></div>
        </div>
      </div>
    </div>
  </div>
