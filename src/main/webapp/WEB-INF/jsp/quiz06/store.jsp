<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${storeList}" var="store">
	<a href="/quiz06/review-list-view?storeId=${store.id}&storeName=${store.name}"
		class="d-flex flex-column border border-info p-3 mb-3">
		<h4>${store.name}</h4>
		<div>전화 번호 : ${store.phoneNumber}</div>
		<div>주소 : ${store.address}</div>
	</a>
</c:forEach>