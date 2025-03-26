<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<div class="container">
  <div class="content-container">
    <div class="details-container">
      <div class="left-column">
        <img src="${pageContext.request.contextPath}/img/${movie.posterURL}" alt="${movie.title}">
      </div>
      <div class="right-column">
        <h2>${movie.title}</h2>
        <p><strong>Thể loại:</strong> ${movie.genre}</p>
        <p><strong>Khởi chiếu:</strong> ${movie.releaseDate}</p>
        <p><strong>Thời lượng:</strong> ${movie.duration} phút</p>
        <p><strong>Ngôn ngữ:</strong> ${movie.language}</p>
        <p><strong>Rated:</strong> ${movie.rated}</p>
        <p><strong>Mô tả:</strong> ${movie.description}</p>
        <div>
          <iframe width="560" height="315" src="${movie.trailerURL}" title="Trailer" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
        <a href="booking?movieID=${movie.movieID}">
          <button class="detail-book-button">Đặt vé</button>
        </a>
      </div>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp" />
