<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:choose>
	<%-- 리뷰가 없는 경우 --%>
	<c:when test="${empty reviewList}">
		<h3 class="text-center p-4">작성된 리뷰가 없습니다.</h3>
	</c:when>

	<%-- 리뷰가 있는 경우 --%>
	<c:otherwise>
		<c:forEach items="${reviewList}" var="review">
			<div class="d-flex flex-column border border-info p-3 mb-3">
				<div class="d-flex align-items-center">
					<div class="font-weight-bold mr-2">${review.userName}</div>
					<c:set var="point" value="${review.point}" />
					<c:forEach var="i" begin="1" end="5" step="1">
						<c:choose>
							<%-- 1 이상인 경우: fill --%>
							<c:when test="${point >= 1}">
								<img src="/img/star_fill.png" alt="fill" width="15" />
							</c:when>
							<%-- 0.5 이상인 경우: half --%>
							<c:when test="${point >= 0.5}">
								<img src="/img/star_half.png" alt="half" width="15" />
							</c:when>
							<%-- 0.5 미만인 경우: empty --%>
							<c:otherwise>
								<img src="/img/star_empty.png" alt="empty" width="15" />
							</c:otherwise>
						</c:choose>
						<c:set var="point" value="${point - 1}" />
					</c:forEach>
				</div>
				<div class="text-secondary">
					<small><fmt:formatDate value="${review.createdAt}"
							pattern="yyyy년 M월 d일" /></small>
				</div>
				<div class="mt-1 mb-1">${review.review}</div>
				<div class="tag">
					<small>${review.menu}</small>
				</div>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>