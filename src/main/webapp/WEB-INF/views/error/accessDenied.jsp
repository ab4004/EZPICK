<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZPICK</title>
</head>
<body style="display: flex; flex-direction: column; min-height: 100vh;">
	<!-- 네비게이션 영역-->
	<jsp:include page="../layout/search_nav.jsp"></jsp:include>

	<!-- 상단 영역 / 검색 후 소환사 정보(못찾은 경우) -->
	<header class="masthead_summoner"
		style="padding-top: 105px; height: 50%; top: -55px; bottom: 55px">
		<div class="container position-relative">
			<div class="row justify-content-center">
				<div class="col-xl-8">
					<div class="row">
						<div class="col text-white">
							<div class="text-center">
								<h2 class="text-danger">접근 거부 되었습니다.</h2>
							</div>
							<div class="mt-5 text-center">
								<a class="m-2 btn btn-dark" href="/">메인으로</a>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<!-- 빈 컨텐츠 영역 -->
	<div class="container mt-3 flex-grow-1">
		
	</div>

	<!-- Footer-->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>