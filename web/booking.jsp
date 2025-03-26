<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<%
    // If user is not logged in, redirect to login with a redirect parameter.
    if (session.getAttribute("user") == null) {
        String movieID = request.getParameter("movieID");
        String redirectURL = "booking.jsp" + (movieID != null ? "?movieID=" + movieID : "");
        response.sendRedirect("login.jsp?redirect=" + redirectURL);
        return;
    }
%>
<jsp:include page="header.jsp" />

<div class="container">
  <div class="content-container">
    <h1 style="text-align: center; margin: 20px 0;">Đặt Vé Xem Phim</h1>
    <div class="booking-form-container">
      <form id="bookingForm" action="booking" method="post" class="booking-form">
        <c:if test="${not empty movie}">
          <input type="hidden" name="movieID" value="${movie.movieID}">
          <h3>Phim: ${movie.title}</h3>
        </c:if>
        <div>
          <label for="bookingDate">Chọn ngày:</label>
          <input type="text" id="bookingDate" name="bookingDate" required readonly>
        </div>
        <div>
          <label for="bookingTime">Chọn giờ chiếu:</label>
          <select id="bookingTime" name="bookingTime" required>
            <option value="">--Chọn giờ--</option>
            <option value="08:00">8h sáng</option>
            <option value="13:00">1h chiều</option>
            <option value="16:00">4h chiều</option>
          </select>
        </div>
        <div>
          <label for="ticketQuantity">Số lượng vé:</label>
          <input type="number" id="ticketQuantity" name="ticketQuantity" value="1" min="1" required>
        </div>
        <div>
          <label>Giá vé:</label>
          <p id="priceDisplay" style="font-weight:bold;"></p>
        </div>
        <!-- Payment Section -->
        <h3 style="margin-top:20px;">Thông tin thanh toán</h3>
        <div>
          <label for="cardNumber">Số thẻ tín dụng:</label>
          <input type="tel" id="cardNumber" name="cardNumber" placeholder="XXXX-XXXX-XXXX-XXXX" 
                 oninput="this.value=this.value.replace(/[^0-9]/g,'')" required>
        </div>
        <div>
          <label for="cardName">Tên trên thẻ:</label>
          <input type="text" id="cardName" name="cardName" placeholder="NGUYEN VAN A" required>
        </div>
        <div>
          <label for="expiryDate">Ngày hết hạn (MM/YY):</label>
          <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" 
                 pattern="^(0[1-9]|1[0-2])\/[0-9]{2}$" required>
        </div>
        <div>
          <label for="cvv">CVV:</label>
          <input type="text" id="cvv" name="cvv" placeholder="3 hoặc 4 số" 
                 pattern="^[0-9]{3,4}$" oninput="this.value=this.value.replace(/[^0-9]/g,'')" required>
        </div>
        <button type="submit" class="booking-submit-button">Hoàn tất đặt vé</button>
      </form>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp" />

<!-- Include jQuery UI for the datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script>
  $(document).ready(function(){
    // Initialize datepicker with today's date as default.
    $("#bookingDate").datepicker({
      dateFormat: "dd/mm/yy",
      minDate: 0,
      maxDate: "+30D",
      defaultDate: new Date(),
      showAnim: "slideDown",
      onSelect: function(dateText, inst) {
          updatePrice(dateText);
      }
    });
    
    // Set initial date value and update price if date is already set.
    var initialDate = $("#bookingDate").datepicker("getDate");
    if (initialDate) {
      var formatted = $.datepicker.formatDate("dd/mm/yy", initialDate);
      $("#bookingDate").val(formatted);
      updatePrice(formatted);
    }
    
    // Update price when ticket quantity changes.
    $("#ticketQuantity").on("input", function(){
      var dateText = $("#bookingDate").val();
      if(dateText !== ""){
          updatePrice(dateText);
      }
    });
    
    function updatePrice(dateText) {
      var parts = dateText.split("/");
      if(parts.length < 3) {
        $("#priceDisplay").text("");
        return;
      }
      var day = parseInt(parts[0], 10);
      var month = parseInt(parts[1], 10) - 1;
      var year = parseInt(parts[2], 10) + 2000;
      var selectedDate = new Date(year, month, day);
      var dayOfWeek = selectedDate.getDay(); // Sunday = 0, Saturday = 6
      var basePrice = (dayOfWeek === 0 || dayOfWeek === 6) ? 150000 : 100000;
      var quantity = parseInt($("#ticketQuantity").val(), 10) || 1;
      var totalPrice = basePrice * quantity;
      // Only display price if totalPrice is non-zero.
      if(totalPrice === 0) {
         $("#priceDisplay").text("");
      } else {
         $("#priceDisplay").text(totalPrice.toLocaleString("vi-VN") + " VND");
      }
    }
  });
</script>
