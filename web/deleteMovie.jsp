<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<div class="management-page">
  <div class="management-glass-container">
    <h1>Xóa Phim</h1>
    <c:if test="${not empty message}">
      <div class="alert success">${message}</div>
    </c:if>
    <c:if test="${not empty error}">
      <div class="alert error">${error}</div>
    </c:if>

    <table class="custom-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Tiêu đề</th>
          <th>Hành động</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="movie" items="${movieList}">
          <tr>
            <td>${movie.movieID}</td>
            <td>${movie.title}</td>
            <td>
              <form action="deleteMovie" method="post">
                <input type="hidden" name="movieID" value="${movie.movieID}">
                <button type="submit" class="custom-button red">Xóa</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <a href="manageDashboard.jsp" class="custom-button gray">Quay lại</a>
  </div>
</div>

<jsp:include page="footer.jsp" />
