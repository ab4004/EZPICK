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

	<div class="container d-flex flex-grow-1 mt-3">
		<!-- 게시판 메뉴부분 -->
		<div class="w-25 mb-4 me-3 d-flex-column">
			<jsp:include page="./boardNav.jsp"></jsp:include>
		</div>

		<div class="d-flex-column flex-grow-1">
			<div class="card mb-4">
				<input type="hidden" id="boardSeq" value="${board.boardSeq}">
				<c:if test="${user.userNickname eq board.user.userNickname}">
					<div class="card-header">
						<a class="btn btn-danger btn-sm float-end" id="delete-board">
							<i class="bi bi-journal-x"></i> 삭제
						</a> <a class="btn btn-warning btn-sm float-end me-3"
							href="/board/updateBoard/${board.boardSeq}"> <i
							class="bi bi-journal-arrow-up"></i> 수정
						</a>
					</div>
				</c:if>
				<div class="card-body">
					<div style="word-wrap: break-word;">
						<h3 style="word-wrap: break-word;">
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
							<span> ${board.boardTitle} </span>
						</h3>
					</div>

					<div>
						<div>
							<label class="form-label me-2">작성자 : </label>${board.user.userNickname}
						</div>
						<div>
							<label class="form-label me-2">작성일 :</label>
							<c:set var="wd" value="${board.boardWrtDate}" />
							<fmt:parseDate value="${wd}" var="wrtDate"
								pattern="yyyy-MM-dd'T'HH:mm:ss" />
							<fmt:formatDate value="${wrtDate}"
								pattern="yyyy년 MM월 dd일 (E) HH:mm:ss" />
						</div>
						<div>

							<c:if test="${not empty board.boardCrtDate}">
								<label class="form-label me-2">수정일 :</label>

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
					<div style="min-height: 310px;">${board.boardContent}</div>
					<div class="d-flex justify-content-center mt-3">
						<button class="btn btn-primary btn-lg me-3" id="likeBtn">
							<i class="bi bi-hand-thumbs-up"></i> ${board.boardLikes}
						</button>
						<button class="btn btn-danger btn-lg" id="hateBtn">
							<i class="bi bi-hand-thumbs-down"></i> ${board.boardHates}
						</button>
					</div>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<div class="d-flex">
						<h4 class="my-2" style="margin-bottom: 0">댓글</h4>
						<span class="d-flex align-items-center ms-3">총
							${replies.size()}개</span>
					</div>
				</div>
				<div class="card-body mb-3" style="background-color: #CAF0F0">
					<div class="d-flex">
						<textarea class="w-100 me-2 rounded-3 p-3" id="reply_content"
							rows="2" maxlength="200" placeholder="댓글을 입력하세요."
							style="border: none; resize: none;"></textarea>
						<button class="btn btn-lg btn-primary" id="reply_btn"
							style="white-space: nowrap;">입력</button>
					</div>
				</div>
				<c:forEach var="reply" items="${replies}">
					<div class="comment" data-reply-id="${reply.id}">
						<div class="card-body mb-3">
							<div class="d-flex mb-2">
								<c:if test="${reply.user eq user}">
									<span class="flex-grow-1 fw-bold">${reply.user.userNickname} <button class="btn btn-danger btn-sm text-center px-1 reply_delete_btn" style="padding: 0;"><i class="bi bi-x-square"></i></button></span>
								</c:if>
								<c:if test="${reply.user ne user}">
									<span class="flex-grow-1 fw-bold">${reply.user.userNickname}</span>
								</c:if>
								<span class="ms-3 text-black-50"><fmt:formatDate value="${reply.replyCrtDate}" pattern="yy-MM-dd HH:mm:ss"/></span>
							</div>
							<div class="d-flex">
								<span class="flex-grow-1">${reply.content}</span>
								<div class="d-flex">
									<button class="btn btn-sm btn-white me-2 reply_like_btn">
										<i class="bi bi-hand-thumbs-up text-primary"></i>
										${reply.like}
									</button>
									<button class="btn btn-sm btn-white reply_hate_btn">
										<i class="bi bi-hand-thumbs-down text-danger"></i>
										${reply.hate}
									</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script src="/js/board.js"></script>
	<script src="/js/reply.js"></script>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>