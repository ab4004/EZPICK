<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZPICK</title>
</head>
<body>
	<!-- 네비게이션 영역-->
	<jsp:include page="../layout/nav.jsp"></jsp:include>

	<!-- 상단 영역 / 검색 후 소환사 정보 -->
	<header class="masthead_summoner" style="padding-top: 50px; height: 50%">
		<div class="container position-relative">
			<div class="row justify-content-center">
				<div class="col-xl-8">
						<div class="row">
							<div class="d-flex p-3 text-white">
								<div class="m-3 text-center">
									<img
										src="https://ddragon.leagueoflegends.com/cdn/14.1.1/img/profileicon/${summoner.profileIconId}.png"
										class="summoner_icon" onerror=this.src="/img/minion.png" width="100px" height="100px">
									<div>
										<span class="badge bg-dark">${summoner.summonerLevel}</span>
									</div>
								</div>
								<div class="m-2">
									<h2><strong>${account.gameName}</strong><span style="color: #9e9eb1"> #${account.tagLine}</span></h2>
									<h5><span class="badge bg-dark">Prev. ${summoner.name}</span></h5>
									<p>마지막 접속 : ${date}</p>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</header>

	<!-- 중단 컨텐츠 영역 -->
	<section class="features-icons bg-light text-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-4"></div>
				<div>
				<!-- 
				<c:forEach var="match" items="${matchList}">
					<p>${match.metadata.matchid }</p>
					<p>${match.info.gameMode }
				</c:forEach>
				 -->
				</div>
				<div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer-->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>