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
<body
	style="background-color: #f8f9fa; font-family: 'Noto Sans KR', sans-serif;">

	<!-- 네비게이션 영역-->
	<jsp:include page="../layout/search_nav.jsp"></jsp:include>

	<!-- 상단 영역 / 검색 후 소환사 정보 -->
	<header class="masthead_summoner"
		style="padding-top: 105px; height: 50%; top: -55px; bottom: 55px">
		<div class="container position-relative">
			<div class="d-flex flex-grow-1 text-white">

				<!-- 소환사 정보1 (프로필, 레벨) -->
				<div class="my-2 text-center">
					<img
						src="https://ddragon.leagueoflegends.com/cdn/14.1.1/img/profileicon/${summoner.profileIconId}.png"
						class="summoner_icon" onerror=this.src=
						"/img/minion.png" alt="소환사 프로필" width="100px" height="100px">
					<div>
						<span class="badge bg-dark">${summoner.summonerLevel}</span>
					</div>
				</div>

				<!-- 소환사 정보2 (닉네임, 태그, 이전 닉네임, 마지막 접속일) -->
				<div class="mx-4 my-2 flex-grow-1">
					<h2>
						<strong>${account.gameName}</strong><span
							style="color: #9e9eb1; font-size: 0.5em">
							#${account.tagLine}</span>
					</h2>
					<h5>
						<span class="badge bg-dark">Prev. ${summoner.name}</span>
					</h5>
					<p style="white-space: nowrap">마지막 접속 : ${date}</p>
				</div>

				<!-- 랭크정보 -->
				<div class="d-flex my-2 text-center justify-content-end">
					<div class="d-flex flex-column text-center mx-3">
						<span>솔로랭크</span>
						<c:choose>
							<c:when test="${!empty soloRank}">
								<div class="d-flex flex-fill justify-content-center">
									<img class="align-self-center"
										src="/img/rank/${soloRank.tier}.png" alt="티어" width="100px"
										height="100px">
								</div>
								<strong>${soloRank.tier} ${soloRank.rank}</strong>
							</c:when>
							<c:otherwise>
								<div class="d-flex flex-fill justify-content-center">
									<span class="align-self-center">해당 정보가 없습니다.</span>
								</div>
								<strong>UNRANK</strong>
							</c:otherwise>
						</c:choose>
					</div>

					<div class="d-flex flex-column text-center mx-3">
						<span>자유랭크</span>
						<c:choose>
							<c:when test="${!empty flexRank}">
								<div class="d-flex flex-fill justify-content-center">
									<img class="align-self-center"
										src="/img/rank/${flexRank.tier}.png" alt="티어" width="100px"
										height="100px">
								</div>
								<strong>${flexRank.tier} ${flexRank.rank}</strong>
							</c:when>
							<c:otherwise>
								<div class="d-flex flex-fill justify-content-center">
									<span class="align-self-center">해당 정보가 없습니다.</span>
								</div>
								<strong>UNRANK</strong>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<!-- 상단 버튼 영역 -->
	<div class="container d-flex mb-3">
		<div>
			<a class="btn btn-dark" href="https://www.leagueoflegends.com/ko-kr/champions/" target="_blank">챔피언 정보</a>
		</div>
	</div>

	<!-- 중단 컨텐츠 영역 -->
	<section class="bg-light">
		<div class="container">
			<div class="d-flex">
				<div class="d-flex-column w-25">
					<div class="card" style="background-color: #f9fbfd">
						<div class="p-3">
							<strong class="mt-2">챔피언 모스트 TOP 10</strong>
						</div>

						<!-- 모스트 챔피언 10개 보여주는 영역 -->
						<c:if test="${empty championMasteryList}">
							<div class="mx-3 text-center">챔피언 정보가 없습니다.</div>
						</c:if>
						<c:if test="${!empty championMasteryList}">
							<c:forEach var="mostCham" items="${championMasteryList}">
								<div class="d-flex p-3 border-top">
									<img class="rounded-circle align-self-center" alt="챔피언"
										src="/img/champion/${mostCham.championId}.png" width="40px"
										height="40px">
									<div class="d-flex-column">
										<div class="mx-3">Lv. ${mostCham.championLevel}</div>
										<div class="mx-3">Point. ${mostCham.championPoints}점</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>

				<div class="mx-2"></div>

				<div class="flex-grow-1">
					<!-- 매치기록 확인용 -->
					<div>
						<c:if test="${not empty matchList}">
							<c:forEach var="match" items="${matchList}">
								<c:forEach var="participant" items="${match.info.participants}">
									<c:if test="${participant.puuid eq account.puuid }">
										<!-- 승리 여부 -->
										<c:if test="${participant.win eq true}">
											<div class="d-flex card py-2 px-3 mb-3"
												style="border-left: 6px solid #5383e8; background-color: #f9fbfd">
												<div class="d-flex">
													<div class="d-flex-cloumn flex-grow-1">
														<div class="d-flex">
															<strong class="text-primary">승리</strong>
										</c:if>
										<c:if test="${participant.win ne true}">
											<div class="d-flex card py-2 px-3 mb-3"
												style="border-left: 6px solid #e84057; background-color: #fef9f9">
												<div class="d-flex">
													<div class="d-flex-cloumn flex-grow-1">
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
										<c:set var="match_ms"
											value="${match.info.gameEndTimestamp - match.info.gameStartTimestamp}" />
										<c:set var="match_sec" value="${(match_ms div 1000) mod 60}"></c:set>
										<c:set var="match_min"
											value="${(match_ms div (1000 * 60)) mod 60}"></c:set>
										<p class="mx-3">
											<c:if test="${match_min ne 0}">
												<fmt:formatNumber value="${match_min}" pattern="00" />분 
    													<fmt:formatNumber value="${match_sec}" pattern="00" />초
													</c:if>
											<c:if test="${match_min eq 0}">
												<fmt:formatNumber value="${match_sec}" pattern="00" />초
													</c:if>
										</p>

										<!-- 해당 매치가 현재 기준으로 어느 정도 지났는지  -->
										<c:set var="play_time"
											value="${(currentDate.toEpochMilli() - match.info.gameEndTimestamp) div 1000}" />
										<c:choose>
											<c:when test="${play_time < 0}">
												<div>0초 전</div>
											</c:when>
											<c:when test="${play_time >= 31536000}">
												<div>
													<fmt:formatNumber value="${play_time div 31536000}"
														pattern="#0" />년 전
												</div>
											</c:when>
											<c:when test="${play_time >= 2592000}">
												<div>
													<fmt:formatNumber value="${play_time div 2592000}"
														pattern="#0" />개월 전
												</div>
											</c:when>
											<c:when test="${play_time >= 86400}">
												<div>
													<fmt:formatNumber value="${play_time div 86400}"
														pattern="#0" />일 전
												</div>
											</c:when>
											<c:when test="${play_time >= 3600}">
												<div>
													<fmt:formatNumber value="${play_time div 3600}"
														pattern="#0" />시간 전
												</div>
											</c:when>
											<c:when test="${play_time >= 60}">
												<div>
													<fmt:formatNumber value="${play_time div 60}" pattern="#0" />분 전
												</div>
											</c:when>
											<c:otherwise>
												<div>
													<fmt:formatNumber value="${play_time}" pattern="#0" />초 전
												</div>
											</c:otherwise>
										</c:choose>
					</div>
					<!-- 해당 매치 소환사 본인의 K/D/A -->

					<div class="d-flex">
						<!-- 사용한 챔피언 -->
						<img
							src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/champion/${participant.championName}.png"
							onerror="this.onerror=null; this.src='/img/champion/${participant.championId}.png';"
							width="72px" height="72px" />

						<!-- 사용한 스펠 -->
						<div class="d-flex flex-column mx-2">
							<img src="/img/spell/${participant.summoner1Id}.png" alt="스펠1"
								width="32px" height="32px" /> <img class="mt-2" alt="스펠2"
								src="/img/spell/${participant.summoner2Id}.png" width="32px"
								height="32px" />
						</div>

						<!-- 사용한 특성 -->
						<div class="d-flex flex-column">
							<img
								src="/img/perk/${participant.perks.styles[0].selections[0].perk}.png"
								alt="특성1" width="32px" height="32px" />
							<img class="mt-2 p-1"
								src="/img/perk/${participant.perks.styles[1].style}.png"
								alt="특성2" width="32px" height="32px" />
						</div>

						<div class="mx-2"></div>

						<div class="d-flex flex-column text-center" style="width: 100px">
							<!-- KDA 관련 정보 -->
							<strong>${participant.kills} / <span class="text-danger">${participant.deaths}</span>
								/ ${participant.assists}
							</strong>
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
							<c:set var="multikill"
								value="${participant.pentaKills eq 0 ? (participant.quadraKills eq 0 ? (participant.tripleKills eq 0 ? (participant.doubleKills eq 0 ? '' : '더블킬') : '트리플킬') : '쿼드라킬') : '펜타킬'}"></c:set>
							<c:if test="${!empty multikill}">
								<span class="badge bg-danger">${multikill}</span>
							</c:if>
						</div>

						<div class="mx-2"></div>

						<!-- 사용한 아이템 -->
						<div class="d-flex flex-column">
							<div class="d-flex">
								<img class="mx-2"
									src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item0}.png"
									onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
									width="32px" height="32px"> <img class="mx-2"
									src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item1}.png"
									onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
									width="32px" height="32px"> <img class="mx-2"
									src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item2}.png"
									onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
									width="32px" height="32px"> <img class="mx-2"
									src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item3}.png"
									onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
									width="32px" height="32px"> <img class="mx-2"
									src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item4}.png"
									onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
									width="32px" height="32px"> <img class="mx-2"
									src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item5}.png"
									onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
									width="32px" height="32px"> <img class="mx-2"
									src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item6}.png"
									onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
									width="32px" height="32px">
							</div>
							<div class="d-flex p-2">
								<c:forEach var="team" items="${match.info.teams}">
									<c:if test="${team.win eq participant.win}">
										<c:set var="totalKillAssi"
											value="${((participant.kills + participant.assists) div team.objectives.champion.kills) * 100}" />
										<div class="text-danger fw-bold">
											킬관여
											<fmt:formatNumber value="${totalKillAssi}" pattern="##0" />
											%
										</div>
									</c:if>
								</c:forEach>
								<div class="mx-2">CS ${participant.totalMinionsKilled}</div>
							</div>
						</div>
					</div>
				</div>
				<div class="d-flex">
					<div class="d-flex align-items-center"
						style="min-width: 200px; font-size: 12px">
						<div class="d-flex-column" style="width: 100px">
							<c:forEach var="partyMember" items="${match.info.participants}"
								varStatus="status">
								<c:if test="${status.count < 6 }">
									<div class="d-flex mx-1 align-items-center">
										<img
											src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/champion/${partyMember.championName}.png"
											onerror="this.onerror=null; this.src='/img/champion/${partyMember.championId}.png';"
											width="16" height="16" />
										<div class="mx-1"
											style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis">
											<c:choose>
												<c:when
													test="${(not empty partyMember.summonerName) or (partyMember.summonerName ne '')}">
													<a class="text-dark" style="text-decoration: none"
														href="/summoner?gameName=${partyMember.summonerName}&tagLine=${partyMember.riotIdTagline}">${partyMember.summonerName}</a>
												</c:when>
												<c:otherwise>
													<a class="text-dark" style="text-decoration: none"
														href="/summoner?gameName=${partyMember.riotIdGameName}&tagLine=${partyMember.riotIdTagline}">${partyMember.riotIdGameName}</a>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="d-flex-column" style="width: 100px">
							<c:forEach var="partyMember" items="${match.info.participants}"
								varStatus="status">
								<c:if test="${status.count >= 6 }">
									<div class="d-flex mx-1 align-items-center">
										<img
											src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/champion/${partyMember.championName}.png"
											onerror="this.onerror=null; this.src='/img/champion/${partyMember.championId}.png';"
											width="16" height="16" />
										<div class="mx-1"
											style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis">
											<c:choose>
												<c:when
													test="${(not empty partyMember.summonerName) or (partyMember.summonerName ne '')}">
													<a class="text-dark" style="text-decoration: none"
														href="/summoner?gameName=${partyMember.summonerName}&tagLine=${partyMember.riotIdTagline}">${partyMember.summonerName}</a>
												</c:when>
												<c:otherwise>
													<a class="text-dark" style="text-decoration: none"
														href="/summoner?gameName=${partyMember.riotIdGameName}&tagLine=${partyMember.riotIdTagline}">${partyMember.riotIdGameName}</a>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
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