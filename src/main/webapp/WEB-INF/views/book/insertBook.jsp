<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>경기 일정 및 예매 데이터 삽입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="/webjars/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script src="/webjars/jquery/3.6.0/dist/jquery.min.js"></script>

<link href="/webjars/summernote/0.8.10/summernote-bs4.css"
	rel="stylesheet">
<script src="/webjars/summernote/0.8.10/summernote-bs4.min.js"></script>
</head>

<body>

	<div class="container mt-3">
		<h2>경기 일정 및 예매 데이터 삽입</h2>

		<div class="form-floating mb-3">
			<input type="text" class="form-control" id="date"
				placeholder="yyyy-MM-ddThh:mm:ss" name="date"> <label
				for="email">경기 날짜 (yyyy-MM-ddThh:mm:ss)</label>
		</div>

		<div class="form-floating mb-3">
			<input type="text" class="form-control" id="status"
				placeholder="Enter status" name="status"> <label
				for="status">경기 진행 상태 (예정 | 종료)</label>
		</div>

		<div class="form-floating mb-3">
			<input type="text" class="form-control" id="round"
				placeholder="Enter round" name="round"> <label for="round">경기
				라운드 (정규 시즌 1R | 정규 시즌 2R)</label>
		</div>

		<div class="mb-3">
			<p>매치 팀 (팀 이름 선택)</p>
			<div class="form-floating">
				<input class="form-control" list="homeTeams" name="homeTeam"
					id=homeTeam> <label for="homeTeam" class="form-label">홈
					팀</label>
				<datalist id="homeTeams">
					<option value="T1">
					<option value="DRX">
					<option value="피어엑스">
					<option value="젠지">
					<option value="kt 롤스터">
					<option value="OK저축은행 브리온">
					<option value="Dplus KIA">
					<option value="광동 프릭스">
					<option value="농심 레드포스">
					<option value="한화생명e스포츠">
				</datalist>
			</div>
			<div class="form-floating">
				<input class="form-control" list="awayTeams" name="awayTeam"
					id=awayTeam> <label for="awayTeam" class="form-label">원정
					팀</label>
				<datalist id="awayTeams">
					<option value="T1">
					<option value="DRX">
					<option value="피어엑스">
					<option value="젠지">
					<option value="kt 롤스터">
					<option value="OK저축은행 브리온">
					<option value="Dplus KIA">
					<option value="광동 프릭스">
					<option value="농심 레드포스">
					<option value="한화생명e스포츠">
				</datalist>
			</div>
		</div>

		<div class="form-floating mb-3">
			<input type="text"
				class="form-control" id="homeScore" placeholder="Enter homeScore"
				name="homeScore"> <label for="homeScore">홈 팀 승리 세트 수</label>
		</div>

		<div class="form-floating mb-3">
			<input type="text"
				class="form-control" id="versus" placeholder="Enter versus"
				name="versus"> <label for="versus">예정일 경우 ( : ) | 종료했을 경우 ( VS )</label> 
		</div>

		<div class="form-floating mb-3">
			<input type="text"
				class="form-control" id="awayScore" placeholder="Enter awayScore"
				name="awayScore"> <label for="awayScore">원정 팀 승리 세트 수</label>
		</div>

		<div class="form-floating mb-3">
			<input type="text"
				class="form-control" id="link" placeholder="Enter link" name="link"> <label for="link">예매 링크 (https://ticket.interpark.com/Contents/Sports/GoodsInfo?SportsCode=07032&TeamCode=PE015)</label>
		</div>

		<div class="form-floating mb-3">
			<input type="text"
				class="form-control" id="stadium" placeholder="Enter stadium"
				name="stadium"> <label for="stadium">경기 장소 (서울 LoL PARK)</label> 
		</div>


		<button id="btn-insertBook" class="btn btn-primary mb-3">경기 일정 및
			예매 데이터 삽입</button>
		<script src="/js/book.js"></script>
	</div>

</body>
</html>