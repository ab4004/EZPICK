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

	<div class="container my-3 flex-grow-1">
		<c:if test="${empty newsList}">
			<h2>현재 작성된 기사가 없습니다.</h2>
		</c:if>
		<c:if test="${!empty newsList}">
			<c:forEach var="news" items="${newsList}">
				<a href="${news.linkUrl}" target="_blank"
					style="text-decoration: none;">
					<div class="d-flex card p-3 my-3">
						<div class="d-flex">
							<!-- 
							<img alt="기사 썸네일" src="${pageContext.request.contextPath}${news.imageUrl}" width="200px"
								height="110px"> -->
							<div style='${news.imageUrl} width: 200px; height: 110px'></div>
							<div class="d-flex-column mx-3">
								<h5 class="text-body">${news.title}</h5>
								<p class="text-secondary">${news.content}</p>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</c:if>
		<small class="my-3">출처 : 네이버 e스포츠
			뉴스(https://game.naver.com/esports/League_of_Legends/news/lol)</small>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>