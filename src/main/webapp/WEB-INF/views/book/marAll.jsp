<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기 일정 및 예매</title>

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

<body>
	<jsp:include page="../layout/nav.jsp"></jsp:include>

	<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<div class="container-fluid">		
		
		<ul class="navbar-nav mx-auto">
			<li class="nav-item" style="margin-right: 50px;"><a class="nav-link" 		 href="/janAllDate?date=2024-01">1월</a></li>
			<li class="nav-item" style="margin-right: 50px;"><a class="nav-link" 		 href="/febAllDate?date=2024-02">2월</a></li>
			<li class="nav-item" style="margin-right: 50px;"><a class="nav-link active"	 href="/marAllDate?date=2024-03">3월</a></li>
			<li class="nav-item" style="margin-right: 50px;"><a class="nav-link disabled" href="#menu1">4월</a></li>
			<li class="nav-item" style="margin-right: 50px;"><a class="nav-link disabled" href="#menu1">5월</a></li>
			<li class="nav-item" style="margin-right: 50px;"><a class="nav-link disabled" href="#menu1">6월</a></li>
			<li class="nav-item" style="margin-right: 50px;"><a class="nav-link disabled" href="#menu1">7월</a></li>
			<li class="nav-item" style="margin-right: 50px;"><a class="nav-link disabled" href="#menu1">8월</a></li>
			<li class="nav-item" style="margin-right: 50px;"><a class="nav-link disabled" href="#menu1">9월</a></li>
			<li class="nav-item" style="margin-right: 50px;"><a class="nav-link disabled" href="#menu1">10월</a></li>
			<li class="nav-item" style="margin-right: 50px;"><a class="nav-link disabled" href="#menu1">11월</a></li>
			<li class="nav-item" style="margin-right: 50px;"><a class="nav-link disabled" href="#menu1">12월</a></li>

		</ul>
	</div>
	</nav>


	<!--  -->	
	<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<div class="container-fluid">

			<ul class="navbar-nav mx-auto">
				<li class="nav-item" style="margin-right: 40px;"><a
					class="nav-link" href="/marAllDate?date=2024-03"
					data-active="true">전체</a></li>
				<li class="nav-item" style="margin-right: 40px;"><a
					class="nav-link" href="/marAll?date=2024-03&team=젠지" data-active="true">젠지</a></li>
				<li class="nav-item" style="margin-right: 40px;"><a
					class="nav-link" href="/marAll?date=2024-03&team=T1" data-active="false">T1</a></li>
				<li class="nav-item" style="margin-right: 40px;"><a
					class="nav-link" href="/marAll?date=2024-03&team=KT 롤스터" data-active="false">KT</a></li>
				<li class="nav-item" style="margin-right: 40px;"><a
					class="nav-link" href="/marAll?date=2024-03&team=한화생명 e스포츠" data-active="false">한화생명</a></li>
				<li class="nav-item" style="margin-right: 40px;"><a
					class="nav-link" href="/marAll?date=2024-03&team=Dplus KIA" data-active="false">DK</a></li>
				<li class="nav-item" style="margin-right: 40px;"><a
					class="nav-link" href="/marAll?date=2024-03&team=피어엑스" data-active="false">피어엑스</a></li>
				<li class="nav-item" style="margin-right: 40px;"><a
					class="nav-link" href="/marAll?date=2024-03&team=광동 프릭스" data-active="false">광동</a></li>
				<li class="nav-item" style="margin-right: 40px;"><a
					class="nav-link" href="/marAll?date=2024-03&team=OK저축은행 브리온" data-active="false">OK저축은행</a></li>
				<li class="nav-item" style="margin-right: 40px;"><a
					class="nav-link" href="/marAll?date=2024-03&team=DRX" data-active="false">DRX</a></li>
				<li class="nav-item" style="margin-right: 40px;"><a
					class="nav-link" href="/marAll?date=2024-03&team=농심 레드포스" data-active="false">농심</a></li>
			</ul>
		</div>
	</nav>

<!--  3월 전체 -->

	<div class="container mt-3">

		<c:forEach items="${marAll}" var="book" varStatus="loop">

			<c:if test="${loop.index eq 0 || marAll[loop.index - 1].time.toLocalDate() ne book.time.toLocalDate()}">
				<span class="table-title"> ${book.time.getMonthValue()}월
					${book.time.getDayOfMonth()}일 (${book.time.getDayOfWeek()}) </span>
			</c:if>

			<table class="table">
				<tbody>
					<tr>

						<td width="50" style="text-align: left; font-weight: bold;">${book.time.toLocalTime()}</td>
						<td width="50" style="text-align: center; color: gray; font-size: 15px;">${book.status}</td>
						<td width="100" style="text-align: center; color: gray; font-size: 15px;">${book.round}</td>

						<td width="300" style="text-align: right; font-size: 17px;" >${book.homeTeam}<c:if
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
							</c:if> <c:if test="${book.homeTeam eq 'KT 롤스터'}">
								<img src="/img/team/kt.png" alt="kt.png" width="35">
							</c:if> <c:if test="${book.homeTeam eq '농심 레드포스'}">
								<img src="/img/team/ns.png" alt="ns.png" width="35">
							</c:if> <c:if test="${book.homeTeam eq '한화생명 e스포츠'}">
								<img src="/img/team/hle.png" alt="hle.png" width="35">
							</c:if>
						</td>

						<td width="30" style="text-align: right; font-weight: bold; font-size: 18px;">${book.homeScore}</td>
						<td width="10" style="text-align: center; color: gray;">${book.versus}</td>
						<td width="30" style="text-align: left; font-weight: bold; font-size: 18px;">${book.awayScore}</td>

						<td width="300" style="text-align: left; font-size: 17px;" ><c:if
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
							</c:if> <c:if test="${book.awayTeam eq 'KT 롤스터'}">
								<img src="/img/team/kt.png" alt="Team Logo" width="35">
							</c:if> <c:if test="${book.awayTeam eq '젠지'}">
								<img src="/img/team/gen.png" alt="Team Logo" width="35">
							</c:if> <c:if test="${book.awayTeam eq '한화생명 e스포츠'}">
								<img src="/img/team/hle.png" alt="Team Logo" width="35">
							</c:if> ${book.awayTeam}</td>

						<td width="150" style="text-align: right">
						<button	class="btn btn-dark" id="btn-book"><a href="${book.link }"	style="text-decoration: none; color: #0d6efd; font-size: 14px;">
						<input type="hidden" value="${book.link}" />예매</a>
							</button></td>
							
						<td width="200" style="text-align: center; color: gray; font-size: 15px;">${book.stadium}</td>
					</tr>
				</tbody>
			</table>
			
			
					
		</c:forEach>
	</div>


	
	

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>