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
							<div class="mb-3 mt-3">
								<h3 class="card-title text-center">회원탈퇴</h3>
								<div class="alert alert-danger">탈퇴한 아이디는 복구가 불가하오니 신중하게
									선택하시기 바랍니다.</div>
								<label for="id">아이디:</label> <input type="text"
									class="form-control" placeholder="${user.userId}" id="userId"
									readonly>
							</div>
							<div class="mb-3">
								<label for="password">비밀번호:</label> <input type="password"
									class="form-control" id="userPassword"
									placeholder="Enter password" name="password">
								<div class="d-grid mt-3">
									<button class="btn btn-primary" id="delete-user">확인</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/js/user.js"></script>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
