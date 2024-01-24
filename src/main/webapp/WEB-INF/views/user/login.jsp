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
				<label for="id">아이디:</label> <input type="text"
					class="form-control" id="id" placeholder="Enter id"
					name="id">
			</div>
			<div class="mb-3">
				<label for="password">비밀번호:</label> <input type="password"
					class="form-control" id="password" placeholder="Enter password"
					name="password">
			</div>
			<button class="btn btn-primary" id="login-user">로그인</button>
			<button class="btn btn-primary" onclick="location.href='/auth/register'">회원가입</button>
			<button class="btn btn-primary" id="findId-user">ID찾기</button>
			<button class="btn btn-primary" id="findPassword-user">PW찾기</button>
		</form>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>