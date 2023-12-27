<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보</title>
<!-- BootStrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<!-- datepicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<%-- 내가 만든 외부 스타일시트 --%>
<link rel="stylesheet" type="text/css"
	href="/css/weather_history/style.css">
<script>
	$(document).ready(function() {
		$("#date").datepicker();
	});
</script>
</head>
<body>
	<div id="wrap">
		<div class="contents d-flex">
			<%-- 메뉴 영역 --%>
			<nav class="col-2 bg-primary">
				<%-- 상단 로고 --%>
				<div class="logo d-flex justify-content-center mt-3">
					<img
						src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Emblem_of_the_Government_of_the_Republic_of_Korea.svg/800px-Emblem_of_the_Government_of_the_Republic_of_Korea.svg.png"
						width="25"> <span class="text-white font-weight-bold ml-2">기상청</span>
				</div>

				<%-- 메뉴 --%>
				<%-- flex-column: 세로 메뉴 --%>
				<ul class="nav flex-column mt-4">
					<li class="nav-item"><a
						href="/weather-history/weather-list-view"
						class="nav-link menu-font text-light">날씨</a></li>
					<li class="nav-item"><a
						href="/weather-history/add-weather-view"
						class="nav-link menu-font text-light">날씨입력</a></li>
					<li class="nav-item"><a href="#"
						class="nav-link menu-font text-light">테마날씨</a></li>
					<li class="nav-item"><a href="#"
						class="nav-link menu-font text-light">관측 기후</a></li>
				</ul>
			</nav>

			<%-- 날씨 추가 --%>
			<section class="weather-history col-10 d-flex flex-column">
				<h3>날씨 입력</h3>
				<form method="post" action="/weather-history/add-weather">

					<div class="d-flex justify-content-between mt-5">
						<div class="d-flex align-items-center">
							<label for="date" class="input-label">날짜</label> <input
								type="text" class="form-control" id="date" name="date">
						</div>
						<div class="d-flex align-items-center">
							<label for="weather" class="input-label">날씨</label> <select
								class="form-control" id="weather" name="weather">
								<option>맑음</option>
								<option>구름조금</option>
								<option>흐림</option>
								<option>비</option>
							</select>
						</div>
						<div class="d-flex align-items-center">
							<label for="microDust" class="input-label">미세먼지</label> <select
								class="form-control" id="microDust" name="microDust">
								<option>좋음</option>
								<option>보통</option>
								<option>나쁨</option>
								<option>최악</option>
							</select>
						</div>
					</div>

					<div class="d-flex justify-content-between mt-5">
						<div class="d-flex align-items-center">
							<label for="temperatures" class="input-label">기온</label>
							<div class="input-group">
								<input type="text" class="form-control" id="temperatures"
									name="temperatures">
								<div class="input-group-append">
									<span class="input-group-text">℃</span>
								</div>
							</div>
						</div>
						<div class="d-flex align-items-center">
							<label for="precipitation" class="input-label">강수량</label>
							<div class="input-group">
								<input type="text" class="form-control" id="precipitation"
									name="precipitation">
								<div class="input-group-append">
									<span class="input-group-text">mm</span>
								</div>
							</div>
						</div>
						<div class="d-flex align-items-center">
							<label for="windSpeed" class="input-label">풍속</label>
							<div class="input-group">
								<input type="text" class="form-control" id="windSpeed"
									name="windSpeed">
								<div class="input-group-append">
									<span class="input-group-text">km/h</span>
								</div>
							</div>
						</div>
					</div>
					<div class="text-right mt-4 mb-5">
						<input type="submit" class="btn btn-success" value="저장">
					</div>
				</form>
			</section>
		</div>
		<footer class="d-flex align-items-center">
			<div class="footer-logo ml-4">
				<img class="foot-logo-image"
					src="https://www.weather.go.kr/w/resources/image/foot_logo.png"
					width="120">
			</div>
			<div class="copyright ml-4">
				<small class="text-secondary"> (07062) 서울시 동작구 여의대방로16길 61 <br>
					Copyright@2023 KMA. All Rights RESERVED.
				</small>
			</div>
		</footer>
	</div>
</body>
</html>