<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 추가</title>
<!-- BootStrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>공인중개사 추가</h1>
		<form method="post" action="/lesson04/quiz02/add-realtor">
			<div class="form-group">
				<label for="office">상호명</label>
				<input id="office" type="text" name="office" class="form-control">
			</div>
			<div class="form-group">
				<label for="phoneNumber">전화번호</label>
				<input id="phoneNumber" type="text" name="phoneNumber" class="form-control">
			</div>
			<div class="form-group">
				<label for="address">주소</label>
				<input id="address" type="text" name="address" class="form-control">
			</div>
			<div class="form-group">
				<label for="grade">등급</label>
				<input id="grade" type="text" name="grade" class="form-control">
			</div>
			<button type="submit" class="btn btn-primary">추가</button>
		</form>
	</div>
</body>
</html>