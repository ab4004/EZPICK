<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="totalBodyStyle">
	<jsp:include page="../layout/nav.jsp"></jsp:include>
	<div class="container mt-3 flex-grow-1">
		<h3>회원가입</h3>
		<div class="mb-3">
			<label for="userEmail">이메일:</label> <input type="email"
				class="form-control" id="userEmail" name="email"
				placeholder="Enter email" onblur="userObject.validateUserEmail()"
				required> <span id="userEmailError" style="color: red;"></span>
		</div>
		<button type="button" class="btn btn-primary" id="sendBtn"
			name="sendBtn" onclick="userObject.sendNumber()">인증요청</button>
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
		<div class="mb-3" style="display: none" id="userInfoSection"
			name="userInfoSection">
			<div class="mb-3 mt-3">
				<label for="id">아이디:</label> <input type="text" class="form-control"
					id="userId" placeholder="Enter id" name="id"
					onblur="userObject.validateUserId()" required> <span
					id="userIdError" style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label for="password">비밀번호:</label> <input type="password"
					class="form-control" id="userPassword" placeholder="Enter password"
					name="password" onblur="userObject.validateUserPassword()" required>
				<span id="userPasswordError" style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label for="name">이름:</label> <input type="text"
					class="form-control" id="userName" placeholder="Enter name"
					name="name" onblur="userObject.validateUserName()" required>
				<span id="userNameError" style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label for="nickname">닉네임:</label> <input type="text"
					class="form-control" id="userNickname" placeholder="Enter nickname"
					name="nickname" onblur="userObject.validateUserNickname()" required>
				<span id="userNicknameError" style="color: red;"></span>
			</div>
		</div>
		<div id="confirmButtonSection" style="display: none">
			<button class="btn btn-primary" onclick="userObject.registerUser()"
				id="register-user">확인</button>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="/js/user.js"></script>
</body>
</html>
