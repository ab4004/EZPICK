let boardObject = {
	init: function() {
		let _this = this;

		$("#insert-board").on("click", () => {
			_this.insertBoard();
		});

		$("#update-board").on("click", () => {
			_this.updateBoard();
		});

		$("#delete-board").on("click", () => {
			_this.deleteBoard();
		});

		$("#likeBtn").on("click", () => {
			_this.boardLike();
		});
		
		$("#hateBtn").on("click", () => {
			_this.boardHate();
		});
	},

	insertBoard: function() {
		let boardInfo = {
			boardTitle: $("#title").val(),
			boardContent: $("#content").val(),
			categoryNo: $("#category").val(),
		}

		$.ajax({
			type: "POST",
			url: "/board/insertBoard",
			data: JSON.stringify(boardInfo),
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			alert(response["data"]);
			location = "/board";
		}).fail(function(error) {
			alert(error["data"]);
		});
	},

	updateBoard: function() {
		let updateInfo = {
			boardSeq: $("#boardSeq").val(),
			boardTitle: $("#title").val(),
			boardContent: $("#content").val(),
			categoryNo: $("#category").val(),
		}

		$.ajax({
			type: "PUT",
			url: "/board/updateBoard",
			data: JSON.stringify(updateInfo),
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			alert(response["data"]);
			location.href = "/board/detail/" + updateInfo.boardSeq;
		}).fail(function(error) {
			alert(error["data"]);
		});
	},

	deleteBoard: function() {
		let boardSeq = $("#boardSeq").val();

		$.ajax({
			type: "DELETE",
			url: "/board/deleteBoard/" + boardSeq,
		}).done(function(response) {
			alert(response["data"]);
			location.href = "/board";
		}).fail(function(error) {
			alert(error["data"]);
		});
	},
	
	boardLike: function() {
		let boardSeq = $("#boardSeq").val();
		
		$.ajax({
			type: "PUT",
			url: "/board/likeUp/" + boardSeq
		}).done(function() {
			location.reload();
		})
	},
	
	boardHate: function() {
		let boardSeq = $("#boardSeq").val();
		
		$.ajax({
			type: "PUT",
			url: "/board/hateUp/" + boardSeq
		}).done(function() {
			location.reload();
		})
	},
}

boardObject.init();