<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 펜션</title>
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
		<section class="banner bg-info">
			<img src="/img/test06_banner4.jpg" alt="banner" id="bannerImage"
				class="w-100">
		</section>
		<section class="reserve bg-primary d-flex">
			<section
				class="real-time-reserved col-4 d-flex justify-content-center align-items-center">
				<div class="display-4 text-white">
					실시간<br>예약하기
				</div>
			</section>
			<section class="confirm col-4">
				<div class="text-white mt-3">
					<span class="reserve-confirm">예약 확인</span>
				</div>

				<div id="nonMemberBox" class="mr-3">
					<div class="d-flex align-items-center justify-content-end mt-2">
						<span class="text-white mr-2">이름</span> <input type="text"
							id="name" class="form-control col-9">
					</div>
					<div class="d-flex align-items-center justify-content-end mt-2">
						<span class="text-white mr-2">전화번호</span> <input type="text"
							id="phoneNumber" class="form-control col-9">
					</div>
					<div class="d-flex justify-content-end mt-2">
						<button type="button" id="checkBookingBtn" class="btn btn-success">조회하기</button>
					</div>
				</div>
			</section>
			<section
				class="inquiry col-4 d-flex justify-content-center align-items-center">
				<div class="text-white">
					<h4 class="font-weight-bold">예약문의:</h4>
					<h1>
						010-<br>0000-1111
					</h1>
				</div>
			</section>
		</section>
		<footer class="d-flex align-items-center pl-3">
			<jsp:include page="footer.jsp" />
		</footer>
	</div>

	<script>
		$(document)
				.ready(
						function() {
							// 날짜 영역 datePicker로 선택하기
							$('#reserveDate').datepicker({
								dateFormat : "yy년 mm월 dd일" // 2021년 00월 00일
								, minDate : 0 // 오늘 날짜 이후로 선택
							});

							// 조회하기 버튼 클릭
							$('#checkBookingBtn')
									.on(
											'click',
											function() {
												let name = $('#name').val().trim();
												let phoneNumber = $('#phoneNumber').val().trim();
												
												// validation
												if (name == '') {
													alert("이름을 입력하세요");
													return;
												}

												if (phoneNumber == '') {
													alert("전화번호를 입력하세요");
													return;
												}

												if (phoneNumber.startsWith('010') === false) {
													alert("010으로 시작하는 번호만 입력 가능합니다.");
													return;
												}
												
												// 조회 기능
												$.ajax({
													type : "POST",
													url : "/booking/check-booking",
													data : {
														"name" : name,
														"phoneNumber" : phoneNumber
													},
													success: function(data) {
														if(data.code == 200) {
															alert("이름 : " + data.result.name 
																	+ "\n날짜 : " + data.result.date.slice(0, 10)
																	+ "\n일수 : " + data.result.day
																	+ "\n인원 : " + data.result.headcount
																	+ "\n상태 : " + data.result.state);
														} else if(data.code == 500) {
															alert(data.error_message);
														}
													}, 
													error: function(request, status, error) {
														alert("조회에 실패했습니다. 관리자에게 문의하세요.");
													}
												})
											});

							// 이미지 3초 간격으로 변경하기
							let bannerSrcArr = [ '/img/test06_banner1.jpg',
									'/img/test06_banner2.jpg',
									'/img/test06_banner3.jpg',
									'/img/test06_banner4.jpg' ];
							let currentIndex = 0;
							setInterval(function() {
								$('#bannerImage').attr('src',
										bannerSrcArr[currentIndex]);
								currentIndex++;

								if (currentIndex > bannerSrcArr.length) {
									currentIndex = 0;
								}
							}, 3000);
						});
	</script>
</body>
</html>