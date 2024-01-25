<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<header class="masthead_summoner"
		style="padding-top: 50px; height: 50%">
		<div class="container position-relative">
			<div class="row justify-content-center">
				<div class="col-xl-8">
					<div class="row">
						<div class="d-flex p-3 text-white">
							<div class="m-3 text-center">
								<img
									src="https://ddragon.leagueoflegends.com/cdn/14.1.1/img/profileicon/${summoner.profileIconId}.png"
									class="summoner_icon" onerror=this.src=
									"/img/minion.png" width="100px" height="100px">
								<div>
									<span class="badge bg-dark">${summoner.summonerLevel}</span>
								</div>
							</div>
							<div class="m-2">
								<h2>
									<strong>${account.gameName}</strong><span
										style="color: #9e9eb1"> #${account.tagLine}</span>
								</h2>
								<h5>
									<span class="badge bg-dark">Prev. ${summoner.name}</span>
								</h5>
								<p>마지막 접속 : ${date}</p>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- 중단 컨텐츠 영역 -->
	<section class="features-icons bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-4"></div>
				<div>
					<!-- 매치기록 확인용 -->
					<div>
						<c:if test="${not empty matchList }">
							<c:forEach var="match" items="${matchList}">
								<div class="card">

									<div>
										<!-- 해당 매치 게임 모드 -->
										<c:choose>
											<c:when test="${match.info.gameMode eq 'ARAM'}">
												<div class="card-body">칼바람 나락</div>
											</c:when>
											<c:when test="${match.info.gameMode eq 'CLASSIC'}">
												<div class="card-body">소환사의 협곡</div>
											</c:when>
										</c:choose>

									</div>
									<!-- 해당 매치 소환사 본인의 K/D/A -->
									<c:forEach var="participant" items="${match.info.participants}">
										<c:if test="${participant.puuid eq account.puuid }">

											<div>
												<!-- 사용한 챔피언 -->
												<img
													src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/champion/${participant.championName}.png"
													width="100px" height="100px" />

												<!-- 사용한 스펠 -->
												<div>
													<img src="/img/spell/${participant.summoner1Id}.png"
														width="48px" height="48px" /> <img
														src="/img/spell/${participant.summoner2Id}.png"
														width="48px" height="48px" />
												</div>
											</div>
											<!-- 승리 여부 -->
											${participant.win eq true ? "승리" : "패배"}
											
											<!-- KDA 관련 정보 -->
											<p>${participant.kills}/${participant.deaths}/${participant.assists}</p>
											<fmt:formatNumber
												value="${(participant.kills + participant.assists) / participant.deaths}"
												pattern="#,##0.00" var="kda" />
											<p>KDA : ${kda}</p>
										</c:if>
									</c:forEach>

								</div>


							</c:forEach>
						</c:if>
						<c:if test="${empty matchList }">
							<p>최근 매치 기록이 없습니다.</p>
						</c:if>
					</div>
				</div>
				<div></div>
			</div>
		</div>
	</section>

	<!-- Footer-->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>