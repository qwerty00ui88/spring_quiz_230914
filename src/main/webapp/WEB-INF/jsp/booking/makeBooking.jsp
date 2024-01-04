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
		<section class="d-flex flex-column align-items-center">
			<h1 class="text-center mt-4 mb-4">예약 하기</h1>
			<div class="col-6">
				<label for="name">이름</label>
				<input type="text" id="name" class="form-control" />
			</div>
			<div class="col-6">
				<label for="date">예약날짜</label>
				<input type="text" id="date" class="form-control" placeholder="2024-01-01" />
			</div>
			<div class="col-6">
				<label for="day">숙박일수</label>
				<input type="text" id="day" class="form-control" />
			</div>
			<div class="col-6">
				<label for="headcount">숙박인원</label>
				<input type="text" id="headcount" class="form-control" />
			</div>
			<div class="col-6">
				<label for="phoneNumber">전화번호</label>
				<input type="text" id="phoneNumber" class="form-control" placeholder="010-0000-0000" />
			</div>
			<button type="button" id="addBtn" class="btn btn-warning col-6 mt-2">예약하기</button>
		</section>
		<footer class="d-flex align-items-center pl-3">
			<jsp:include page="footer.jsp" />
		</footer>
	</div>
	<script>
		$(document).ready(function() {
			$("#date").datepicker({dateFormat: "yy-mm-dd"});
			
			$("#addBtn").on("click", function() {
				// validation
				let name = $("#name").val().trim();
				if(name == "") {
					alert("이름을 입력하세요.");
					return;
				}
				
				let date = $("#date").val().trim();
				if(date == "") {
					alert("예약날짜를 입력하세요.");
					return;
				}
				
				let day = $("#day").val().trim();
				if(day == "") {
					alert("숙박일수를 입력하세요.");
					return;
				}
				
				let headcount = $("#headcount").val().trim();
				if(headcount == "") {
					alert("숙박인원을 입력하세요.");
					return;
				}
				
				let phoneNumber = $("#phoneNumber").val().trim();
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
							alert("예약에 성공했습니다.")
							location.href="/booking/booking-list-view";
						} else if(data.code == 500) {
							alert(data.error_message);
						}
					}
					, error: function(request, status, error) {
						console.log({request, status, error})
						alert("예약에 실패했습니다. 관리자에게 문의하세요.")
					}
				})
			})
		})
	</script>
</body>
</html>