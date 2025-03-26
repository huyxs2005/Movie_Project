<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<div class="login-page">
  <div class="background">
    <div class="shape"></div>
    <div class="shape"></div>
  </div>
  
  <form action="login" method="post">
    <h3>Login Here</h3>
    <c:if test="${not empty error}">
      <div class="alert">${error}</div>
    </c:if>
    <label for="email">Email</label>
    <input type="email" id="email" name="email" placeholder="Enter your email" required>
    
    <label for="password">Password</label>
    <input type="password" id="password" name="password" placeholder="Enter your password" required>
    
    <button type="submit">Log In</button>
    
    <div class="social">
      <button type="button" onclick="window.location.href='register.jsp'">Register</button>
    </div>
  </form>
</div>

<jsp:include page="footer.jsp" />
