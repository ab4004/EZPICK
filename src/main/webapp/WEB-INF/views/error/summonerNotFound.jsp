<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZPICK</title>
</head>
<body>
	<!-- 네비게이션 영역-->
	<jsp:include page="../layout/nav.jsp"></jsp:include>

	<!-- 상단 영역 / 검색 후 소환사 정보(못찾은 경우) -->
	<header class="masthead_summoner"
		style="padding-top: 50px; height: 100%">
		<div class="container position-relative">
			<div class="row justify-content-center">
				<div class="col-xl-8">
					<div class="row">
						<div class="col text-white">
							<div class="text-center">
								<h2>해당 소환사 정보를 찾을 수 없습니다.</h2>
								<br>
								<div>현재 라이엇 ID 시스템이 변경되어 검색되지 않을 수도 있습니다.</div>
								<div>소환사 명과 태그를 다시 한번 확인해주세요.</div>
							</div>
							<div class="mt-5 text-center">
								<a class="m-2 btn btn-primary" href="/">메인으로</a>
								<a class="m-2 btn btn-dark" href="https://authenticate.riotgames.com/?client_id=opgg&method=riot_identity&platform=web&redirect_uri=https%3A%2F%2Fauth.riotgames.com%2Fauthorize%3Fclient_id%3Dopgg%26redirect_uri%3Dhttps%253A%252F%252Fmember.op.gg%252Foauth%252Frso%252Fcallback%26response_type%3Dcode%26scope%3Dopenid%2520cpid%2520offline_access%26state%3Df6a676aa-dc3f-42e7-b295-dfde19787290"><img src="./img/Riot.png" height="17px" width="17px"> 라이엇 ID 확인</a>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<!-- 빈 컨텐츠 영역 -->
	<div>
		
	</div>

	<!-- Footer-->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>