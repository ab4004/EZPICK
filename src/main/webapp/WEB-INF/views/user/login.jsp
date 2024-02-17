<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZPICK - 로그인</title>
</head>
<body class="totalBodyStyle">
	<jsp:include page="../layout/nav.jsp"></jsp:include>
	<div class="container mt-3 flex-grow-1">
		<div class="container">
			<div class="row">
				<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
					<div class="card card-signin my-5">
						<div class="card-body">
							<h3 class="card-title text-center">로그인</h3>
							<div class="form-label-group">
								<div class="mb-3 mt-3">
									<label for="id">아이디:</label> <input type="text"
										class="form-control" id="userId" placeholder="Enter id"
										name="id">
								</div>
								<div class="mb-3">
									<label for="password">비밀번호:</label> <input type="password"
										class="form-control" id="userPassword"
										placeholder="Enter password" name="password">
								</div>
								<hr>
								<div class="d-grid">
									<button class="btn btn-primary btn-block" id="login-user">로그인</button>
								</div>
								<div class="my-4">
									<div class="d-grid">
										<button class="btn btn-secondary btn-block"
											onclick="location.href='/auth/register'">회원가입</button>
									</div>
									<hr>
									<div class="text-center">
										<a class="me-3" href="/auth/findId">ID찾기</a> <a
											href="/auth/findPassword">PW찾기</a>
									</div>
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