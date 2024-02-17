<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZPICK - 관리자</title>
</head>
<body class="totalBodyStyle">
	<jsp:include page="../layout/nav.jsp"></jsp:include>

	<div class="container flex-grow-1">
		<div class="card my-5">
			<div class="card-header">
				<i class="bi bi-people-fill"></i> 회원 정보
			</div>
			<div class="card-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>아이디</th>
							<th>이메일</th>
							<th>권한</th>
							<th>생성일</th>
							<th>계정 삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="member" items="${members}">
							<tr>
								<td valign="middle">${member.userId}</td>
								<td valign="middle">${member.userEmail}</td>
								<td valign="middle">${member.userRole}</td>
								<td valign="middle">${member.userRegDate}</td>
								<td valign="middle">
								<c:if test="${member.userRole eq 'USER' }">
									<button class="btn btn-danger btn-sm btn-admin-deleteUser" data-userid="${member.userId}">삭제</button>
								</c:if>
								</td>
							</tr>
						</c:forEach>
						
						<!-- 페이지가 1페이지가 넘으면 페이징 링크 생성 -->
					<c:if test="${totalPages > 1}">
						<ul class="pagination">
							<!-- 이전 페이지 링크 -->
							<c:choose>
								<c:when test="${currentPage > 0}">
									<li class="page-item"><a class="page-link"
										href="/news?page=${currentPage - 1}">이전</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled"><span class="page-link">이전</span>
									</li>
								</c:otherwise>
							</c:choose>

							<!-- 페이지 링크 목록 -->
							<c:forEach begin="0" end="${totalPages - 1}" varStatus="status">
								<c:choose>
									<c:when test="${status.index eq currentPage}">
										<li class="page-item active"><span class="page-link">${status.index + 1}</span>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="/news?page=${status.index}">${status.index + 1}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<!-- 다음 페이지 링크 -->
							<c:choose>
								<c:when test="${currentPage < totalPages - 1}">
									<li class="page-item"><a class="page-link"
										href="/news?page=${currentPage + 1}">다음</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled"><span class="page-link">다음</span>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<script src="/js/user.js"></script>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>