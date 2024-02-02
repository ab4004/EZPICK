<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- summernate  종료 -->

</head>
<body style="font-family: 'Noto Sans KR', sans-serif;">
	<nav class="navbar navbar-light bg-light sticky-top border-bottom"
		style="background-color: #EEEEEE">

		<!-- 메인 아이콘 -->
		<div class="container-fluid px-5">
			<a class="navbar-brand" href="/"><img
				src="/img/ezpick_nav_icon.png"></a>

			<!-- 메뉴 목록 -->
			<div class="d-flex justify-content-center">
				<div class="btn-group nav_menu">
					<a class="navbar-brand mx-3" href="#">패치노트</a> <a
						class="navbar-brand mx-3" href="/board/boardList">커뮤니티</a> <a
						class="navbar-brand mx-3" href="/janAllDate?date=2024-01">경기 & 예매</a> <a
						class="navbar-brand mx-3" href="#">승부 예측</a> <a
						class="navbar-brand mx-3" href="#">뉴스</a>
				</div>
			</div>
			<c:choose>
				<c:when test="${empty user }">
					<!-- 로그인 영역 -->
					<a class="navbar-brand nav_sign" href="/auth/login"><i
						class="bi bi-person-circle"></i> Sign In</a>
				</c:when>
				<c:otherwise>
				<a class="navbar-brand mx-3" href="/auth/logout">로그아웃</a>
					<a class="navbar-brand nav_sign" href="/auth/myPage"><i
						class="bi bi-person-circle"></i> ${user.userNickname } 님</a>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>