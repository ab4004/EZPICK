<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZPICK</title>
</head>
<body>
	<div style="position: sticky; top: 122px;">
		<div class="card mb-3 d-flex-column">
			<div class="text-center mt-3">
				<h4 style="margin-bottom: 0">카테고리</h4>
			</div>
			<hr>
			<div class="mx-3 mb-3">
				<a href="/board" class="boardList_a"><div class="mb-2">전체</div></a>
				<a href="/board?category=자유" class="boardList_a"><div
						class="mb-2">자유</div></a> <a href="/board?category=유머"
					class="boardList_a"><div class="mb-2">유머</div></a> <a
					href="/board?category=사건" class="boardList_a"><div class="mb-2">사건사고</div></a>
				<a href="/board?category=정보" class="boardList_a"><div>정보</div></a>
			</div>
		</div>
		<div class="card flex-grow-1">
			<div class="text-center mt-3">
				<h4 style="margin-bottom: 0">TOP 10</h4>
			</div>
			<hr>
			<div class="mx-3">
				<c:if test="${empty topTen}">
					<div class="text-center">
						<h5>현재 인기 글이 없습니다.</h5>
					</div>
				</c:if>
				<c:if test="${not empty topTen}">
					<c:forEach var="item" items="${topTen}">
						<a href="/board/detail/${item.boardSeq}"
							style="text-decoration: none; color: black;">
							<div class="d-flex mb-2 boardList_a">
								<c:if test="${item.categoryNo eq 1}">
									<span class="badge bg-warning">자유</span>
								</c:if>
								<c:if test="${item.categoryNo eq 2}">
									<span class="badge bg-primary">유머</span>
								</c:if>
								<c:if test="${item.categoryNo eq 3}">
									<span class="badge bg-danger">사건</span>
								</c:if>
								<c:if test="${item.categoryNo eq 4}">
									<span class="badge bg-info">정보</span>
								</c:if>
								<span class="ms-2"
									style="max-width: 240px; -webkit-line-clamp: 1; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-box-orient: vertical;">${item.boardTitle}</span>
							</div>
						</a>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>