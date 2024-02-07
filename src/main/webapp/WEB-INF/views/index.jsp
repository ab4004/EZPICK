<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>EZPICK</title>
</head>
<body class="totalBodyStyle">
	<!-- 네비게이션 영역-->
	<jsp:include page="./layout/nav.jsp"></jsp:include>

	<!-- 상단 영역 - 전적 검색 -->
	<header class="masthead" style="padding-top: 100px;">
		<div class="container position-relative">
			<div class="row justify-content-center">
				<div class="col-xl-6">
					<div class="text-center text-white">

						<!-- 프로젝트 로고 -->
						<div class="my-3">
							<img src="/img/ezpick.png">
						</div>

						<!-- 전적 검색 창 -->
						<form class="form-subscribe" action="/summoner" method="GET">
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<input type="text" class="form-control form-control-lg input-search"
											id="gameName" name="gameName" placeholder="소환사 이름"
											style="border-radius: 100px 0 0 100px; padding-left: 20px">
											
										<input type="text" class="form-control form-control-lg input-search"
											id="tagLine" name="tagLine" placeholder="태그">
											
										<button class="btn btn-dark btn-lg" id="submitButton"
											type="submit" style="border-radius: 0 100px 100px 0;">
											<i class="bi bi-search px-2"></i>
										</button>
									</div>
									<div class="col">
										<a class="btn btn-dark" href="https://status.riotgames.com/?locale=ko_KR" target="_blank">서버현황</a>
										<a class="mx-2 btn btn-dark" href="https://authenticate.riotgames.com/?client_id=opgg&method=riot_identity&platform=web&redirect_uri=https%3A%2F%2Fauth.riotgames.com%2Fauthorize%3Fclient_id%3Dopgg%26redirect_uri%3Dhttps%253A%252F%252Fmember.op.gg%252Foauth%252Frso%252Fcallback%26response_type%3Dcode%26scope%3Dopenid%2520cpid%2520offline_access%26state%3Df6a676aa-dc3f-42e7-b295-dfde19787290" target="_blank"><img src="./img/Riot.png" height="17px" width="17px"> 라이엇 ID 확인</a>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<!-- 중단 컨텐츠 영역 -->
	<section class="features-icons bg-light">
		<div class="container">
			<div class="d-flex-column">
				<h2 class="mb-4">14.3 패치노트</h2>
				<img alt="패치내역" src="https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt369a779b76843fd5/65c1f62a0872228f8e495383/LOL_14.3_Patch-Highlights_TW_1920x1080_KR.png" width="100%">
			</div>
		</div>
	</section>
	
	<!-- Footer-->
	<jsp:include page="./layout/footer.jsp"></jsp:include>
</body>
</html>