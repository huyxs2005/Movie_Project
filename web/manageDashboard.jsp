<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (session.getAttribute("manager") == null) {
        response.sendRedirect("login.jsp?redirect=manageDashboard.jsp");
        return;
    }
%>
<jsp:include page="header.jsp" />

<div class="management-page">
  <div class="management-glass-container">
    <h1>Quản Lý Phim</h1>
    <div class="button-group">
      <a href="addMovie.jsp" class="custom-button green">Thêm Phim Mới</a>
      <a href="adminMovies" class="custom-button red">Xóa Phim</a>
      <a href="${pageContext.request.contextPath}/logout" class="custom-button gray">Đăng Xuất</a>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp" />
