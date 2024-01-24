<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZPICK</title>
</head>
<body>
	<jsp:include page="../layout/nav.jsp"></jsp:include>

	<div class="container mt-3">
		<div class="card mb-4">
			<div class="card-header">
				<a class="btn btn-primary float-end" href="/board/insertBoard"> <i
					class="fas fa-edit"></i> 글 작성
				</a>
			</div>
			<div class="card-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>John</td>
							<td>Doe</td>
							<td>john@example.com</td>
							<td>john@example.com</td>
							<td>john@example.com</td>
						</tr>
					</tbody>
				</table>
			</div>

			<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>