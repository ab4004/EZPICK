<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" type="text/css" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />

<!-- 글씨체 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">

<script src="/webjars/jquery/3.6.0/dist/jquery.min.js"></script>
<!-- summernote 시작 -->
<link href="/webjars/summernote/0.8.10/summernote-bs4.css"
	rel="stylesheet">
<script src="/webjars/summernote/0.8.10/summernote-bs4.min.js"></script>
<title>EZPICK</title>
</head>
<body
	style="background-color: #f8f9fa; font-family: 'Noto Sans KR', sans-serif;">
	<!-- 네비게이션 영역-->
	<jsp:include page="./layout/search_nav.jsp"></jsp:include>

	<!-- 상단 영역 / 검색 후 소환사 정보 -->
	<header class="masthead_summoner"
		style="padding-top: 105px; height: 50%; top: -55px; bottom: 55px">
		<div class="container position-relative">
			<!--  <div class="row">
				<div class="col-xl-8">
					<div class="row"> -->
			<div class="d-flex flex-grow-1 text-white">
				<div class="my-2 text-center">
					<img
						src="https://ddragon.leagueoflegends.com/cdn/14.1.1/img/profileicon/15.png"
						class="summoner_icon" onerror=this.src=
						"/img/minion.png" width="100px" height="100px">
					<div>
						<span class="badge bg-dark">123</span>
					</div>
				</div>
				<div class="mx-4 my-2 flex-grow-1">
					<h2>
						<strong>Hide on bush12312312312321</strong><span
							style="color: #9e9eb1; font-size: 0.5em"> #1234</span>
					</h2>
					<h5>
						<span class="badge bg-dark">Prev. 홍길동</span>
					</h5>
					<p style="white-space: nowrap">마지막 접속 : 24.01.01 00:00</p>
				</div>


				<div class="d-flex my-2 text-center justify-content-end">
					<div class="d-flex flex-column text-center mx-3">
						<span>솔로랭크</span>
						<div class="d-flex flex-fill justify-content-center">
							<img class="align-self-center" src="/img/rank/GRANDMASTER.png"
								width="100px" height="100px">
						</div>
						<strong>GRANDMASTER I</strong>
					</div>

					<div class="d-flex flex-column text-center mx-3">
						<span>자유랭크</span>
						<div class="d-flex flex-fill justify-content-center">
							<span class="align-self-center">해당 정보가 없습니다.</span>
						</div>
						<span>UNRANK</span>
					</div>
				</div>


			</div>
			<!-- </div>
			</div>
		</div> -->
	</header>

	<!-- 상단 버튼 영역 -->
	<div class="container d-flex mb-3">
		<div>
			<a class="btn btn-dark"
				href="https://www.leagueoflegends.com/ko-kr/champions/"
				target="_blank">챔피언 정보</a>
		</div>
	</div>

	<!-- 중단 컨텐츠 영역 -->
	<section class="bg-light" style="min-height: 1000px">
		<div class="container">
			<div class="d-flex">
				<div class="d-flex-column w-25">
					<div class="card" style="background-color: #f9fbfd">
						<div class="p-3">
							<strong class="mt-2">챔피언 모스트 TOP 10</strong>
						</div>
						<div class="d-flex p-3 border-top">
							<img class="rounded-circle align-self-center" alt="챔피언"
								src="/img/champion/110.png" width="40px" height="40px">
							<div class="d-flex-column">
								<div class="mx-3">Lv. 6</div>
								<div class="mx-3">Last. 00년 00월 00일</div>
							</div>
						</div>
						<div class="d-flex p-3 border-top">
							<img class="rounded-circle align-self-center" alt="챔피언"
								src="/img/champion/110.png" width="40px" height="40px">
							<div class="d-flex-column">
								<div class="mx-3">Lv. 6</div>
								<div class="mx-3">Last. 00년 00월 00일</div>
							</div>
						</div>
						<div class="d-flex p-3 border-top">
							<img class="rounded-circle align-self-center" alt="챔피언"
								src="/img/champion/110.png" width="40px" height="40px">
							<div class="d-flex-column">
								<div class="mx-3">Lv. 6</div>
								<div class="mx-3">Last. 00년 00월 00일</div>
							</div>
						</div>
						<div class="d-flex p-3 border-top">
							<img class="rounded-circle align-self-center" alt="챔피언"
								src="/img/champion/110.png" width="40px" height="40px">
							<div class="d-flex-column">
								<div class="mx-3">Lv. 6</div>
								<div class="mx-3">Last. 00년 00월 00일</div>
							</div>
						</div>
						<div class="d-flex p-3 border-top">
							<img class="rounded-circle align-self-center" alt="챔피언"
								src="/img/champion/110.png" width="40px" height="40px">
							<div class="d-flex-column">
								<div class="mx-3">Lv. 6</div>
								<div class="mx-3">Last. 00년 00월 00일</div>
							</div>
						</div>
						<div class="d-flex p-3 border-top">
							<img class="rounded-circle align-self-center" alt="챔피언"
								src="/img/champion/110.png" width="40px" height="40px">
							<div class="d-flex-column">
								<div class="mx-3">Lv. 6</div>
								<div class="mx-3">Last. 00년 00월 00일</div>
							</div>
						</div>
						<div class="d-flex p-3 border-top">
							<img class="rounded-circle align-self-center" alt="챔피언"
								src="/img/champion/110.png" width="40px" height="40px">
							<div class="d-flex-column">
								<div class="mx-3">Lv. 6</div>
								<div class="mx-3">Last. 00년 00월 00일</div>
							</div>
						</div>
						<div class="d-flex p-3 border-top">
							<img class="rounded-circle align-self-center" alt="챔피언"
								src="/img/champion/110.png" width="40px" height="40px">
							<div class="d-flex-column">
								<div class="mx-3">Lv. 6</div>
								<div class="mx-3">Last. 00년 00월 00일</div>
							</div>
						</div>
						<div class="d-flex p-3 border-top">
							<img class="rounded-circle align-self-center" alt="챔피언"
								src="/img/champion/110.png" width="40px" height="40px">
							<div class="d-flex-column">
								<div class="mx-3">Lv. 6</div>
								<div class="mx-3">Last. 00년 00월 00일</div>
							</div>
						</div>
						<div class="d-flex p-3 border-top">
							<img class="rounded-circle align-self-center" alt="챔피언"
								src="/img/champion/110.png" width="40px" height="40px">
							<div class="d-flex-column">
								<div class="mx-3">Lv. 6</div>
								<div class="mx-3">Last. 00년 00월 00일</div>
							</div>
						</div>
						<div class="d-flex p-3 border-top">
							<img class="rounded-circle align-self-center" alt="챔피언"
								src="/img/champion/110.png" width="40px" height="40px">
							<div class="d-flex-column">
								<div class="mx-3">Lv. 6</div>
								<div class="mx-3">Last. 00년 00월 00일</div>
							</div>
						</div>
						<div class="d-flex flex-grow-1"></div>
					</div>
				</div>
				<div class="mx-2"></div>

				<div class="flex-grow-1">
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
						<div class="d-flex card py-2 px-3 mb-3"
							style="border-left: 6px solid #5383e8; background-color: #f9fbfd">
							<div class="d-flex">
								<div class="d-flex-cloumn flex-grow-1">
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
												class="mt-2" src="/img/spell/4.png" width="32px"
												height="32px" />
										</div>

										<div class="mx-1"></div>

										<!-- KDA 관련 정보 -->
										<div class="d-flex flex-column text-center"
											style="width: 100px">
											<strong>10 / <span class="text-danger">1</span> / 5
											</strong> <span>KDA : 15.00</span> <span class="badge bg-danger">펜타킬</span>
										</div>

										<div class="mx-2"></div>

										<div class="d-flex flex-column">
											<div class="d-flex">
												<img class="mx-2" src="" width="32px" height="32px"
													style="background-color: #e6e6e6"> <img class="mx-2"
													src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/5.png"
													onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
													width="32px" height="32px"> <img class="mx-2"
													src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/5.png"
													onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
													width="32px" height="32px"> <img class="mx-2"
													src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/5.png"
													onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
													width="32px" height="32px"> <img class="mx-2"
													src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/5.png"
													onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
													width="32px" height="32px"> <img class="mx-2"
													src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/5.png"
													onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
													width="32px" height="32px"> <img class="mx-2"
													src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/5.png"
													onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
													width="32px" height="32px">
											</div>
											<div class="d-flex p-2">
												<span>CS 351</span>
											</div>
										</div>
									</div>
								</div>
								<div class="d-flex">
									<div class="d-flex-column"
										style="min-width: 75px; font-size: 12px">
										<div class="justify-content-center">닉네임</div>
										<div>닉네임</div>
										<div>닉네임</div>
										<div>닉네임</div>
										<div>닉네임</div>
									</div>
									<div class="d-flex-column" style="min-width: 75px">
										<div>닉네임</div>
										<div>닉네임</div>
										<div>닉네임</div>
										<div>닉네임</div>
										<div>닉네임</div>
									</div>
								</div>

								<!-- 상세매치 정보 버튼 -->
								<div class="d-flex" style="width: 40px">
									<button class="btn flex-grow-1 border" type="button"
										onclick="toggleContent('test1')">
										<i class="bi bi-chevron-compact-down"></i>
									</button>
								</div>
							</div>
						</div>
						<!-- 상세 버튼 클릭시 보이는 영역 -->
						<div class="d-flex-column card mb-2" id="test1"
							style="display: block; font-size: 12px">
							<div class="d-flex p-2">
								<div style="max-width: 30px;overflow: hidden; white-space: nowrap;">
									<img class="rounded-circle" alt="파티원챔피언"
										src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/champion/${partyEach.championName}.png"
										onerror="this.onerror=null; this.src='/img/champion/${partyEach.championId}.png';"
										width="30px" height="30px" />
								</div>
								<div class="d-flex mx-2 align-items-center"
									style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; width: 100px">
										<div style="font-size: 12px">가나다라마바사아자차카타파하</div>
								</div>
								<div class="d-flex mx-2">
									<img class="rounded me-1"
										src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${partyEach.item0}.png"
										onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
										width="28px" height="28px"> <img class="rounded me-1"
										src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${partyEach.item1}.png"
										onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
										width="28px" height="28px"> <img class="rounded me-1"
										src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${partyEach.item2}.png"
										onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
										width="28px" height="28px"> <img class="rounded me-1"
										src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${partyEach.item3}.png"
										onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
										width="28px" height="28px"> <img class="rounded me-1"
										src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${partyEach.item4}.png"
										onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
										width="28px" height="28px"> <img class="rounded me-1"
										src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${partyEach.item5}.png"
										onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
										width="28px" height="28px"> <img class="rounded me-1"
										src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${partyEach.item6}.png"
										onerror="this.onerror=null; this.src='default-image.png'; this.alt='아이템'"
										width="28px" height="28px">
								</div>
								<div class="d-flex align-items-center">
									<div class="mx-2">피해량</div>
									<div class="progress" style="width: 100px">
										<div class="progress-bar"
											style="width: ${(127389/247907) * 100}%"
											aria-valuenow="127389"
											aria-valuemin="0" aria-valuemax="${247907}"></div>
									</div>
									<div class="mx-2">받은 피해량</div>
									<div class="progress" style="width: 100px">
										<div class="progress-bar"
											style="width: ${(138900/247907) * 100}%"
											aria-valuenow="1389"
											aria-valuemin="0" aria-valuemax="247907"></div>
									</div>
								</div>
								<div class="d-flex-column text-center" style="width: 100px;">
									<div>30/15/24(2.32)</div>
								</div>
							</div>
						</div>
						
						
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer-->
	<jsp:include page="./layout/footer.jsp"></jsp:include>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

	<script>
		function toggleContent(test) {
			var testContent = document.getElementById(test);
			// content를 토글
			if (testContent.style.display == 'none') {
				testContent.style.display = 'block';
			} else {
				testContent.style.display = 'none';
			}
		}
	</script>
</body>
</html>