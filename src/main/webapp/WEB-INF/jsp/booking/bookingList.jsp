<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<!-- 외부 스타일 시트 -->
<link rel="stylesheet" type="text/css" href="/css/booking/style.css">
</head>
<body>
	<div id="wrap" class="container">
		<header
			class="bg-light d-flex justify-content-center align-items-center">
			<jsp:include page="header.jsp" />
		</header>
		<nav>
			<jsp:include page="nav.jsp" />
		</nav>
		<section class="contents py-4">
			<h2 class="text-center font-weight-bold m-4">예약 목록 보기</h2>
			<table class="table text-center">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${bookingList}" var="booking">
						<tr>
							<td>${booking.name}</td>
							<td><fmt:formatDate value="${booking.date}"
									pattern="yyyy년 M월 d일" /></td>
							<td>${booking.day}</td>
							<td>${booking.headcount}</td>
							<td>${booking.phoneNumber}</td>
							<td><c:choose>
									<c:when test="${booking.state eq '대기중'}">
										<span class="text-info">${booking.state}</span>
									</c:when>
									<c:when test="${booking.state eq '확정'}">
										<span class="text-success">${booking.state}</span>
									</c:when>
									<c:when test="${booking.state eq '취소'}">
										<span class="text-danger">${booking.state}</span>
									</c:when>
								</c:choose></td>
							<td>
								<button type="button" class="del-btn btn btn-danger"
									data-booking-id="${booking.id}">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
		<footer class="d-flex align-items-center pl-3">
			<jsp:include page="footer.jsp" />
		</footer>
	</div>

	<script>
		$(document).ready(function() {
			// 삭제 버튼 클릭
			$(".del-btn").on("click", function() {
				let id = $(this).data('booking-id');

				// AJAX
				$.ajax({
					type : "DELETE",
					url : "/booking/delete-booking",
					data : {
						"id" : id
					},
					success : function(data) {
						// {"code":200, "result":"성공"}
						if (data.result == "성공") {
							alert("id " + id + "번이 삭제되었습니다.");
							location.reload(true);
						} else {
							// {"code":500, "error_message":"삭제하는데 실패했습니다."}
							alert(data.error_message);
						}
					},
					error : function(request, status, error) {
						alert("삭제하는데 실패했습니다. 관리자에게 문의해주세요.");
					}
				})
			})
		})
	</script>
</body>
</html>