<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>EZPICK - 관리자</title>
<meta charset="utf-8">
</head>

<body class="totalBodyStyle">
	<jsp:include page="../layout/nav.jsp"></jsp:include>

	<div class="container mt-3 flex-grow-1">
		<h2 class="my-5">경기 일정 및 예매 데이터 삽입</h2>

		<p>경기 날짜 (yyyy-MM-ddThh:mm:ss)</p>
		<div class="d-flex">
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="year" placeholder="yyyy">
				<label>년도 : yyyy</label>
			</div>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="month" placeholder="MM">
				<label>월 : MM</label>
			</div>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="day" placeholder="dd">
				<label>일 : dd</label>
			</div>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="hour" placeholder="hh">
				<label>시간 : hh</label>
			</div>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="min" placeholder="mm">
				<label>분 : mm</label>
			</div>
		</div>

		<hr>

		<p>경기 진행 상태 (예정 | 종료)</p>
		<select class="form-select" id="status" name="status">
			<option value="예정">예정</option>
			<option value="종료">종료</option>
		</select>

		<hr>

		<p>경기 라운드 (정규 시즌 1R | 정규 시즌 2R)</p>
		<select class="form-select" id="round" name="round">
			<option value="정규 시즌 1R">정규 시즌 1R</option>
			<option value="정규 시즌 2R">정규 시즌 2R</option>
		</select>

		<hr>

		<div class="mb-3">
			<p>매치 팀 (팀 이름 선택)</p>
			<div class="d-flex">
				<span class="d-flex align-items-center me-3" style="white-space: nowrap;">홈 팀</span>
				<select class="form-select" id="homeTeam" name="homeTeam">
					<option value="T1">T1</option>
					<option value="DRX">DRX</option>
					<option value="피어엑스">피어엑스</option>
					<option value="젠지">젠지</option>
					<option value="kt 롤스터">kt 롤스터</option>
					<option value="OK저축은행 브리온">OK저축은행 브리온</option>
					<option value="Dplus KIA">Dplus KIA</option>
					<option value="광동 프릭스">광동 프릭스</option>
					<option value="농심 레드포스">농심 레드포스</option>
					<option value="한화생명e스포츠">한화생명e스포츠</option>
				</select>
			</div>
			<div class="d-flex">
				<span class="d-flex align-items-center me-3" style="white-space: nowrap;">원정 팀</span>
				<select class="form-select" id="awayTeam" name="awayTeam">
					<option value="T1">T1</option>
					<option value="DRX">DRX</option>
					<option value="피어엑스">피어엑스</option>
					<option value="젠지">젠지</option>
					<option value="kt 롤스터">kt 롤스터</option>
					<option value="OK저축은행 브리온">OK저축은행 브리온</option>
					<option value="Dplus KIA">Dplus KIA</option>
					<option value="광동 프릭스">광동 프릭스</option>
					<option value="농심 레드포스">농심 레드포스</option>
					<option value="한화생명e스포츠">한화생명e스포츠</option>
				</select>
			</div>
		</div>

		<hr>

		<div class="form-floating mb-3">
			<input type="text" class="form-control" id="homeScore"
				placeholder="Enter homeScore" name="homeScore"> <label
				for="homeScore">홈 팀 승리 세트 수</label>
		</div>

		<hr>

		<p>예정일 경우 ( VS ) | 종료했을 경우 ( : )</p>
		<select class="form-select" id="versus" name="versus">
			<option value="VS">VS</option>
			<option value=":">:</option>
		</select>

		<hr>

		<div class="form-floating mb-3">
			<input type="text" class="form-control" id="awayScore"
				placeholder="Enter awayScore" name="awayScore"> <label
				for="awayScore">원정 팀 승리 세트 수</label>
		</div>

		<hr>

		<p>예매 링크</p>
		<input type="text" class="form-control" id="link" name="link"
			value="https://ticket.interpark.com/Contents/Sports/GoodsInfo?SportsCode=07032&TeamCode=PE015">

		<hr>

		<p>경기 장소</p>
		<input type="text" class="form-control" id="stadium" name="stadium"
			value="서울 LoL PARK">

		<button id="btn-insertBook" class="btn btn-primary my-3">경기
			일정 및 예매 데이터 삽입</button>
		<script src="/js/book.js"></script>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>

</body>
</html>