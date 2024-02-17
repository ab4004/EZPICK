<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZPICK</title>
</head>
<body class="totalBodyStyle">
	<jsp:include page="../layout/search_nav.jsp"></jsp:include>

	<div class="container d-flex flex-grow-1 mt-3">
		<div class="w-25 mb-4 me-3 d-flex-column">
			<div class="card mb-3 d-flex-column">
				<div class="text-center mt-3">
					<h4 style="margin-bottom: 0">카테고리</h4>
				</div>
				<hr>
				<div class="mx-3 mb-3">
					<div class="mb-2">전체</div>
					<div class="mb-2">자유</div>
					<div class="mb-2">유머</div>
					<div class="mb-2">사건사고</div>
					<div>정보</div>
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
							<a href="/board/detail/${item.boardSeq}">
								<div class="d-flex mb-2">
									<c:if test="${item.categoryNo eq 1}">
										<span>자유</span>
									</c:if>
									<c:if test="${item.categoryNo eq 2}">
										<span>유머</span>
									</c:if>
									<c:if test="${item.categoryNo eq 3}">
										<span>사건</span>
									</c:if>
									<c:if test="${item.categoryNo eq 4}">
										<span>정보</span>
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

		<div class="card mb-4 flex-grow-1"
			style="min-height: 500px; min-width: 820px">
			<div class="card-header">
				<div class="d-flex mb-3">
					<div class="d-flex align-items-center">
						<h4 style="margin-bottom: 0">전체</h4>
					</div>
					<div class="d-flex flex-grow-1 justify-content-end">
						<a class="btn btn-primary" href="/board/insertBoard"> <i
							class="bi bi-pencil-square"></i>
						</a>
					</div>
				</div>
				<div class="d-flex align-items-center mb-2">
					<div class="d-flex w-25">
						<a class="me-3" href="">최신</a> <a href="">인기</a>
					</div>
					<div class="input-group ms-auto" style="width: 40%">
						<select class="form-select form-select-sm" id="category"
							name="category">
							<option value="titleAndContent">제목 + 내용</option>
							<option value="writer">작성자</option>
						</select> <input type="text" class="form-control form-control-sm"
							id="board_search" placeholder="검색" style="width: 30%">
						<button class="btn btn-success btn-sm" type="submit">
							<i class="bi bi-search"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="card-body">
				<table class="table table-hover">
					<c:forEach var="board" items="${boardList}">
						<tr>
							<td style="width: 5%"><c:if test="${board.categoryNo eq 1}">
									<span class="badge bg-warning">자유</span>
								</c:if> <c:if test="${board.categoryNo eq 2}">
									<span class="badge bg-primary">유머</span>
								</c:if> <c:if test="${board.categoryNo eq 3}">
									<span class="badge bg-danger">사건</span>
								</c:if> <c:if test="${board.categoryNo eq 4}">
									<span class="badge bg-info">정보</span>
								</c:if></td>
							<td style="width: 10%">${board.boardSeq}</td>
							<td style="width: 27%; max-width: 100px"><a
								href="/board/detail/${board.boardSeq}"><div
										style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${board.boardTitle}</div></a></td>
							<td class="text-center"
								style="width: 20%; max-width: 250px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${board.user.userNickname}</td>

							<!-- 작성일 -->
							<c:set var="wd" value="${board.boardWrtDate }" />
							<fmt:parseDate value="${wd}" var="wrtDate"
								pattern="yyyy-MM-dd'T'HH:mm:ss" />
							<fmt:formatDate value="${wrtDate}" var="wrtYMD"
								pattern="yyyy-MM-dd" />

							<!-- 현재 날짜 -->
							<c:set var="currentDate" value="<%=new Date()%>" />
							<fmt:formatDate value="${currentDate}" var="crtYMD"
								pattern="yyyy-MM-dd" />

							<td class="text-center" style="width: 20%"><c:choose>
									<c:when test="${wrtYMD eq crtYMD}">
										<fmt:formatDate value="${wrtDate}" pattern="HH:mm" />
									</c:when>
									<c:otherwise>${wrtYMD}</c:otherwise>
								</c:choose></td>

							<td class="text-center" style="width: 8%">${board.boardHits}</td>
						</tr>
					</c:forEach>
				</table>

				<div>
					<!-- 페이징 처리 -->
					<c:if test="${totalPages > 1}">
						<ul class="pagination">
							<c:choose>
								<c:when test="${currentPage > 0}">
									<li class="page-item"><a class="page-link"
										href="/board?page=${currentPage - 1}">이전</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled"><span class="page-link">이전</span></li>
								</c:otherwise>
							</c:choose>

							<c:forEach begin="0" end="${totalPages - 1}" varStatus="status">
								<c:choose>
									<c:when test="${status.index eq currentPage}">
										<li class="page-item active"><span class="page-link">${status.index + 1}</span></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="/board?page=${status.index}">${status.index + 1}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${currentPage < totalPages - 1}">
									<li class="page-item"><a class="page-link"
										href="/board?page=${currentPage + 1}">다음</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled"><span class="page-link">다음</span></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>