<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<div class="container">
  <div class="content-container">
    <h1 class="movie-list-title">Danh sách phim</h1>
    <div class="movie-list">
      <c:forEach var="movie" items="${movieList}">
        <div class="movie-list-item">
          <div class="movie-image">
            <a href="movieDetail?movieID=${movie.movieID}">
              <img class="movie-list-item-img" src="${pageContext.request.contextPath}/img/${movie.posterURL}" alt="${movie.title}">
            </a>
          </div>
          <div class="movie-info">
            <h3 class="movie-list-item-title">${movie.title}</h3>
            <p class="movie-list-item-desc">${movie.description}</p>
            <div class="movie-buttons">
              <a class="movie-button-link" href="movieDetail?movieID=${movie.movieID}">
                <button class="movie-list-item-button">Chi tiết</button>
              </a>
              <a class="movie-button-link" href="booking?movieID=${movie.movieID}">
                <button class="movie-list-item-button">Đặt vé</button>
              </a>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp" />
