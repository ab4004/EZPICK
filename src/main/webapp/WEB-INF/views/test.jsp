<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZPICK</title>
</head>
<body>
	<!-- 네비게이션 영역-->
	<jsp:include page="./layout/nav.jsp"></jsp:include>

	<!-- 상단 영역 / 검색 후 소환사 정보 -->
	<header class="masthead_summoner"
		style="padding-top: 50px; height: 50%">
		<div class="container position-relative">
			<div class="row justify-content-center">
				<div class="col-xl-8">
					<div class="row">
						<div class="d-flex p-3 text-white">
							<div class="m-3 text-center">
								<img
									src="https://ddragon.leagueoflegends.com/cdn/14.1.1/img/profileicon/15.png"
									class="summoner_icon" onerror=this.src=
									"/img/minion.png" width="100px" height="100px">
								<div>
									<span class="badge bg-dark">123</span>
								</div>
							</div>
							<div class="m-2">
								<h2>
									<strong>홍길동</strong><span style="color: #9e9eb1"> #1234</span>
								</h2>
								<h5>
									<span class="badge bg-dark">Prev. 홍길동</span>
								</h5>
								<p>마지막 접속 : 24.01.01 00:00</p>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- 중단 컨텐츠 영역 -->
	<section class="features-icons bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-4"></div>
				<div>
					<!-- 매치기록 확인용 -->
					<div>
						<!-- 
						배경 색깔
						승리 : (연한색)#f9fbfd / (어두운색)#28344E
						패배 : (연한색)#fef9f9 / (어두운색)#59343b
						
						카드 앞쪽 선 색깔
						패배 : border-left: 6px solid #e84057
						승리 : border-left: 6px solid #5383e8
						-->
						<div class="d-flex card py-2 px-3"
							style="border-left: 6px solid #5383e8; background-color: #f9fbfd">
							<div class="d-flex">
								<!-- 승리 여부 -->
								<strong class="text-primary">승리</strong>
								<!-- 해당 매치 게임 모드 -->
								<p class="mx-3">소환사의 협곡</p>

							</div>

							<!-- 해당 매치 소환사 본인의 K/D/A -->

							<div class="d-flex">
								<!-- 사용한 챔피언 -->
								<img
									src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/champion/Aatrox.png"
									width="75px" height="75px" />

								<!-- 사용한 스펠 -->
								<div class="d-flex flex-column mx-2">
									<img src="/img/spell/3.png" width="32px" height="32px" /> <img
										class="mt-2" src="/img/spell/4.png" width="32px" height="32px" />
								</div>

								<div class="vr mx-3"></div>

								<!-- KDA 관련 정보 -->
								<div class="d-flex flex-column text-center" style="width: 100px">
									<strong>10 / <span class="text-danger">1</span> / 5</strong>
									<span>KDA : 15.00</span>
									<span class="badge bg-danger">펜타킬</span>
								</div>
								
								<div class="vr mx-3"></div>
								
								<div class="d-flex">
									<img class="mx-2" src="" width="32px" height="32px" style="background-color: #e6e6e6">
								</div>
								
							</div>

						</div>
					</div>
				</div>
				<div></div>
			</div>
		</div>
	</section>

	<!-- Footer-->
	<jsp:include page="./layout/footer.jsp"></jsp:include>
</body>
</html>