/********************************************
  1) Dark Mode Toggle 
********************************************/
const toggleBall = document.querySelector(".toggle-ball");
const body = document.body;
const togglableItems = document.querySelectorAll(".container, .navbar-container, .menu-list-item, .toggle");

const savedTheme = localStorage.getItem("theme");
if (savedTheme === "dark") {
  body.classList.add("dark-mode");
  if (toggleBall) toggleBall.classList.add("active");
  togglableItems.forEach(item => item.classList.add("active"));
}

if (toggleBall) {
  toggleBall.addEventListener("click", () => {
    body.classList.toggle("dark-mode");
    toggleBall.classList.toggle("active");
    togglableItems.forEach(item => item.classList.toggle("active"));
    if (body.classList.contains("dark-mode")) {
      localStorage.setItem("theme", "dark");
    } else {
      localStorage.setItem("theme", "light");
    }
  });
}

/********************************************
  3) Booking Form Logic & Price Calculation
********************************************/
const bookingDate   = document.getElementById("bookingDate");
const bookingTime   = document.getElementById("bookingTime"); // exists but not used for price
const ticketQuantity = document.getElementById("ticketQuantity");
const bookingForm   = document.getElementById("bookingForm");
const priceDisplay  = document.getElementById("priceDisplay");

// Set up event listeners on the existing JSP elements.
if (bookingDate && ticketQuantity) {
  bookingDate.addEventListener("change", updatePrice);
  ticketQuantity.addEventListener("input", updatePrice);
}

function updatePrice() {
  // Use the bookingDate value (format: dd/mm/yy)
  if (!bookingDate.value) {
    if (priceDisplay) priceDisplay.textContent = "0";
    return;
  }
  const parts = bookingDate.value.split("/");
  if (parts.length < 3) {
    if (priceDisplay) priceDisplay.textContent = "0";
    return;
  }
  const day   = parseInt(parts[0], 10);
  const month = parseInt(parts[1], 10) - 1; // JavaScript month is 0-indexed
  const year  = parseInt(parts[2], 10) + 2000; // Assuming 2-digit year from datepicker
  const selectedDate = new Date(year, month, day);
  const dayOfWeek = selectedDate.getDay(); // Sunday = 0, Saturday = 6
  // Match the pricing logic from booking.jsp: 150,000 on weekends, 100,000 on weekdays.
  const basePrice = (dayOfWeek === 0 || dayOfWeek === 6) ? 150000 : 100000;
  const quantity  = parseInt(ticketQuantity.value, 10) || 1;
  const totalPrice = basePrice * quantity;
  if (priceDisplay) {
    priceDisplay.textContent = totalPrice.toLocaleString("vi-VN") + " VND";
  }
}

/********************************************
  4) Form Submission
********************************************/
if (bookingForm) {
  bookingForm.addEventListener("submit", (e) => {
    e.preventDefault();
    // Update the price one last time in case of any recent changes.
    updatePrice();
    // Now pop up the alert with the total price as computed in the JSP.
    alert("Đặt vé thành công!\nTổng tiền: " + priceDisplay.textContent);
    // Optionally, submit the form after the alert if desired:
    // bookingForm.submit();
  });
}
