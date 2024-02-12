<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZPICK - 듀오찾기</title>
<style>
.position-images {
	display: flex;
	align-items: center;
	margin-top: 25px;
}

.position-images img {
	width: 50px;
	height: 50px;
}

.card-container {
	display: flex;
	flex-wrap: wrap;
	margin-top: 20px;
}

.card {
	width: calc(33.33% - 20px);
	margin-bottom: 20px;
	margin-right: 20px;
}

.btn-primary.modal-confirm-btn {
	margin-left: auto;
	display: flex;
	justify-content: flex-end;
	height: 50px;
	margin-top: 25px;
}

.image-button {
	background: none;
	border: none;
	padding: 0;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.image-button.clicked {
	/*background-color: #99dee1;*/
	border: 3px solid #99dee1;
}

.image-button img {
	width: 50px;
	height: 50px;
}
</style>
</head>
<body class="totalBodyStyle">
	<jsp:include page="../layout/search_nav.jsp"></jsp:include>
	<div class="container-fluid my-5 py-2 d-flex"
		style="height: 100px; background-color: #99dee1;">
		<div class="container h-100 d-flex align-items-center">
			<img alt="롤 이미지" src="/img/lol_logo_white.png" class="h-75">
		</div>
	</div>
	<div class="container my-1 flex-grow-1">
		<div class="d-flex">
			<div class="dropdown me-3">
				<label class="form-label"></label><select class="form-select"
					id="gameTypeSelection">
					<option value="솔로랭크">솔로랭크</option>
					<option value="자유랭크">자유랭크</option>
					<option value="일반">일반</option>
					<option value="칼바람">칼바람</option>
				</select>
			</div>
			<div class="dropdown me-2">
				<label class="form-label"></label><select class="form-select"
					id="tierSelection">
					<option value="챌린저">챌린저</option>
					<option value="그랜드마스터">그랜드마스터</option>
					<option value="마스터">마스터</option>
					<option value="다이아몬드">다이아몬드</option>
					<option value="에메랄드">에메랄드</option>
					<option value="플래티넘">플래티넘</option>
					<option value="골드">골드</option>
					<option value="실버">실버</option>
					<option value="브론즈">브론즈</option>
					<option value="아이언">아이언</option>
				</select>
			</div>
			<div
				class="position-images d-flex justify-content-center align-items-center mt-3.5">
				<input type="hidden" id="positionSelection" value="" />
				<button class="image-button mx-2" type="button" value="상관없이"
					onclick="selectPosition(this.value)">
					<img src="/img/position/fill.png"
						style="width: 35px; height: 35px;">
				</button>
				<button class="image-button mx-2" type="button" value="탑"
					onclick="selectPosition(this.value)">
					<img src="/img/position/top.png" style="width: 35px; height: 35px;">
				</button>
				<button class="image-button mx-2" type="button" value="정글"
					onclick="selectPosition(this.value)">
					<img src="/img/position/jgl.png" style="width: 35px; height: 35px;">
				</button>
				<button class="image-button mx-2" type="button" value="미드"
					onclick="selectPosition(this.value)">
					<img src="/img/position/mid.png" style="width: 35px; height: 35px;">
				</button>
				<button class="image-button mx-2" type="button" value="원딜"
					onclick="selectPosition(this.value)">
					<img src="/img/position/bot.png" style="width: 35px; height: 35px;">
				</button>
				<button class="image-button mx-2" type="button" value="서폿"
					onclick="selectPosition(this.value)">
					<img src="/img/position/spt.png" style="width: 35px; height: 35px;">
				</button>
				<button type="button" class="btn btn-outline-primary" id="search-duo">검색</button>
			</div>
			<button type="button" class="btn btn-primary modal-confirm-btn"
				data-bs-toggle="modal" data-bs-target="#myModal">글쓰기</button>
			<!-- The Modal -->
			<div class="modal" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">듀오찾기</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</div>
						<!-- Modal body -->
						<div class="modal-body">
							<div class="mb-3">
								<div style="display: flex; gap: 10px;">
									<div>
										<label class="form-label">큐 타입</label><select
											class="form-select" id="gameTypeModal">
											<option value="솔로랭크">솔로랭크</option>
											<option value="자유랭크">자유랭크</option>
											<option value="일반">일반</option>
											<option value="칼바람">칼바람</option>
										</select>
									</div>
									<div>
										<label class="form-label">나의 티어</label><select
											class="form-select" id="tierModal">
											<option value="챌린저">챌린저</option>
											<option value="그랜드마스터">그랜드마스터</option>
											<option value="마스터">마스터</option>
											<option value="다이아몬드">다이아몬드</option>
											<option value="에메랄드">에메랄드</option>
											<option value="플래티넘">플래티넘</option>
											<option value="골드">골드</option>
											<option value="실버">실버</option>
											<option value="브론즈">브론즈</option>
											<option value="아이언">아이언</option>
										</select>
									</div>
								</div>
								<div
									class="position-images d-flex justify-content-center align-items-center mt-3">
									찾고 있는 포지션 <input type="hidden" id="positionModal" value="" />
									<button class="image-button mx-2" type="button" value="상관없이"
										onclick="selectPosition(this.value)">
										<img src="/img/position/fill.png">
									</button>
									<button class="image-button mx-2" type="button" value="탑"
										onclick="selectPosition(this.value)">
										<img src="/img/position/top.png">
									</button>
									<button class="image-button mx-2" type="button" value="정글"
										onclick="selectPosition(this.value)">
										<img src="/img/position/jgl.png">
									</button>
									<button class="image-button mx-2" type="button" value="미드"
										onclick="selectPosition(this.value)">
										<img src="/img/position/mid.png">
									</button>
									<button class="image-button mx-2" type="button" value="원딜"
										onclick="selectPosition(this.value)">
										<img src="/img/position/bot.png">
									</button>
									<button class="image-button mx-2" type="button" value="서폿"
										onclick="selectPosition(this.value)">
										<img src="/img/position/spt.png">
									</button>
								</div>
							</div>
							<div class="mb-3">
								<label for="nickname" class="form-label">닉네임</label> <input
									type="text" class="form-control" id="duoNickname"
									placeholder="소환사명#태그" name="id">
							</div>
							<div class="mb-3">
								<label for="content" class="form-label">내용</label>
								<textarea class="form-control" id="duoContent" rows="3"
									placeholder="80자이내, 생략가능"></textarea>
							</div>
						</div>
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="insert-duo">글등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="card-container">
			<c:forEach var="list" items="${searchDuo }">
				<div class="card">
					<div class="card-header">${list.duoGameType }&nbsp${list.duoTier
						} ${list.duoPosition } 구함</div>
					<div class="card-body" style="height: 120px; display: flex">
						${list.duoContent } <span
							style="white-space: nowrap; margin-top: auto; margin-left: auto">${list.duoNickname }</span>
					</div>
					<div class="card-footer" style="display: flex;">
						<span>${list.duoWrtDate.format(DateTimeFormatter.ofPattern("HH:mm"))}</span>
						<span style="margin-left: auto;">${list.duoReTime }분 후 만료</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<script src="/js/duo.js"></script>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
