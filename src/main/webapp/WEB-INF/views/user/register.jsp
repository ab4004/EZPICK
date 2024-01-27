<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="/js/user.js"></script>
<body>
	<jsp:include page="../layout/nav.jsp"></jsp:include>
	<div class="container mt-3">
		<h3>회원가입</h3>
		<div class="mb-3 mt-3">
			<label for="id" class="form-label">아이디:</label> <input type="text"
				class="form-control" id="userId" placeholder="Enter id" name="id"
				onblur="userObject.validateUserId()" required> <span
				id="userIdError" style="color: red;"></span>
		</div>
		<div class="mb-3">
			<label for="password" class="form-label">비밀번호:</label> <input
				type="password" class="form-control" id="userPassword"
				placeholder="Enter password" name="password"
				onblur="userObject.validateUserPassword()" required> <span
				id="userPasswordError" style="color: red;"></span>
		</div>
		<div class="mb-3">
			<label for="name" class="form-label">이름:</label> <input type="text"
				class="form-control" id="userName" placeholder="Enter name"
				name="name" onblur="userObject.validateUserName()" required>
			<span id="userNameError" style="color: red;"></span>
		</div>
		<div class="mb-3">
			<label for="nickname" class="form-label">닉네임:</label> <input
				type="text" class="form-control" id="userNickname"
				placeholder="Enter nickname" name="nickname"
				onblur="userObject.validateUserNickname()" required> <span
				id="userNicknameError" style="color: red;"></span>
		</div>
		<div class="mb-3">
			<label for="phone" class="form-label">연락처:</label> <input
				type="tel" class="form-control" id="userPhone"
				placeholder="Enter Phone" name="phone"
				onblur="userObject.validateUserPhone()" required> <span
				id="userPhoneError" style="color: red;"></span>
		</div>
	<button type="button" class="btn btn-primary" id="register-user"
		onclick="userObject.registerUser()">확인</button>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>.
</body>
</html>