<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>EZPICK</title>
</head>
<body>
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
										<a class="btn btn-dark">챔피언 분석</a>
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
	<section class="features-icons bg-light text-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<i class="bi-window m-auto text-primary"></i>
						</div>
						<h3>Fully Responsive</h3>
						<p class="lead mb-0">This theme will look great on any device,
							no matter the size!</p>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<i class="bi-layers m-auto text-primary"></i>
						</div>
						<h3>Bootstrap 5 Ready</h3>
						<p class="lead mb-0">Featuring the latest build of the new
							Bootstrap 5 framework!</p>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="features-icons-item mx-auto mb-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<i class="bi-terminal m-auto text-primary"></i>
						</div>
						<h3>Easy to Use</h3>
						<p class="lead mb-0">Ready to use with your own content, or
							customize the source files!</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Footer-->
	<jsp:include page="./layout/footer.jsp"></jsp:include>
</body>
</html>