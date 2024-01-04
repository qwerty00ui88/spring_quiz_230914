<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 하기</title>
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
<!-- datepicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
			<div class="d-flex justify-content-center">
				<div class="booking-box">
					<div class="subject-text my-2 font-weight-bold">이름</div>
					<input type="text" class="form-control" id="name">

					<div class="subject-text my-2 font-weight-bold">예약날짜</div>
					<input type="text" class="form-control" id="date">

					<div class="subject-text my-2 font-weight-bold">숙박일수</div>
					<input type="text" class="form-control" id="day">

					<div class="subject-text my-2 font-weight-bold">숙박인원</div>
					<input type="text" class="form-control" id="headcount">

					<div class="subject-text my-2 font-weight-bold">전화번호</div>
					<input type="text" class="form-control" id="phoneNumber" placeholder="010-0000-0000">

					<button type="button" id="makeBookingBtn"
						class="btn btn-warning w-100 mt-3">예약하기</button>
				</div>
			</div>
		</section>
		<footer class="d-flex align-items-center pl-3">
			<jsp:include page="footer.jsp" />
		</footer>
	</div>
	<script>
		$(document).ready(function() {
			// 날짜 선택
			$("#date").datepicker({
				minDate:0
				, dateFormat: "yy-mm-dd"
				});
			
			$("#makeBookingBtn").on("click", function() {
				// validation
				let name = $("#name").val().trim();
				let date = $("#date").val();
				let day = $("#day").val().trim();
				let headcount = $("#headcount").val().trim();
				let phoneNumber = $("#phoneNumber").val().trim();
				
				if(name == "") {
					alert("이름을 입력하세요.");
					return;
				}
				
				if(date == "") {
					alert("예약날짜를 선택해주세요.");
					return;
				}
				
				if(day == "") {
					alert("숙박일수를 입력하세요.");
					return;
				}
				
				if(isNaN(day)) { // 숫자가 아닐 때 참
					alert("숙박일수는 숫자만 가능합니다.");
					return;
				}
				
				if(headcount == "") {
					alert("숙박인원을 입력하세요.");
					return;
				}
				
				if(isNaN(headcount)) { // 숫자가 아닐 때 참
					alert("숙박인원은 숫자만 가능합니다.");
					return;
				}
				
				if(phoneNumber == "") {
					alert("전화번호를 입력하세요.");
					return;
				}
				
				// AJAX
				$.ajax({
					type: "POST"
					, url: "/booking/make-booking"
					, data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
					, success: function(data) {
						if(data.code == 200) {
							alert("예약 되었습니다.")
							location.href="/booking/booking-list-view";
						}
					}
					, error: function(request, status, error) {ㄴ
						alert("예약에 실패했습니다. 관리자에게 문의하세요.")
					}
				})
			})
		})
	</script>
</body>
</html>