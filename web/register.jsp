<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<div class="register-page">
  <div class="register-background">
    <div class="register-shape"></div>
    <div class="register-shape"></div>
  </div>
  
  <div class="register-glass-container">
    <h3>Register Here</h3>
    <c:if test="${not empty error}">
      <div class="alert">${error}</div>
    </c:if>
    <c:if test="${not empty message}">
      <div class="alert">${message}</div>
    </c:if>
    <form id="registerForm" action="register" method="post">
      <label for="customerName">Name</label>
      <input type="text" id="customerName" name="customerName" placeholder="Enter your name" required>
      
      <label for="phoneNumber">Phone Number</label>
      <input type="text" id="phoneNumber" name="phoneNumber" placeholder="Enter your phone number" required>
      
      <label for="email">Email</label>
      <input type="email" id="email" name="email" placeholder="Enter your email" required>
      
      <label for="password">Password</label>
      <input type="password" id="password" name="password" placeholder="Enter your password" minlength="8" required>
      
      <label for="confirmPassword">Confirm Password</label>
      <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" minlength="8" required>
      
      <label for="address">Address</label>
      <input type="text" id="address" name="address" placeholder="Enter your address">
      
      <button type="submit">Register</button>
    </form>
  </div>
</div>

<!-- Modal for Password Mismatch -->
<div id="passwordErrorModal" class="modal">
  <div class="modal-content">
    <p>Passwords do not match!</p>
    <button id="modalCloseButton">Close</button>
  </div>
</div>

<jsp:include page="footer.jsp" />

<!-- Inline CSS for Modal -->
<style>
  .modal {
    display: none; /* Hidden by default */
    position: fixed;
    z-index: 10000; /* Ensure on top */
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
  }

  .modal-content {
    background-color: #fff;
    margin: 15% auto; /* Center vertically */
    padding: 20px;
    border-radius: 8px;
    width: 80%;
    max-width: 300px;
    text-align: center;
    color: #000;
  }

  .modal-content button {
    margin-top: 15px;
    padding: 8px 16px;
    border: none;
    background-color: #4dbf00;
    color: #fff;
    border-radius: 4px;
    cursor: pointer;
  }
</style>

<!-- JavaScript for Password Matching -->
<script>
  document.getElementById("registerForm").addEventListener("submit", function(e) {
      var pwd = document.getElementById("password").value;
      var confirmPwd = document.getElementById("confirmPassword").value;
      if (pwd !== confirmPwd) {
          e.preventDefault(); // Prevent form submission
          // Display the modal
          document.getElementById("passwordErrorModal").style.display = "block";
      }
  });

  document.getElementById("modalCloseButton").addEventListener("click", function() {
      // Hide the modal when close button is clicked
      document.getElementById("passwordErrorModal").style.display = "none";
  });
</script>
