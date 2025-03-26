<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<div class="management-page">
  <div class="management-glass-container">
    <h1>Thêm Phim Mới</h1>
    <c:if test="${not empty message}">
      <div class="alert success">${message}</div>
    </c:if>
    <c:if test="${not empty error}">
      <div class="alert error">${error}</div>
    </c:if>
    
    <form action="addMovie" method="post" enctype="multipart/form-data">
      <label for="title">Tiêu đề:</label>
      <input type="text" id="title" name="title" required>

      <label for="genre">Thể loại:</label>
      <input type="text" id="genre" name="genre" required>

      <label for="releaseDate">Ngày phát hành:</label>
      <input type="date" id="releaseDate" name="releaseDate" required>

      <label for="duration">Thời lượng (phút):</label>
      <input type="number" id="duration" name="duration" required>

      <label for="language">Ngôn ngữ:</label>
      <input type="text" id="language" name="language" required>

      <label for="rated">Xếp hạng:</label>
      <input type="text" id="rated" name="rated" required>

      <label for="description">Mô tả:</label>
      <textarea id="description" name="description" required></textarea>

      <label for="trailerURL">Trailer URL:</label>
      <input type="text" id="trailerURL" name="trailerURL" required>

      <label for="poster">Ảnh bìa (Poster):</label>
      <input type="file" id="poster" name="poster" accept="image/*" required>

      <button type="submit" class="custom-button green">Thêm phim</button>
    </form>

    <a href="manageDashboard.jsp" class="custom-button gray">Quay lại</a>
  </div>
</div>

<jsp:include page="footer.jsp" />
