<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
<!-- BootStrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<%-- 내가 만든 외부 스타일시트 --%>
<link rel="stylesheet" type="text/css"
	href="/css/quiz06/style.css">
</head>
<body>
	<div id="wrap">
		<header>배탈의 민족</header>
		<section>
			<div class="display-4"></div>
			<c:if test="${reviewList.isEmpty()}">
				<div>작성된 리뷰가 없습니다.</div>
			</c:if>
			<c:forEach items="${reviewList}" var="review">
				<div>
					<div>${review.userName}</div>
					<div>${review.point}</div>
					<div>${review.review}</div>
					<div>${review.menu}</div>
				</div>
			</c:forEach>
		</section>
		<footer> </footer>
	</div>

</body>
</html>