/********************************************
  1) Dark Mode Toggle 
*********************************************/
const ball = document.querySelector(".toggle-ball");
const body = document.body;
// Items that get .active toggled
const items = document.querySelectorAll(
  ".container, .movie-list-title, .navbar-container, .toggle"
);

// On page load, read localStorage for theme
const savedTheme = localStorage.getItem("theme");
if (savedTheme === "dark") {
  body.classList.add("dark-mode");
  if (ball) ball.classList.add("active");
  items.forEach((item) => item.classList.add("active"));
}

// Single event listener for toggling dark/light mode
if (ball) {
  ball.addEventListener("click", () => {
    body.classList.toggle("dark-mode");
    ball.classList.toggle("active");
    items.forEach((item) => item.classList.toggle("active"));

    // Save the current theme in localStorage
    if (body.classList.contains("dark-mode")) {
      localStorage.setItem("theme", "dark");
    } else {
      localStorage.setItem("theme", "light");
    }
  });
}

/********************************************
  2) Generate next 7 days showtimes
*********************************************/
function getNextWeekShowtimes() {
  const times = ["09:30", "12:00", "14:30", "17:00", "19:30", "21:00"];
  const result = [];
  const today = new Date();

  // Generate for next 7 days
  for (let i = 0; i < 7; i++) {
    const day = new Date(
      today.getFullYear(),
      today.getMonth(),
      today.getDate() + i
    );
    const dd = String(day.getDate()).padStart(2, "0");
    const mm = String(day.getMonth() + 1).padStart(2, "0");

    // For each day, push multiple time slots
    times.forEach((time) => {
      result.push(`${dd}/${mm} ${time}`);
    });
  }
  return result;
}

// We'll assign the same times for each movie
const universalShowtimes = getNextWeekShowtimes();

const showtimes = {
  "Captain America: Brave New World": [...universalShowtimes],
  "Flow (Lạc Trôi)": [...universalShowtimes],
  "Flight Risk (Cuộc Đào Tẩu Trên Không)": [...universalShowtimes],
  "Interstellar (CHIẾU LẠI)": [...universalShowtimes],
};

/********************************************
  3) Booking form logic
*********************************************/
const movieSelect = document.getElementById("movieSelect");
const dateTimeSelect = document.getElementById("dateTimeSelect");
const ticketAmount = document.getElementById("ticketAmount");
const bookingForm = document.getElementById("bookingForm");
const priceDisplay = document.getElementById("priceDisplay");

// Populate showtimes upon user selecting a movie
if (movieSelect && dateTimeSelect) {
  movieSelect.addEventListener("change", () => {
    // Reset dateTimeSelect
    dateTimeSelect.innerHTML = "<option value=''>dd/mm hh:mm</option>";

    const selectedMovie = movieSelect.value;
    if (selectedMovie && showtimes[selectedMovie]) {
      showtimes[selectedMovie].forEach((timeOption) => {
        const option = document.createElement("option");
        option.value = timeOption;
        option.textContent = timeOption;
        dateTimeSelect.appendChild(option);
      });
    }
    updatePrice();
  });
}

// Also recalc price if user changes date/time or ticket count
if (dateTimeSelect) {
  dateTimeSelect.addEventListener("change", updatePrice);
}
if (ticketAmount) {
  ticketAmount.addEventListener("input", updatePrice);
}

/********************************************
  4) Price Calculation (weekday vs. weekend)
     Weekday => 60,000 đ
     Weekend => 80,000 đ
*********************************************/
function updatePrice() {
  // If dateTimeSelect not chosen or empty => 0
  if (!dateTimeSelect.value) {
    priceDisplay.textContent = "0";
    return;
  }

  // Parse day from "DD/MM HH:MM"
  const [dayPart, timePart] = dateTimeSelect.value.split(" ");
  const [dd, mm] = dayPart.split("/");
  const today = new Date();
  // We'll assume current year for all showtimes
  const showDate = new Date(today.getFullYear(), Number(mm) - 1, Number(dd));

  // Check dayOfWeek => 0=Sunday, 6=Saturday => weekend
  const dayOfWeek = showDate.getDay(); 
  const isWeekend = (dayOfWeek === 0 || dayOfWeek === 6);

  const pricePerTicket = isWeekend ? 80000 : 60000;
  const quantity = ticketAmount.value ? Number(ticketAmount.value) : 1;
  const totalPrice = pricePerTicket * quantity;

  priceDisplay.textContent = totalPrice.toLocaleString("vi-VN");
}

/********************************************
  5) Form submission
*********************************************/
if (bookingForm) {
  bookingForm.addEventListener("submit", (e) => {
    e.preventDefault();
    // Possibly run updatePrice() again to confirm final total
    updatePrice();
    alert("Đặt vé thành công!\nTổng tiền: " + priceDisplay.textContent + " đ");
    // Or redirect to a success page, etc.
  });
}
