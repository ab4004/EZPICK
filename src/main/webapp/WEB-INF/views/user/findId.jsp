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
		<div class="mb-3 mt-3">
			<label for="name">이름:</label> <input type="text" class="form-control"
				id="userName" placeholder="Enter name" name="name">
		</div>
		<div class="mb-3">
			<label for="phone">연락처:</label> <input type="tel"
				class="form-control" id="userPhone" placeholder="Enter phone"
				name="phone">
		</div>
		<button class="btn btn-primary" id="findId-user">확인</button>
	</div>
	<script src="/js/user.js"></script>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>