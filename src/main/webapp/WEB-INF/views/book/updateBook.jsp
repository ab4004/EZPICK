<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>EZPICK - 관리자</title>

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
	<jsp:include page="../layout/nav.jsp"></jsp:include>

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
										href="/admin/updateBook?month=${month}">${month}월</a>
								</c:when>
								<c:otherwise>
									<a class="nav-link disabled"
										style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis"
										href="/admin/updateBook?month=${month}">${month}월</a>
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
						class="nav-link" href="/admin/updateBook?month=${selectedMonth}"
						data-active="true">전체</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link" href="/admin/updateBook?month=${selectedMonth}&team=젠지"
						data-active="true">젠지</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link" href="/admin/updateBook?month=${selectedMonth}&team=T1"
						data-active="false">T1</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link" href="/admin/updateBook?month=${selectedMonth}&team=kt 롤스터"
						data-active="false">KT</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link"
						href="/admin/updateBook?month=${selectedMonth}&team=한화생명e스포츠"
						data-active="false">한화생명</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link"
						href="/admin/updateBook?month=${selectedMonth}&team=Dplus KIA"
						data-active="false">DK</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link" href="/admin/updateBook?month=${selectedMonth}&team=피어엑스"
						data-active="false">피어엑스</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link" href="/admin/updateBook?month=${selectedMonth}&team=광동 프릭스"
						data-active="false">광동</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link"
						href="/admin/updateBook?month=${selectedMonth}&team=OK저축은행 브리온"
						data-active="false">OK저축은행</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link" href="/admin/updateBook?month=${selectedMonth}&team=DRX"
						data-active="false">DRX</a></li>
					<li class="nav-item" style="margin-right: 40px;"><a
						class="nav-link" href="/admin/updateBook?month=${selectedMonth}&team=농심 레드포스"
						data-active="false">농심</a></li>
				</ul>

			</div>
		</nav>

		<!--  경기 일정 (전체)-->
		<div class="container mt-3">
			<div class="d-flex my-3">
				<span class="badge bg-danger me-2">참고</span>
				<span class="me-2">"yyyy-MM-ddThh:mm"</span>
				<span class="me-2">"[예정|종료]"</span>
				<span class="me-2">"[정규 시즌 1R|정규 시즌 2R]"</span>
				<span class="me-2">"홈팀"</span>
				<span class="me-2">"[VS(예정)|:(종료)]"</span>
				<span class="me-2">"원정팀"</span>
				<span class="me-2">"링크"</span>
				<span class="me-2">"장소"</span>
				<span class="me-2">"[1 (홈) | 2 (원정)]"</span>
			</div>
			
			<hr>
			
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
								<td width="100" style="text-align: left; font-weight: bold;"><input type="text" value="${book.date}" id="date" style="width: 150px;"></td>

								<td width="50"
									style="text-align: center; color: gray; font-size: 15px;"><input type="text" value="${book.status}" id="status" style="width: 50px;"></td>

								<td width="100"
									style="text-align: center; color: gray; font-size: 15px;"><input type="text" value="${book.round}" id="round" style="width: 100px;"></td>

								<td width="100" style="text-align: right; font-size: 17px;"><input type="text" value="${book.homeTeam}" id="homeTeam" style="width: 100px;"></td>

								<td width="30"
									style="text-align: right; font-weight: bold; font-size: 18px;"><input type="text" value="${book.homeScore}" id="homeScore" style="width: 20px;"></td>
									
								<td width="10" style="text-align: center; color: gray;"><input type="text" value="${book.versus}" id="versus" style="width: 30px;"></td>
								
								<td width="30"
									style="text-align: left; font-weight: bold; font-size: 18px;"><input type="text" value="${book.awayScore}" id="awayScore" style="width: 20px;"></td>

								<td width="100" style="text-align: left; font-size: 17px;"><input type="text" value="${book.awayTeam}" id="awayTeam" style="width: 100px;"></td>

								<td width="100" style="text-align: right"><input type="text" value="${book.link}" id="link" style="width: 100px;"></td>
								
								<td width="100"
									style="text-align: center; color: gray; font-size: 15px;"><input type="text" value="${book.stadium}" id="stadium" style="width: 100px;"></td>
								
								<td width="100"><input type="text" value="${book.result}" id="result" style="width: 50px;"></td>
								
								<td>
									<button class="btn btn-warning btn-updateBook" data-updateid="${book.id}" style="white-space: nowrap;">수정</button>
								</td>
								<td>
									<input type="hidden" value="${book.id}" id="bookId">
									<button class="btn btn-danger btn-deleteBook" data-deleteid="${book.id}" style="white-space: nowrap;">삭제</button>
								</td>
							</tr>
						</tbody>
					</table>
				</c:forEach>
			</c:if>

		</div>
		<script src="/js/book.js"></script>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>