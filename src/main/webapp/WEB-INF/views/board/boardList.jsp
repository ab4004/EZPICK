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

	<div class="container flex-grow-1 mt-3">
		<div class="card mb-4">
			<div class="card-header">
				<a class="btn btn-primary float-end" href="/board/insertBoard">
					<i class="fas fa-edit"></i> 글 작성
				</a>
			</div>
			<div class="card-body" style="min-height: 500px">
				<table class="table table-hover">
						<c:forEach var="board" items="${boardList}">
							<tr>
								<td style="width: 5%"><c:if test="${board.categoryNo eq 1}"><span class="badge bg-warning">자유</span></c:if> <c:if
										test="${board.categoryNo eq 2}"><span class="badge bg-primary">유머</span></c:if> <c:if
										test="${board.categoryNo eq 3}"><span class="badge bg-danger">사건</span></c:if> <c:if
										test="${board.categoryNo eq 4}"><span class="badge bg-info">정보</span></c:if></td>
								<td style="width: 10%">${board.boardSeq}</td>
								<td><a href="/board/detail/${board.boardSeq}">${board.boardTitle}</a></td>
								<td style="width: 20%">${board.user.userNickname}</td>

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

								<td style="width: 20%"><c:choose>
										<c:when test="${wrtYMD eq crtYMD}">
											<fmt:formatDate value="${wrtDate}" pattern="HH:mm" />
										</c:when>
										<c:otherwise>${wrtYMD}</c:otherwise>
									</c:choose></td>

								<td style="width: 8%">${board.boardHits}</td>
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