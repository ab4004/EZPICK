<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZPICK - 뉴스</title>
</head>
<body class="totalBodyStyle">
	<jsp:include page="../layout/search_nav.jsp"></jsp:include>

	<!-- 상단 컨텐츠 -->
	<div class="container-fluid my-5 py-2 d-flex"
		style="height: 100px; background-color: #99dee1;">
		<div class="container h-100 d-flex align-items-center">
			<img alt="롤 이미지" src="/img/lol_logo_white.png" class="h-75">
		</div>
	</div>

	<!-- 메인 컨텐츠(뉴스 기사) -->
	<div class="container my-3 flex-grow-1">
		<div class="d-flex">
			<div class="d-flex-column flex-grow-1">
				<c:if test="${empty newsList}">
					<h2>현재 작성된 기사가 없습니다.</h2>
				</c:if>
				<c:if test="${!empty newsList}">
					<c:forEach var="news" items="${newsList}">
						<a href="${news.linkUrl}" target="_blank"
							style="text-decoration: none;">
							<div class="d-flex card p-3 my-3">
								<div class="d-flex">
									<div class="d-flex align-items-center">
										<c:if test="${!empty news.imageUrl}">
											<img alt="섬네일" src="${news.imageUrl}" width="200px"
												height="110px">
										</c:if>
									</div>
									<div class="d-flex-column mx-3">
										<h5 class="text-body textOneLine">${news.title}</h5>
										<p class="text-secondary textTwoLine">${news.content}</p>
										<div class="d-flex text-dark mt-2">
											<small class="textOneLine">${news.mediaCompany}</small>
										</div>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</c:if>
				<div class="d-flex justify-content-center">
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
				</div>
				<div class="text-center">
					<a class="my-3 btn btn-outline-dark btn-lg"
						href="https://game.naver.com/esports/League_of_Legends/news/lol"
						target="_blank">더보기</a>
				</div>
			</div>
			<div class="d-flex-column m-3">
				<div class="d-flex-clumn card p-3" style="width: 300px;">
					<h5 class="mb-2">인기 뉴스</h5>
					<c:if test="${empty popNewsList}">
						<div class="text-center">
							<strong>해당 기사가 없습니다.</strong>
						</div>
					</c:if>
					<c:if test="${!empty popNewsList}">
						<c:forEach var="popNews" items="${popNewsList}">
							<a href="${popNews.linkUrl}" target="_blank"
								style="text-decoration: none;">
								<div class="d-flex mb-3">
									<div class="d-flex align-items-center">
										<c:if test="${!empty popNews.imageUrl}">
											<img alt="섬네일" src="${popNews.imageUrl}" width="90px"
												height="50px">
										</c:if>
									</div>
									<div class="text-dark ms-2">
										<span class="textTwoLine">${popNews.title}</span>
									</div>
								</div>
							</a>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>