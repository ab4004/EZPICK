<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZPICK</title>
</head>
<body class="totalBodyStyle">
	<jsp:include page="../layout/search_nav.jsp"></jsp:include>

	<div class="container flex-grow-1 mt-3">
		<div class="card mb-4">
			<c:if test="${user.userNickname eq board.user.userNickname}">
				<div class="card-header">
					<input type="hidden" id="id" value="${board.boardSeq}"> <a
						class="btn btn-danger btn-sm float-end" id="delete-board"> <i
						class="bi bi-journal-x"></i> 삭제
					</a> <a class="btn btn-warning btn-sm float-end me-3"
						href="/board/updateBoard/${board.boardSeq}"> <i
						class="bi bi-journal-arrow-up"></i> 수정
					</a>

				</div>
			</c:if>
			<div class="card-body">
				<div class="d-flex">
					<h3>
						<c:if test="${board.categoryNo eq 1}">
							<span class="badge bg-warning me-2">자유</span>
						</c:if>
						<c:if test="${board.categoryNo eq 2}">
							<span class="badge bg-primary me-2">유머</span>
						</c:if>
						<c:if test="${board.categoryNo eq 3}">
							<span class="badge bg-danger me-2">사건사고</span>
						</c:if>
						<c:if test="${board.categoryNo eq 4}">
							<span class="badge bg-info me-2">정보</span>
						</c:if>
						${board.boardTitle}
					</h3>
				</div>

				<div>
					<div>
						<label class="form-label me-2">작성자 : </label>${board.user.userNickname}
					</div>
					<div>
						<label class="form-label me-2">작성일 : </label>
						<c:set var="wd" value="${board.boardWrtDate }">
						</c:set>

						<fmt:parseDate value="${wd}" var="wrtDate"
							pattern="yyyy-MM-dd'T'HH:mm:ss" />
						<fmt:formatDate value="${wrtDate}"
							pattern="yyyy년 MM월 dd일 (E) HH:mm:ss" />
					</div>
					<div>

						<c:if test="${not empty board.boardCrtDate}">
							<label class="form-label me-2">수정일 : </label>

							<c:set var="cd" value="${board.boardCrtDate}" />

							<fmt:parseDate value="${cd}" var="crtDate"
								pattern="yyyy-MM-dd'T'HH:mm:ss" />
							<fmt:formatDate value="${crtDate}"
								pattern="yyyy년 MM월 dd일 (E) HH:mm:ss" />
						</c:if>

					</div>
					<div>
						<label class="form-label me-2">조회수 : </label> ${board.boardHits}
					</div>
				</div>
				<hr>
				<div style="min-height: 200px;">${board.boardContent}</div>
				<hr>
				<div>${board.boardLikes}${board.boardHates}</div>

			</div>
		</div>
	</div>
	<script src="/js/board.js"></script>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>