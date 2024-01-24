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
		<form action="/action_page.php" class="was-validated">
			<h3>회원가입</h3>
			<div class="mb-3 mt-3">
				<label for="id" class="form-label">아이디:</label> <input type="text"
					class="form-control" id="id" placeholder="Enter id" name="id"
					required>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">필수 정보입니다.</div>
				<button class="btn btn-primary"
					id="get-user">중복검사</button>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">비밀번호:</label> <input
					type="password" class="form-control" id="password"
					placeholder="Enter password" name="password" required>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">필수 정보입니다.</div>
			</div>
			<div class="mb-3">
				<label for="name" class="form-label">이름:</label> <input type="text"
					class="form-control" id="name" placeholder="Enter name" name="name"
					required>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">필수 정보입니다.</div>
			</div>
			<div class="mb-3">
				<label for="nickname" class="form-label">닉네임:</label> <input
					type="text" class="form-control" id="nickname"
					placeholder="Enter nickname" name="nickname" required>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">필수 정보입니다.</div>
			</div>
			<div class="mb-3">
				<label for="phone" class="form-label">연락처:</label> <input type="tel"
					class="form-control" id="phone" placeholder="Enter phone"
					name="phone" required>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">필수 정보입니다.</div>
			</div>
			<button type="submit" id="register-user">확인</button>
		</form>
	</div>
	<script src="/js/user.js"></script>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>