<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>EZPICK - 경기 일정 및 예매</title>

<style>
#btn-book {
	background-color: transparent;
	padding: 2px 15px;
}

.table-title {
	background-color: #e9ecef;
	padding: 5px;
	font-weight: bold;
	font-size: 18px;
}
</style>

</head>

<body class="totalBodyStyle">
	<jsp:include page="../layout/search_nav.jsp"></jsp:include>

	<div class="container mt-3 flex-grow-1">
		<nav class="navbar navbar-expand-sm bg-light navbar-light">
			<div class="container-fluid">

				<!-- nav tabs -->
				<ul class="navbar-nav mx-auto">
					<c:forEach var="month" items="${months}">
						<c:set var="qt"
							value="${month > 3 ? (month > 6 ? (month > 9 ? 4 : 3) : 2) : 1}" />
						<c:set var="currentQt"
							value="${currentDate.getMonthValue() > 3 ? (currentDate.getMonthValue() > 6 ? (currentDate.getMonthValue() > 9 ? 4 : 3) : 2) : 1}" />
						<li class="nav-item" style="margin-right: 50px;"><c:choose>
								<c:when test="${qt eq currentQt}">
									<a class="nav-link active"
										style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis"
										href="/match?month=${month}">${month}월</a>
								</c:when>
								<c:otherwise>
									<a class="nav-link disabled"
										style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis"
										href="/match?month=${month}">${month}월</a>
								</c:otherwise>
							</c:choose></li>
					</c:forEach>
				</ul>
			</div>
		</nav>

		<!--  팀별 경기 일정 -->


		<nav class="navbar navbar-expand-sm bg-light navbar-light">
			<div class="container-fluid">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link" href="/match?month=${selectedMonth}"
						data-active="true">전체</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link" href="/match?month=${selectedMonth}&team=젠지"
						data-active="true">젠지</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link" href="/match?month=${selectedMonth}&team=T1"
						data-active="false">T1</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link" href="/match?month=${selectedMonth}&team=kt 롤스터"
						data-active="false">KT</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link"
						href="/match?month=${selectedMonth}&team=한화생명e스포츠"
						data-active="false">한화생명</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link"
						href="/match?month=${selectedMonth}&team=Dplus KIA"
						data-active="false">DK</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link" href="/match?month=${selectedMonth}&team=피어엑스"
						data-active="false">피어엑스</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link" href="/match?month=${selectedMonth}&team=광동 프릭스"
						data-active="false">광동</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link"
						href="/match?month=${selectedMonth}&team=OK저축은행 브리온"
						data-active="false">OK저축은행</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link" href="/match?month=${selectedMonth}&team=DRX"
						data-active="false">DRX</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link" href="/match?month=${selectedMonth}&team=농심 레드포스"
						data-active="false">농심</a></li>
				</ul>

			</div>
		</nav>

		<!--  경기 일정 (전체)-->


		<div class="container mt-3">
			<c:set var="checkDate" value="00월 00일 (X)"></c:set>

			<c:if test="${empty book}">
				<div class="mt-5 text-center">
					<h2>현재 경기 일정이 존재하지 않습니다.</h2>
				</div>
			</c:if>
			<c:if test="${!empty book}">
				<c:forEach items="${book}" var="book" varStatus="loop">
					<c:set var="dateTime" value="${book.date}" />

					<fmt:parseDate var="parsedDate" value="${dateTime}"
						pattern="yyyy-MM-dd'T'HH:mm" />

					<fmt:formatDate value="${parsedDate}" pattern="MM월 dd일 (E)"
						var="date" />

					<c:if test="${checkDate ne date}">
						<span class="table-title">${date}</span>
						<c:set var="checkDate" value="${date}"></c:set>
					</c:if>

					<table class="table mt-3">
						<tbody>
							<tr>
								<td width="50" style="text-align: left; font-weight: bold;"><fmt:formatDate
										value="${parsedDate}" pattern="HH:mm" /></td>

								<td width="50"
									style="text-align: center; color: gray; font-size: 15px;">${book.status}</td>

								<td width="100"
									style="text-align: center; color: gray; font-size: 15px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">${book.round}</td>

								<td width="300" style="text-align: right; font-size: 17px;">${book.homeTeam}<c:if
										test="${book.homeTeam eq 'DRX'}">
										<img src="/img/team/drx.png" alt="drx.png" width="35">
									</c:if> <c:if test="${book.homeTeam eq '피어엑스'}">
										<img src="/img/team/fox.png" alt="fox.png" width="35">
									</c:if> <c:if test="${book.homeTeam eq 'T1'}">
										<img src="/img/team/t1.png" alt="t1.png" width="35">
									</c:if> <c:if test="${book.homeTeam eq 'OK저축은행 브리온'}">
										<img src="/img/team/bro.png" alt="bro.png" width="35">
									</c:if> <c:if test="${book.homeTeam eq '젠지'}">
										<img src="/img/team/gen.png" alt="gen.png" width="35">
									</c:if> <c:if test="${book.homeTeam eq 'Dplus KIA'}">
										<img src="/img/team/dk.png" alt="dk.png" width="35">
									</c:if> <c:if test="${book.homeTeam eq '광동 프릭스'}">
										<img src="/img/team/kdf.png" alt="kdf.png" width="35">
									</c:if> <c:if test="${book.homeTeam eq 'kt 롤스터'}">
										<img src="/img/team/kt.png" alt="kt.png" width="35">
									</c:if> <c:if test="${book.homeTeam eq '농심 레드포스'}">
										<img src="/img/team/ns.png" alt="ns.png" width="35">
									</c:if> <c:if test="${book.homeTeam eq '한화생명e스포츠'}">
										<img src="/img/team/hle.png" alt="hle.png" width="35">
									</c:if>
								</td>

								<td width="30"
									style="text-align: right; font-weight: bold; font-size: 18px;">${book.homeScore}</td>
								<td width="10" style="text-align: center; color: gray;">${book.versus}</td>
								<td width="30"
									style="text-align: left; font-weight: bold; font-size: 18px;">${book.awayScore}</td>

								<td width="300" style="text-align: left; font-size: 17px;"><c:if
										test="${book.awayTeam eq 'DRX'}">
										<img src="/img/team/drx.png" alt="Team Logo" width="35">
									</c:if> <c:if test="${book.awayTeam eq '농심 레드포스'}">
										<img src="/img/team/ns.png" alt="Team Logo" width="35">
									</c:if> <c:if test="${book.awayTeam eq 'T1'}">
										<img src="/img/team/t1.png" alt="Team Logo" width="35">
									</c:if> <c:if test="${book.awayTeam eq '광동 프릭스'}">
										<img src="/img/team/kdf.png" alt="Team Logo" width="35">
									</c:if> <c:if test="${book.awayTeam eq '피어엑스'}">
										<img src="/img/team/fox.png" alt="Team Logo" width="35">
									</c:if> <c:if test="${book.awayTeam eq 'Dplus KIA'}">
										<img src="/img/team/dk.png" alt="Team Logo" width="35">
									</c:if> <c:if test="${book.awayTeam eq 'OK저축은행 브리온'}">
										<img src="/img/team/bro.png" alt="Team Logo" width="35">
									</c:if> <c:if test="${book.awayTeam eq 'kt 롤스터'}">
										<img src="/img/team/kt.png" alt="Team Logo" width="35">
									</c:if> <c:if test="${book.awayTeam eq '젠지'}">
										<img src="/img/team/gen.png" alt="Team Logo" width="35">
									</c:if> <c:if test="${book.awayTeam eq '한화생명e스포츠'}">
										<img src="/img/team/hle.png" alt="Team Logo" width="35">
									</c:if> ${book.awayTeam}</td>

								<td width="150" style="text-align: right"><c:choose>
										<c:when test="${book.date <= currentDate}">
											<button class="btn btn-dark disabled" id="btn-book">
												<span style="color: #0d6efd; font-size: 14px;">종료</span>
											</button>
										</c:when>
										<c:otherwise>
											<button class="btn btn-dark" id="btn-book">
												<a href="${book.link}" target="_blank"
													style="text-decoration: none; color: #0d6efd; font-size: 14px;">
													<input type="hidden" value="${book.link}" />예매
												</a>
											</button>
										</c:otherwise>
									</c:choose></td>
								<td width="200"
									style="text-align: center; color: gray; font-size: 15px;">${book.stadium}</td>
							</tr>
						</tbody>
					</table>
				</c:forEach>
			</c:if>

		</div>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>