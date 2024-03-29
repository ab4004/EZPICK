<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>EZPICK - 글 작성</title>
</head>
<body class="totalBodyStyle">
	<jsp:include page="../layout/search_nav.jsp"></jsp:include>
	<div class="container d-flex flex-grow-1 mt-3">
		<!-- 게시판 메뉴부분 -->
		<div class="w-25 mb-4 me-3 d-flex-column">
			<jsp:include page="./boardNav.jsp"></jsp:include>
		</div>
		
		<div class="card mb-5 p-4 flex-grow-1">
			<div class="d-flex">
				<div class="w-25 me-3" >
					<select class="form-select" id="category" name="category">
						<option value="1">자유 게시판</option>
						<option value="2">유머 게시판</option>
						<option value="3">사건사고 게시판</option>
						<option value="4">정보 게시판</option>
					</select>
				</div>
				<div class="flex-grow-1">
					<input type="text" class="form-control" id="title"
						placeholder="제목 입력">
				</div>
			</div>
			<div class="mt-3">
				<div>
					<textarea id="content" placeholder="내용 입력" rows="5" style="resize: none; "></textarea>

					<script>
						$(document).ready(function() {
							$("#content").summernote({
								height : 500, 
								maxHeight : 500,
								minHeight : 500
							});
						});
					</script>
				</div>
			</div>
			<hr>
			<div class="d-flex justify-content-center">
				<button class="btn btn-warning" onclick="history.back()">이전으로</button>
				<div class="mx-4"></div>
				<button class="btn btn-secondary" id="insert-board">확인</button>
			</div>
			<script src="/js/board.js"></script>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>