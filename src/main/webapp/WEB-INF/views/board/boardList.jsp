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
		<!-- 게시판 메뉴부분 -->
		<div class="w-25 mb-4 me-3 d-flex-column">
			<jsp:include page="./boardNav.jsp"></jsp:include>
		</div>

		<div class="card mb-4 flex-grow-1"
			style="min-height: 500px; min-width: 820px">
			<div class="card-header">
				<div class="d-flex mb-3">
					<div class="d-flex align-items-center">
						<h4 style="margin-bottom: 0">전체</h4>
					</div>
					<div class="d-flex flex-grow-1 justify-content-end">
						<a class="btn btn-sm btn-primary" href="/board/insertBoard"> <i
							class="bi bi-pencil-square"></i>
						</a>
					</div>
				</div>
				<div class="d-flex align-items-center mb-2">
					<div class="d-flex w-25">
						<!-- 인기버튼 클릭시 -->
						<c:if test="${sort eq 'popular'}">
							<a class="me-3 btn btn-sm btn-outline-primary" href="/board?category=${category}&sort=latest">최신</a>
							<a class=" btn btn-sm btn-outline-danger active" href="/board?category=${category}&sort=popular">인기</a>
						</c:if>
						<!-- 최신버튼 클릭시 -->
						<c:if test="${sort ne 'popular'}">
							<a class="me-3 btn btn-sm btn-outline-primary active" href="/board?category=${category}&sort=latest">최신</a>
							<a class="btn btn-sm btn-outline-danger" href="/board?category=${category}&sort=popular">인기</a>
						</c:if>
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
				<div class="d-flex-column">
				<div class="flex-grow-1">
				<table class="table table-hover">
					<c:if test="${!empty boardList}">
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
								<td style="width: 5%">${board.boardSeq}</td>
								<td style="width: 27%; max-width: 100px"><a
									href="/board/detail/${board.boardSeq}" style="text-decoration: none; color: black;">
										<div
											style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${board.boardTitle}</div>
								</a></td>
								<td class="text-center"
									style="width: 15%; max-width: 80px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${board.user.userNickname}</td>

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

								<td class="text-center" style="width: 10%"><c:choose>
										<c:when test="${wrtYMD eq crtYMD}">
											<fmt:formatDate value="${wrtDate}" pattern="HH:mm" />
										</c:when>
										<c:otherwise><fmt:formatDate value="${wrtDate}" pattern="yy-MM-dd" /></c:otherwise>
									</c:choose></td>

								<td class="text-center" style="width: 8%">${board.boardHits}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				</div>

				<div class="d-flex justify-content-center">
					<!-- 페이징 처리 -->
					<c:if test="${totalPages > 1}">
						<ul class="pagination">
							<!-- 이전 페이지 링크 -->
							<li class="page-item ${currentNumber == 0 ? 'disabled' : ''}">
								<a class="page-link"
								href="/board?category=${category}&sort=${sort}&page=${currentNumber - 1}">이전</a>
							</li>
							<!-- 페이지 번호들 -->
							<c:forEach var="pageNumber" begin="0" end="${totalPages - 1}">
								<li
									class="page-item ${currentNumber == pageNumber ? 'active' : ''}">
									<!-- 페이지 번호 출력 시에 1을 더해줌 --> <a class="page-link"
									href="/board?category=${category}&sort=${sort}&page=${pageNumber}">${pageNumber + 1}</a>
								</li>
							</c:forEach>
							<!-- 다음 페이지 링크 -->
							<li
								class="page-item ${currentNumber == totalPages - 1 ? 'disabled' : ''}">
								<a class="page-link"
								href="/board?category=${category}&sort=${sort}&page=${currentNumber + 1}">다음</a>
							</li>
						</ul>
					</c:if>
				</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>