let replyObject = {
	init: function() {
		let _this = this;

		$("#reply_btn").on("click", () => {
			_this.addReply();
		});
		
		$("#reply_like_btn").on("click", () => {
			_this.replyLike();
		});
		
		$("#reply_hate_btn").on("click", () => {
			_this.replyHate();
		});
	},

	addReply: function() {
		let board_id = $("#boardSeq").val();
		let replyContent = $("#reply_content").val();

		$.ajax({
			type: "POST",
			url: "/addReply/" + board_id,
			data: {content : replyContent},
		}).done(function(response) {
			alert(response["data"]);
			location.reload();
		}).fail(function(error) {
			alert(error["data"]);
			location.href="/auth/login"
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
	
	replyLike: function() {
		let id = $("#reply_id").val();
		
		$.ajax({
			type: "PUT",
			url: "/replyLike/" + id
		}).done(function() {
			location.reload();
		}).fail(function(error) {
			alert(error["data"]);
			location.href="/auth/login";
		})
	},
	
	replyHate: function() {
		let id = $("#reply_id").val();
		
		$.ajax({
			type: "PUT",
			url: "/replyHate/" + id
		}).done(function() {
			location.reload();
		}).fail(function(error) {
			alert(error["data"]);
			location.href="/auth/login";
		})
	},
}

replyObject.init();