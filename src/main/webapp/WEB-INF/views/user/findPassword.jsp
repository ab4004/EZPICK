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
		<h2>비밀번호 찾기</h2>
		<div class="mb-3">
			<label for="id">아이디:</label> <input type="text" class="form-control"
				id="userId" name="id" placeholder="Enter id">
		</div>
		<div class="mb-3">
			<label for="userEmail">이메일:</label> <input type="email"
				class="form-control" id="userEmail" name="email"
				placeholder="Enter email">
		</div>
		<button class="btn btn-primary" id="findPassword-user">확인</button>
		<button type="button" class="btn btn-primary" id="sendBtn"
			style="display: none" name="sendBtn"
			onclick="userObject.sendNumber()">인증요청</button>
		<div class="mb-3" style="display: none" id="mail_number"
			name="mail_number">
			<label for="number">인증번호 입력:</label> <input type="text"
				class="form-control" id="number" name="number"
				placeholder="Enter verification code">
			<button type="button" class="btn btn-primary" id="confirmBtn"
				name="confirmBtn" onclick="userObject.confirmNumber()">확인</button>
		</div>
		<input type="text" id="Confirm" name="Confirm" style="display: none"
			value="">
		<div class="mb-3" id="newPassword" style="display: none;">
			<h3>비밀번호 변경</h3>
			<label for="password">비밀번호:</label> <input type="password"
				class="form-control" id="userPassword" placeholder="Enter password"
				name="password" onblur="userObject.validateUserPassword()" required>
			<span id="userPasswordError" style="color: red;"></span>
			<button class="btn btn-primary" id="updatePassword-user">확인</button>
		</div>
	</div>
	<script src="/js/user.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>