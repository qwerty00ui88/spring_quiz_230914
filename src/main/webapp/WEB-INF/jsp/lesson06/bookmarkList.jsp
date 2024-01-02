<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨 찾기 목록</title>
<!-- BootStrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<!-- AJAX를 사용하려면 jquery 원본 필요 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 목록</h1>
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${bookmarkList}" var="bookmark">
					<tr>
						<td>${bookmark.id}</td>
						<td>${bookmark.name}</td>
						<td><a href="${bookmark.url}" target="_blank">${bookmark.url}</a></td>
						<td><button type="button" id="${bookmark.id}" class="deleteBtn btn btn-danger">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
		$(document).ready(function() {
			$(".deleteBtn").on("click", function() {
				let id = Number($(this).attr("id"));
				
				// AJAX
				$.ajax({
					type:"GET"
					, url: "/lesson06/delete-bookmark"
					, data: {"id":id}
					, success: function(data) {
						if(data.is_deleted) {
							alert(id + "번이 삭제되었습니다.");
							location.href = "/lesson06/bookmark-list-view"
						}
					}
					, error: function(request, status, error) {
						alert("삭제에 실패했습니다.");
					}
				})
				
			})
		})
	</script>
</body>
</html>