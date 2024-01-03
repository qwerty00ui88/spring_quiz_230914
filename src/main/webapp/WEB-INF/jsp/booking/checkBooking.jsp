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
			<div class="display-4">통나무 펜션</div>
		</header>
		<nav>
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="#"
					class="nav-link text-white font-weight-bold">펜션소개</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link text-white font-weight-bold">객실보기</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link text-white font-weight-bold">예약안내</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link text-white font-weight-bold">커뮤니티</a></li>
			</ul>
		</nav>
		<section class="banner bg-info">
			<img src="/img/test06_banner1.jpg" alt="banner" class="w-100">
		</section>
		<section class="reserve bg-primary d-flex">
			<section
				class="real-time-reserved col-4 d-flex justify-content-center align-items-center">
				<div class="display-4 text-white">
					실시간<br>예약하기
				</div>
			</section>
			<section class="confirm col-4">
				<!-- 예약 확인 라디오 버튼-->
				<div class="text-white mt-3">
					<span class="reserve-confirm">예약 확인</span> <label class="ml-3">
						<span>회원</span> <input type="radio" name="member" value="member"
						checked>
					</label> <label class="ml-3"> <span>비회원</span> <input type="radio"
						name="member" value="nonMember">
					</label>
				</div>

				<!-- 아이디 비밀번호 (회원) -->
				<div id="memberBox" class="mr-3 d-none">
					<div class="d-flex align-items-center justify-content-end mt-3">
						<span class="text-white mr-2">아이디</span> <input type="text"
							id="id" class="form-control col-9">
					</div>
					<div class="d-flex align-items-center justify-content-end mt-3">
						<span class="text-white mr-2">비밀번호</span> <input type="password"
							id="password" class="form-control col-9">
					</div>

					<!-- 버튼 -->
					<div class="d-flex justify-content-end mt-3">
						<button type="button" class="submit-btn btn btn-success">조회하기</button>
					</div>
				</div>

				<!-- 비회원 -->
				<div id="nonMemberBox" class="mr-3">
					<div class="d-flex align-items-center justify-content-end mt-2">
						<span class="text-white mr-2">이름</span> <input type="text"
							id="name" class="form-control col-9">
					</div>
					<div class="d-flex align-items-center justify-content-end mt-2">
						<span class="text-white mr-2">전화번호</span> <input type="text"
							id="phoneNumber" class="form-control col-9">
					</div>
					<div class="d-flex align-items-center justify-content-end mt-2">
						<span class="text-white mr-2">날짜</span> <input type="text"
							id="reserveDate" class="form-control col-9">
					</div>

					<!-- 버튼 -->
					<div class="d-flex justify-content-end mt-2">
						<button type="button" class="submit-btn btn btn-success">조회하기</button>
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
			<div class="address">
				제주특별자치도 제주시 애월읍<br> 사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 /
				대표:김통목<br> Copyright 2025 tongnamu. All right reserved.
			</div>
		</footer>
	</div>

	<script>
		$(document).ready(
				function() {
					// 2-1. 회원/비회원 선택시 인풋폼 내용 바뀌도록 설정
					$('input[name=member]').on('change', function() {
						//alert($(this).val());
						var radioValue = $(this).val();
						if (radioValue == 'member') {
							$('#memberBox').removeClass("d-none");
							$('#nonMemberBox').addClass("d-none");
						} else {
							$('#nonMemberBox').removeClass("d-none");
							$('#memberBox').addClass("d-none");
						}
					});

					// 2-2. 날짜 영역 datePicker로 선택하기
					$('#reserveDate').datepicker({
						dateFormat : "yy년 mm월 dd일" // 2021년 00월 00일
						,
						minDate : 0
					// 오늘 날짜 이후로 선택
					});

					// 3. 조회하기 버튼 클릭
					$('.submit-btn').on(
							'click',
							function(e) {
								e.preventDefault();

								var memberRadioValue = $(
										'input:radio[name=member]:checked')
										.val(); // 라디오 버튼 중 선택된 value
								console.log(memberRadioValue); // member or nonMember

								if (memberRadioValue == 'member') {
									// 회원 validation
									if ($('#id').val().trim() == '') {
										alert("아이디를 입력하세요");
										return;
									}

									if ($('#password').val() == '') {
										alert("비밀번호를 입력하세요");
										return;
									}
								} else {
									// 비회원 validation
									if ($('#name').val().trim() == '') {
										alert("이름을 입력하세요");
										return;
									}

									if ($('#phoneNumber').val().trim() == '') {
										alert("전화번호를 입력하세요");
										return;
									}

									if ($('#reserveDate').val() == '') {
										alert("날짜를 선택해주세요");
										return;
									}

									// 전화번호가 010으로 시작하는지 확인
									//-- 첫번째 방법
									//$('#phoneNumber').val().slice(0, 3);

									//-- 두번째 방법
									if ($('#phoneNumber').val().startsWith(
											'010') === false) {
										alert("010으로 시작하는 번호만 입력 가능합니다.");
										return;
									}
								}
							});

					// 4. 이미지 3초 간격으로 변경하기

					let bannerSrcArr = [ 'banner1.jpg', 'banner2.jpg',
							'banner3.jpg', 'banner4.jpg' ];
					let currentIndex = 0;
					setInterval(function() {
						$('#bannerImage').attr('src',
								bannerSrcArr[currentIndex]);
						currentIndex++;

						if (currentIndex > bannerSrcArr.length) { // 인덱스 값이 배열의 크기를 넘으면 0으로(처음 이미지) 세팅
							currentIndex = 0;
						}
					}, 3000); // 3초에 한번씩 함수 실행

				});
	</script>
</body>
</html>