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
								<h3 class="card-title text-center">관리자 페이지</h3>
								<div class="d-grid mt-3">
									<div class="d-flex-column my-5 text-center">
										<h5>경기 일정 데이터 관리</h5>
										<div>
											<button class="btn btn-primary me-2"
												onclick="location.href='/admin/insertBook'">삽입</button>
											<button class="btn btn-warning"
												onclick="location.href='/admin/updateBook'">수정 및 삭제</button>
										</div>
									</div>
									<div class="d-flex-column my-5 text-center">
										<h5>회원 관리</h5>
										<div>
											<button class="btn btn-primary me-2"
												onclick="location.href='/admin/member'">테이블 확인</button>
										</div>
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
