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
    
  	<div class="mb-3">
      <label for="date">경기 날짜:</label>
      <input type="text" class="form-control" id="date" placeholder="Enter date" name="date">
    </div>
    
    <div class="mb-3">
      <label for="time">경기 시간:</label>
      <input type="text" class="form-control" id="time" placeholder="Enter time" name="time">
    </div>    
    
    <div class="mb-3">
      <label for="status">경기 진행 상태:</label>
      <input type="text" class="form-control" id="status" placeholder="Enter status" name="status">
    </div>
    
    <div class="mb-3">
      <label for="round">경기 라운드:</label>
      <input type="text" class="form-control" id="round" placeholder="Enter round" name="round">
    </div>
    
    <div class="mb-3">
      <label for="homeTeam">홈 팀:</label>
      <input type="text" class="form-control" id="homeTeam" placeholder="Enter homeTeam" name="homeTeam">
    </div>
    
    <div class="mb-3">
      <label for="awayTeam">원정 팀:</label>
      <input type="text" class="form-control" id="awayTeam" placeholder="Enter awayTeam" name="awayTeam">
    </div>
    
     <div class="mb-3">
      <label for="homeScore">홈 팀 승리 세트 수:</label>
      <input type="text" class="form-control" id="homeScore" placeholder="Enter homeScore" name="homeScore">
    </div>
    
    <div class="mb-3">
      <label for="versus">: or VS</label>
      <input type="text" class="form-control" id="versus" placeholder="Enter versus" name="versus">
    </div>
    
    <div class="mb-3">
      <label for="awayScore">원정 팀 승리 세트 수:</label>
      <input type="text" class="form-control" id="awayScore" placeholder="Enter awayScore" name="awayScore">
    </div>    
    
    <div class="mb-3">
      <label for="link">예매 링크:</label>
      <input type="text" class="form-control" id="link" placeholder="Enter link" name="link">
    </div>
    
    <div class="mb-3">
      <label for="stadium">경기 장소:</label>
      <input type="text" class="form-control" id="stadium" placeholder="Enter stadium" name="stadium">
    </div>
      

    <button id="btn-insertBook" class="btn btn-primary">경기 일정 및 예매 데이터 삽입</button>
   <script src="/js/book.js"></script>
</div>

</body>
</html>