<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layout/nav.jsp"></jsp:include>
	<div class="container mt-3">
		<h2>로그인</h2>
		<div class="mb-3 mt-3">
			<label for="id">아이디:</label> <input type="text" class="form-control"
				id="userId" placeholder="Enter id" name="id">
		</div>
		<div class="mb-3">
			<label for="password">비밀번호:</label> <input type="password"
				class="form-control" id="userPassword" placeholder="Enter password"
				name="password">
		</div>
		<button class="btn btn-primary" id="login-user">로그인</button>
		<button class="btn btn-primary"
			onclick="location.href='/auth/checkEmail'">회원가입</button>
		<button class="btn btn-primary" onclick="location.href='/auth/findId'">ID찾기</button>
		<button class="btn btn-primary" onclick="location.href='/auth/findPassword'">PW찾기</button>
	</div>
	<script src="/js/user.js"></script>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>