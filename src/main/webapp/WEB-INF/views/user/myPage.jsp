<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZPICK - My Page</title>
</head>
<body class="totalBodyStyle">
	<jsp:include page="../layout/nav.jsp"></jsp:include>
	<div class="container mt-3 flex-grow-1">
		<div class="container">
			<div class="row">
				<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
					<div class="card card-signin my-5">
						<div class="card-body">
							<div class="mt-3" id="checkUser">
								<h3 class="card-title text-center">내정보</h3>
								<div class="alert alert-primary">개인정보 보호를 위해 비밀번호를 입력해주세요.</div>
								<div class="mb-3">
									<label for="password">비밀번호:</label> <input type="password"
										class="form-control" id="checkPassword"
										placeholder="Enter password" name="checkPassword">
								</div>
								<div class="d-grid">
									<button class="btn btn-primary" id="myPage-user">확인</button>
								</div>
							</div>
							<div class="mt-3" id="myInfo" style="display: none">
								<div class="mb-3 mt-3">
									<h3 class="card-title text-center">내정보</h3>
									<label for="id">아이디:</label> <input type="text"
										class="form-control" value="${user.userId }" id="userId"
										readonly>
								</div>
								<div class="mb-3">
									<label for="name">이름:</label> <input type="text"
										class="form-control" value="${user.userName }" id="userName"
										readonly>
								</div>
								<div class="mb-3">
									<label for="email">이메일:</label> <input type="text"
										class="form-control" value="${user.userEmail}" id="userEmail"
										readonly>
								</div>
								<div class="mb-3">
									<label for="ExistingNickname">닉네임:</label> <input type="text"
										class="form-control" value="${user.userNickname}" readonly>
								</div>
								<hr>
								<div class="d-grid">
									<button class="btn btn-primary"
										onclick="toggleUserInfoSection('changeNickname')">닉네임
										변경</button>
									<div id="changeNickname" style="display: none;">
										<!-- Input field for new nickname -->
										<div class="my-3">
											<label for="nickname">새 닉네임:</label>
											<div class="d-flex flex-row">
												<input type="text" class="form-control" id="userNickname"
													placeholder="Enter new nickname"
													onblur="userObject.validateUserNickname()" required>
												<button class="btn btn-outline-primary ml-2 ms-1"
													id="updateNickname-user" style="flex-shrink: 0;">확인</button>
											</div>
											<span id="userNicknameError" style="color: red;"></span>
										</div>
									</div>
								</div>
								<br>
								<div class="d-grid">
									<button class="btn btn-primary"
										onclick="toggleUserInfoSection('changePassword')">비밀번호
										변경</button>
									<div id="changePassword" style="display: none;">
										<!-- Input field for new password -->
										<div class="my-3">
											<label for="password">새 비밀번호:</label>
											<div class="d-flex flex-row">
												<input type="password" class="form-control"
													id="userPassword" placeholder="Enter new password"
													onblur="userObject.validateUserPassword()" required>
												<button class="btn btn-outline-primary ml-2 ms-1"
													id="updatePassword-user" style="flex-shrink: 0;">확인</button>
											</div>
											<span id="userPasswordError" style="color: red;"></span>
										</div>
									</div>
								</div>
								<div class="mt-3">
									<a class="me-3" href="/auth/deleteUser">회원탈퇴</a>
								</div>
							</div>
						</div>
						<script>
							function toggleUserInfoSection(sectionId) {
								var section = document
										.getElementById(sectionId);

								if (section.style.display === 'none') {
									section.style.display = 'block';
								} else {
									section.style.display = 'none';
								}
							}
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/js/user.js"></script>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
