<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZPICK - 게시글 작성</title>
</head>
<body class="totalBodyStyle">
	<jsp:include page="../layout/search_nav.jsp"></jsp:include>
	<div class="container mt-3 flex-grow-1">
		<h1>게시글 작성</h1>
		<p>제목 :</p>
		<div>
			<input type="text" class="form-control" id="title"
				placeholder="제목 입력">
		</div>
		<br>
		<p>내용 :</p>
		<div>
			<textarea id="content" placeholder="내용 입력" rows="5"></textarea>

			<script>
				$(document).ready(function() {
					$("#content").summernote({
						height : 300
					});
				});
			</script>
		</div>
		<hr>
		<div class="d-flex justify-content-between">
			<button class="btn btn-warning" onclick="history.back()">이전으로</button>
			<button class="btn btn-secondary mx-auto" id="insert-board">확인</button>
		</div>
		<script src="/js/board.js"></script>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>