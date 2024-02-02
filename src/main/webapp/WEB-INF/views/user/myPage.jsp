<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="display: flex; flex-direction: column; min-height: 100vh;">
	<jsp:include page="../layout/nav.jsp"></jsp:include>
	<div class="container mt-3 flex-grow-1">
		<div class="mt-3" id="checkUser">
			<h2>내정보</h2>
			<div class="alert alert-primary">개인정보 보호를 위해 비밀번호를 입력해주세요.</div>
			<div class="mb-3">
				<label for="password">비밀번호:</label> <input type="password"
					class="form-control" id="checkPassword"
					placeholder="Enter password" name="checkPassword">
			</div>
			<button class="btn btn-primary" id="myPage-user">확인</button>
		</div>
		<div class="mt-3" id="myInfo" style="display: none">
			<div class="mb-3 mt-3">
				<h2>내정보</h2>
				<label for="id">아이디:</label> <input type="text" class="form-control"
					placeholder="${user.userId}" id="userId" value="${user.userId }"
					readonly>
			</div>
			<div class="mb-3">
				<label for="ExistingPassword">비밀번호:</label>
				<button class="btn btn-primary"
					onclick="toggleUserInfoSection('changePassword')">비밀번호 변경</button>
				<div id="changePassword" style="display: none;">
					<!-- Input field for new password -->
					<label for="password">새 비밀번호:</label> <input type="password"
						class="form-control" id="userPassword"
						placeholder="Enter new password"
						onblur="userObject.validateUserPassword()" required> <span
						id="userPasswordError" style="color: red;"></span>
					<button class="btn btn-primary" id="updatePassword-user">확인</button>
				</div>
			</div>
			<div class="mb-3">
				<label for="name">이름:</label> <input type="text"
					class="form-control" placeholder="${user.userName}" id="userName"
					readonly>
			</div>
			<div class="mb-3">
				<label for="ExistingNickname">닉네임:</label> <input type="text"
					class="form-control" placeholder="${user.userNickname}" readonly>
				<button class="btn btn-primary"
					onclick="toggleUserInfoSection('changeNickname')">닉네임 변경</button>
				<div id="changeNickname" style="display: none;">
					<!-- Input field for new nickname -->
					<label for="nickname">새 닉네임:</label> <input type="text"
						class="form-control" id="userNickname"
						placeholder="Enter new nickname"
						onblur="userObject.validateUserNickname()" required> <span
						id="userNicknameError" style="color: red;"></span>
					<button class="btn btn-primary" id="updateNickname-user">확인</button>
				</div>
			</div>
			<div class="mb-3">
				<label for="email">이메일:</label> <input type="text"
					class="form-control" placeholder="${user.userEmail}" id="userEmail"
					value="${user.userEmail }" readonly>
			</div>
			<div class="mb-3">
				<button class="btn btn-primary btn-sm"
					onclick="toggleUserInfoSection('deleteUser')">회원탈퇴</button>
				<div id="deleteUser" style="display: none;">
					<label for="password">비밀번호:</label> <input type="password"
						class="form-control" id="deleteUserPassword"
						placeholder="Enter password">
					<button class="btn btn-primary" id="delete-user">확인</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		function toggleUserInfoSection(sectionId) {
			var section = document.getElementById(sectionId);

			if (section.style.display === 'none') {
				section.style.display = 'block';
			} else {
				section.style.display = 'none';
			}
		}
	</script>
	<script src="/js/user.js"></script>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
