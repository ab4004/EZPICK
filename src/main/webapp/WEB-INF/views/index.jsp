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
						<form class="form-subscribe" id="summoner_search" action="/summoner" method="GET">
							<div class="row">
								<div class="col" style="min-width: 300px">
									<div class="input-group mb-3">
										<input type="text"
											class="form-control form-control-lg input-search"
											id="gameName" name="gameName" placeholder="소환사 이름"
											style="border-radius: 100px 0 0 100px; padding-left: 20px">

										<input type="text"
											class="form-control form-control-lg input-search"
											id="tagLine" name="tagLine" placeholder="태그">

										<button class="btn btn-dark btn-lg" id="submitButton"
											type="submit" style="border-radius: 0 100px 100px 0;">
											<i class="bi bi-search px-2"></i>
										</button>
									</div>
									<div class="col">
										<a class="btn btn-dark"
											href="https://status.riotgames.com/?locale=ko_KR"
											target="_blank" rel="noopener">서버현황</a> <a class="mx-2 btn btn-dark"
											href="https://authenticate.riotgames.com/?client_id=opgg&method=riot_identity&platform=web&redirect_uri=https%3A%2F%2Fauth.riotgames.com%2Fauthorize%3Fclient_id%3Dopgg%26redirect_uri%3Dhttps%253A%252F%252Fmember.op.gg%252Foauth%252Frso%252Fcallback%26response_type%3Dcode%26scope%3Dopenid%2520cpid%2520offline_access%26state%3Df6a676aa-dc3f-42e7-b295-dfde19787290"
											target="_blank" rel="noopener"><img src="./img/Riot.png" height="17px"
											width="17px"> 라이엇 ID 확인</a>
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
	<section class="flex-grow-1 features-icons bg-light">
		<div class="container-fluid" style="padding: 0;">
			<div class="d-flex-column">
				<div class="container">
					<div style="border: 1px solid #96D9D9"></div>
					<h1 class="d-flex align-items-center my-5" style="color: #96D9D9">
						<img class="me-3" alt="롤 아이콘" src="/img/lol_icon_gold.png" onerror="this.onerror=null; this.src='/img/lol_icon_black.png';"
							width="35" height="35" />${patch_title}
					</h1>

					<a href="${patch_link}" target="_blank" rel="noopener"><img class="rounded patch_image" alt="패치내역"
						src="${patch_image}"
						width="100%"></a>
						
					<!--스크롤 이미지 나타나기-->
					<script>
					$(document).ready(function() {
    					$(window).scroll(function(){
        					$('.patch_image').each(function(i){
            					var bottom_of_element = $(this).offset().top + $(this).outerHeight() / 5;
					            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
            					if (bottom_of_window > bottom_of_element) {
                					$(this).animate({'opacity':'1'},700);
            					}
        					}); 
    					});
					});
					</script>
				</div>
			</div>
			<div class="text-center">
				<h4>
					<a
						href="${patch_link}"
						target="_blank" rel="noopener"><span
						class="patch_more_button badge rounded-pill mt-5 px-5 py-3" style="background-color: #96D9D9;" name="patch_more_button">더보기</span></a>
				</h4>
			</div>
		</div>
	</section>

	<!-- Footer-->
	<jsp:include page="./layout/footer.jsp"></jsp:include>
</body>
</html>