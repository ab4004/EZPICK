<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>EZPICK - 승부예측</title>

<style>
.table-predTitle {
	background-color: #e9ecef;
	font-size: 18px;
}
</style>
</head>

<body class="totalBodyStyle">
	<jsp:include page="../layout/search_nav.jsp"></jsp:include>

	<div class="container mt-3 flex-grow-1">
		<div class="container mt-3 text-center">
			<a class="btn btn-outline-secondary me-1"
				href="/pred?startDate=2024-01-17T00:00:00&endDate=2024-01-21T23:59:59">
				<span class="small">종료</span><br> <span
				style="text-decoration: none; color: #212529; font-size: 16px;"><span
					style="font-size: 20px;">1</span>주차</span>
			</a> <a class="btn btn-outline-secondary me-1"
				href="/pred?startDate=2024-01-24T00:00:00&endDate=2024-01-28T23:59:59">
				<span class="small">종료</span><br> <span
				style="text-decoration: none; color: #212529; font-size: 16px;"><span
					style="font-size: 20px;">2</span>주차</span>
			</a> <a class="btn btn-outline-secondary me-1"
				href="/pred?startDate=2024-01-31T00:00:00&endDate=2024-02-04T23:59:59">
				<span class="small">종료</span><br> <span
				style="text-decoration: none; color: #212529; font-size: 16px;"><span
					style="font-size: 20px;">3</span>주차</span>
			</a> <a class="btn btn-outline-secondary me-1"
				href="/pred?startDate=2024-02-14T00:00:00&endDate=2024-02-18T23:59:59">
				<span class="small">종료</span><br> <span
				style="text-decoration: none; color: #212529; font-size: 16px;"><span
					style="font-size: 20px;">4</span>주차</span>
			</a> <a class="btn btn-outline-secondary me-1"
				href="/pred?startDate=2024-02-21T00:00:00&endDate=2024-02-25T23:59:59">
				<span class="small">종료</span><br> <span
				style="text-decoration: none; color: #212529; font-size: 16px;"><span
					style="font-size: 20px;">5</span>주차</span>
			</a> <a class="btn btn-outline-secondary me-1"
				href="/pred?startDate=2024-02-28T00:00:00&endDate=2024-03-03T23:59:59">
				<span class="small">진행 중</span><br> <span
				style="text-decoration: none; color: #212529; font-size: 16px;"><span
					style="font-size: 20px;">6</span>주차</span>
			</a> <a class="btn btn-outline-secondary me-1 disabled"
				href="/pred?startDate=2024-03-06T00:00:00&endDate=2024-03-10T23:59:59">
				<span class="small">예정</span><br> <span
				style="text-decoration: none; color: #212529; font-size: 16px;"><span
					style="font-size: 20px;">7</span>주차</span>
			</a> <a class="btn btn-outline-secondary me-1 disabled"
				href="/pred?startDate=2024-03-13T00:00:00&endDate=2024-03-17T23:59:59">
				<span class="small">예정</span><br> <span
				style="text-decoration: none; color: #212529; font-size: 16px;"><span
					style="font-size: 20px;">8</span>주차</span>
			</a> <a class="btn btn-outline-secondary me-1 disabled"
				href="/pred?startDate=2024-03-20T00:00:00&endDate=2024-03-24T23:59:59">
				<span class="small">예정</span><br> <span
				style="text-decoration: none; color: #212529; font-size: 16px;"><span
					style="font-size: 20px;">9</span>주차</span>
			</a>
		</div>

		<br>

		<div class="row mt-4">
			<div class="container mt-3 col-md-8 mb-5">
				<c:if test="${empty pred}">
					<div class="text-center mt-5">
						<h3>승부예측 가능한 경기가 존재하지 않습니다.</h3>
					</div>
				</c:if>
				<c:if test="${!empty pred}">
					<c:forEach items="${pred}" var="pred" varStatus="loop">

						<span class="table-predTitle mb-3 px-2 py-1 fw-bold"> <c:set
								var="dateTime" value="${pred.date}" /> <fmt:parseDate
								var="parsedDate" value="${dateTime}"
								pattern="yyyy-MM-dd'T'HH:mm" /> <fmt:formatDate
								value="${parsedDate}" pattern="MM월 dd일 (E) HH:mm" /> &nbsp;
							&nbsp; &nbsp;<span style="color: #6f42c1; font-size: 16px;">${pred.status}
						</span>
						</span>

						<table class="table mb-4 mt-1" style="min-width: 880px">
							<tbody>
								<tr>
									<td width="300">
										<c:set var="checkHomePick" value="0" />
										<c:if test="${!empty pick}">
											<c:forEach var="myPick" items="${pick}">
												<c:if test="${myPick[0].id eq pred.id and myPick[1] eq 1}">
													<c:set var="checkHomePick" value="1" />
												</c:if>
											</c:forEach>
										</c:if>
										<c:choose>
											<c:when test="${checkHomePick eq 1 and pred.status ne '종료'}">
												<button
													class="btn btn-home container-fluid text-start fw-bold fs-5"
													id="choice-btn" value="${pred.id}"
													style="padding: 7px 20px; background: linear-gradient(90deg, #6AE4FA, #C4E9EB, white); border: none; outline: none;">
											</c:when>
											<c:when test="${checkHomePick eq 1 and pred.status eq '종료'}">
												<button
													class="btn btn-home container-fluid text-start fw-bold fs-5 disabled"
													id="choice-btn" value="${pred.id}"
													style="padding: 7px 20px; background: linear-gradient(90deg, #C4E9EB, white); border: none; outline: none;">
											</c:when>
											<c:when test="${checkHomePick ne 1 and pred.status ne '종료'}">
												<button
													class="btn btn-home container-fluid text-start fw-bold fs-5"
													id="choice-btn" value="${pred.id}"
													style="padding: 7px 20px;">
											</c:when>
											<c:otherwise>
												<button
													class="btn btn-home container-fluid text-start fw-bold fs-5 disabled"
													id="choice-btn" value="${pred.id}"
													style="padding: 7px 20px;">
											</c:otherwise>
										</c:choose>
										<c:if test="${pred.homeTeam eq 'DRX'}">
											<img src="/img/team/drx.png" alt="drx.png" width="50">
										</c:if> <c:if test="${pred.homeTeam eq '피어엑스'}">
											<img src="/img/team/fox.png" alt="fox.png" width="50">
										</c:if> <c:if test="${pred.homeTeam eq 'T1'}">
											<img src="/img/team/t1.png" alt="t1.png" width="50">
										</c:if> <c:if test="${pred.homeTeam eq 'OK저축은행 브리온'}">
											<img src="/img/team/bro.png" alt="bro.png" width="50">
										</c:if> <c:if test="${pred.homeTeam eq '젠지'}">
											<img src="/img/team/gen.png" alt="gen.png" width="50">
										</c:if> <c:if test="${pred.homeTeam eq 'Dplus KIA'}">
											<img src="/img/team/dk.png" alt="dk.png" width="50">
										</c:if> <c:if test="${pred.homeTeam eq '광동 프릭스'}">
											<img src="/img/team/kdf.png" alt="kdf.png" width="50">
										</c:if> <c:if test="${pred.homeTeam eq 'kt 롤스터'}">
											<img src="/img/team/kt.png" alt="kt.png" width="50">
										</c:if> <c:if test="${pred.homeTeam eq '농심 레드포스'}">
											<img src="/img/team/ns.png" alt="ns.png" width="50">
										</c:if> <c:if test="${pred.homeTeam eq '한화생명e스포츠'}">
											<img src="/img/team/hle.png" alt="hle.png" width="50">
										</c:if> ${pred.homeTeam}

										</button></td>

									<td width="100"
										style="text-align: right; font-weight: bold; font-size: 25px; padding: 20px;">${pred.homeScore}</td>
									<td width="50"
										style="text-align: center; color: gray; font-size: 25px; padding: 20px;">${pred.versus}</td>
									<td width="100"
										style="text-align: left; font-weight: bold; font-size: 25px; padding: 20px;">${pred.awayScore}</td>

									<td width="300">
									<c:set var="checkAwayPick" value="0" />
										<c:if test="${!empty pick}">
											<c:forEach var="myPick" items="${pick}">
												<c:if test="${myPick[0].id eq pred.id and myPick[1] eq 2}">
													<c:set var="checkAwayPick" value="1" />
												</c:if>
											</c:forEach>
										</c:if>
										<c:choose>
											<c:when test="${checkAwayPick eq 1 and pred.status ne '종료'}">
												<button
													class="btn btn-away container-fluid text-end fw-bold fs-5"
													id="choice-btn" value="${pred.id}"
													style="padding: 7px 20px; background: linear-gradient(90deg, white, #C4E9EB, #6AE4FA); border: none; outline: none;">
											</c:when>
											<c:when test="${checkAwayPick eq 1 and pred.status eq '종료'}">
												<button
													class="btn btn-away container-fluid text-end fw-bold fs-5 disabled"
													id="choice-btn" value="${pred.id}"
													style="padding: 7px 20px; background: linear-gradient(90deg, white, #C4E9EB); border: none; outline: none;">
											</c:when>
											<c:when test="${checkAwayPick ne 1 and pred.status ne '종료'}">
												<button
													class="btn btn-away container-fluid text-end fw-bold fs-5"
													id="choice-btn" value="${pred.id}"
													style="padding: 7px 20px;">
											</c:when>
											<c:otherwise>
												<button
													class="btn btn-away container-fluid text-end fw-bold fs-5 disabled"
													id="choice-btn" value="${pred.id}"
													style="padding: 7px 20px;">
											</c:otherwise>
										</c:choose>
										${pred.awayTeam} <c:if test="${pred.awayTeam eq 'DRX'}">
											<img src="/img/team/drx.png" alt="Team Logo" width="50">
										</c:if> <c:if test="${pred.awayTeam eq '농심 레드포스'}">
											<img src="/img/team/ns.png" alt="Team Logo" width="50">
										</c:if> <c:if test="${pred.awayTeam eq 'T1'}">
											<img src="/img/team/t1.png" alt="Team Logo" width="50">
										</c:if> <c:if test="${pred.awayTeam eq '광동 프릭스'}">
											<img src="/img/team/kdf.png" alt="Team Logo" width="50">
										</c:if> <c:if test="${pred.awayTeam eq '피어엑스'}">
											<img src="/img/team/fox.png" alt="Team Logo" width="50">
										</c:if> <c:if test="${pred.awayTeam eq 'Dplus KIA'}">
											<img src="/img/team/dk.png" alt="Team Logo" width="50">
										</c:if> <c:if test="${pred.awayTeam eq 'OK저축은행 브리온'}">
											<img src="/img/team/bro.png" alt="Team Logo" width="50">
										</c:if> <c:if test="${pred.awayTeam eq 'kt 롤스터'}">
											<img src="/img/team/kt.png" alt="Team Logo" width="50">
										</c:if> <c:if test="${pred.awayTeam eq '젠지'}">
											<img src="/img/team/gen.png" alt="Team Logo" width="50">
										</c:if> <c:if test="${pred.awayTeam eq '한화생명e스포츠'}">
											<img src="/img/team/hle.png" alt="Team Logo" width="50">
										</c:if>
										</button></td>

								</tr>
							</tbody>
						</table>

					</c:forEach>
				</c:if>
			</div>

			<div class="col-md-4 user-ranking">

				<!-- 사이드바 영역 -->
				<div>
					<div class="text-center">
						<h5>[ 2024 LCK Spring 승부 예측 랭킹 ]</h5>
					</div>

					<table class="table" border="2">
						<c:if test="${empty rank}">
							<div class="mt-5 text-center">
								<h5>현재 예측 랭킹이 존재하지 않습니다.</h5>
							</div>
						</c:if>

						<c:if test="${!empty rank}">
							<thead style="background-color: #e9ecef;">
								<th class="text-center">순위</th>
								<th style="padding-right: 70px;">사용자</th>
								<th style="padding-right: 10px; text-align: center;">적중</th>
								<th class="text-center">적중률</th>
							</thead>

							<tbody>
								<c:set value="1" var="count" />
								<c:set value="1" var="currentCount" />
								<c:set value="0" var="previousSumHits" />
								<c:forEach items="${rank}" var="currentRank" varStatus="loop">
									<tr>
										<c:if test="${loop.index eq 0}">
											<c:set var="previousSumHits" value="${currentRank[1]}"></c:set>
											<td style="margin-right: 10px; text-align: center;">${currentCount}</td>
											<td style="margin-right: 30px;">${currentRank[0].userNickname}</td>
											<td style="text-align: center;">${currentRank[1]}</td>
											<td style="margin-right: 10px; text-align: center;">${Math.round(currentRank[1]/totalMatch*100)}%</td>
										</c:if>

										<c:if
											test="${loop.index > 0 && previousSumHits eq currentRank[1]}">
											<td style="margin-right: 10px; text-align: center;">${currentCount}</td>
											<c:set value="${count + 1}" var="count" />
											<td style="margin-right: 30px;">${currentRank[0].userNickname}</td>
											<td style="text-align: center;">${currentRank[1]}</td>
											<td style="margin-right: 10px; text-align: center;">${Math.round(currentRank[1]/totalMatch*100)}%</td>
										</c:if>

										<c:if
											test="${loop.index > 0 && previousSumHits ne currentRank[1]}">
											<c:set var="previousSumHits" value="${currentRank[1]}"></c:set>
											<td style="margin-right: 10px; text-align: center;">${count + currentCount}</td>
											<c:set value="${count + currentCount}" var="currentCount" />
											<c:set value="1" var="count" />
											<td style="margin-right: 30px;">${currentRank[0].userNickname}</td>
											<td style="text-align: center;">${currentRank[1]}</td>
											<td style="margin-right: 10px; text-align: center;">${Math.round(currentRank[1]/totalMatch*100)}%</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
					</table>
				</div>
			</div>
		</div>
		<!--  div class="row" 끝부분 -->
			</div>
			<!--  div class="container mt-3 flex-grow-1" 끝부분 -->

			<jsp:include page="../layout/footer.jsp"></jsp:include>
			<script src="/js/pred.js"></script>
</body>
</html>