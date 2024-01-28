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
		<h2>아이디 찾기</h2>
		<label for="userEmail" class="form-label">이메일:</label> <input
			type="email" class="form-control" id="userEmail" name="email"
			placeholder="Enter email" onblur="userObject.validateUserEmail()"
			required> <span id="userEmailError" style="color: red;"></span>
		<button type="button" class="btn btn-primary" id="sendBtn"
			name="sendBtn" onclick="userObject.sendNumber()">인증요청</button>
	</div>
	<div class="mb-3" style="display: none" id="mail_number"
		name="mail_number">
		<label for="number" class="form-label">인증번호 입력:</label> <input
			type="text" class="form-control" id="number" name="number"
			placeholder="Enter verification code">
		<button type="button" class="btn btn-primary" id="confirmBtn"
			name="confirmBtn" onclick="userObject.confirmNumber()">확인</button>
	</div>
	<script src="/js/user.js"></script>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>