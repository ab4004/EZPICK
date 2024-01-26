<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.time.Instant" %>
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
						<c:if test="${not empty matchList}">
							<c:forEach var="match" items="${matchList}">
								<c:forEach var="participant" items="${match.info.participants}">
									<c:if test="${participant.puuid eq account.puuid }">
									<!-- 승리 여부 -->
									<c:if test="${participant.win eq true}">
										<div class="d-flex card py-2 px-3 my-3" style="border-left: 6px solid #5383e8; background-color: #f9fbfd">
											<div class="d-flex">
												<strong class="text-primary">승리</strong>
									</c:if>
									<c:if test="${participant.win ne true}">
										<div class="d-flex card py-2 px-3 my-3" style="border-left: 6px solid #e84057; background-color: #fef9f9">
											<div class="d-flex">
												<strong class="text-danger">패배</strong>
									</c:if>
											
												<!-- 해당 매치 게임 모드 (queueId에 따른 랭크게임 정보는 https://static.developer.riotgames.com/docs/lol/queues.json 참고) -->
												<c:choose>
													<c:when test="${match.info.gameMode eq 'ARAM'}">
														<p class="mx-3">칼바람 나락</p>
													</c:when>
													<c:when test="${match.info.gameMode eq 'CLASSIC'}">
														<c:choose>
															<c:when test="${match.info.queueId eq '420'}">
																<p class="mx-3">소환사의 협곡(솔랭)</p>													
															</c:when>
															<c:when test="${match.info.queueId eq '440'}">
																<p class="mx-3">소환사의 협곡(자랭)</p>													
															</c:when>
															<c:otherwise>
																<p class="mx-3">소환사의 협곡</p>
															</c:otherwise>
														</c:choose>
													</c:when>
												</c:choose>
												
												<!-- 해당 매치 플레이 시간 -->
												<c:set var="match_ms" value="${match.info.gameEndTimestamp - match.info.gameStartTimestamp}"/>
												<c:set var="match_sec" value="${(match_ms div 1000) mod 60}"></c:set>
												<c:set var="match_min" value="${(match_ms div (1000 * 60)) mod 60}"></c:set>
												<p class="mx-3">
													<c:if test="${match_min ne 0}">
														<fmt:formatNumber value="${match_min}" pattern="00"/>분 
    													<fmt:formatNumber value="${match_sec}" pattern="00"/>초
													</c:if>
													<c:if test="${match_min eq 0}">
    													<fmt:formatNumber value="${match_sec}" pattern="00"/>초
													</c:if>
												</p>
												
												<!-- 해당 매치가 현재 기준으로 어느 정도 지났는지  -->
												<%
												    // 현재 시간 가져오기
												    Instant currentInstant = Instant.now();
													long currentTimeMillis = currentInstant.toEpochMilli();
    											%>
    											<c:set var="play_time" value="${(currentTimeMillis - match.info.gameEndTimestamp) div 1000}"/>
    											현재시간 : ${currentTimeMillis}
    											<c:choose>
    												<c:when test="${play_time < 0}">
            											<div>0초 전</div>
        											</c:when>
       												<c:when test="${play_time >= 31536000}">
            											<div>${play_time div 31536000}년 전</div>
        											</c:when>
       												<c:when test="${play_time >= 2592000}">
       													<div>${play_time div 2592000}개월 전</div>
       												</c:when>
       												<c:when test="${play_time >= 86400}">
      													<div>${play_time div 86400}일 전</div>
      												</c:when>
      												<c:when test="${play_time >= 3600}">
      													<div>${play_time div 3600}시간 전</div>
      												</c:when>
      												<c:when test="${play_time >= 60}">
     													<div>${play_time div 60}분 전</div>
     												</c:when>
      												<c:otherwise>
       													<div>${play_time}초 전</div>
      												</c:otherwise>
    											</c:choose>    											
											</div>
										<!-- 해당 매치 소환사 본인의 K/D/A -->

											<div class="d-flex">
												<!-- 사용한 챔피언 -->
												<img
													src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/champion/${participant.championName}.png"
													width="72px" height="72px" />

												<!-- 사용한 스펠 -->
												<div class="d-flex flex-column mx-2">
													<img src="/img/spell/${participant.summoner1Id}.png"
														width="32px" height="32px" /> <img class="mt-2" 
														src="/img/spell/${participant.summoner2Id}.png"
														width="32px" height="32px" />
												</div>
												
												<div class="vr mx-3"></div>
												
												<div class="d-flex flex-column text-center" style="width: 100px">
													<!-- KDA 관련 정보 -->
													<strong>${participant.kills} / <span class="text-danger">${participant.deaths}</span> / ${participant.assists}</strong>
													<c:choose>
														<c:when test="${participant.deaths eq 0}">
															<span>평점 : perfect</span>
														</c:when>
														<c:otherwise>
															<fmt:formatNumber
																value="${(participant.kills + participant.assists) / participant.deaths}"
																pattern="#,##0.00" var="kda" />
															<span>${kda} 평점</span>
														</c:otherwise>
													</c:choose>
													<c:set var="multikill" value="${participant.pentaKills eq 0 ? (participant.quadraKills eq 0 ? (participant.tripleKills eq 0 ? (participant.doubleKills eq 0 ? '' : '더블킬') : '트리플킬') : '쿼드라킬') : '펜타킬'}"></c:set>
													<c:if test="${!empty multikill}">
														<span class="badge bg-danger">${multikill}</span>
													</c:if>
												</div>
												
												<div class="vr mx-3"></div>
												
												<!-- 사용한 아이템 -->
												<div class="d-flex flex-column">
													<div class="d-flex">
													<img class="mx-2" src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item0}.png" onerror="this.src='default-image.png'" width="32px" height="32px">
													<img class="mx-2" src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item1}.png" onerror="this.src='default-image.png'" width="32px" height="32px">
													<img class="mx-2" src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item2}.png" onerror="this.src='default-image.png'" width="32px" height="32px">
													<img class="mx-2" src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item3}.png" onerror="this.src='default-image.png'" width="32px" height="32px">
													<img class="mx-2" src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item4}.png" onerror="this.src='default-image.png'" width="32px" height="32px">
													<img class="mx-2" src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item5}.png" onerror="this.src='default-image.png'" width="32px" height="32px">
													<img class="mx-2" src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item6}.png" onerror="this.src='default-image.png'" width="32px" height="32px">
													</div>
													<div class="d-flex">
														<span>CS ${participant.totalMinionsKilled}</span>
													</div>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</c:forEach>
						</c:if>
						<c:if test="${empty matchList }">
							<p>최근 매치 기록이 없습니다.</p>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer-->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>