let replyObject = {
	init: function() {
		let _this = this;

		$("#reply_btn").on("click", () => {
			_this.addReply();
		});

		$(".reply_delete_btn").on("click", function() {
			let id = $(this).closest(".comment").data("reply-id");
			_this.deleteReply(id);
		});

		$(".reply_like_btn").on("click", function() {
			let id = $(this).closest(".comment").data("reply-id");
			_this.replyLike(id);
		});

		$(".reply_hate_btn").on("click", function() {
			let id = $(this).closest(".comment").data("reply-id");
			_this.replyHate(id);
		});
	},

	addReply: function() {
		let board_id = $("#boardSeq").val();
		let replyContent = $("#reply_content").val();

		$.ajax({
			type: "POST",
			url: "/addReply/" + board_id,
			data: { content: replyContent },
		}).done(function(response) {
			alert(response["data"]);
			location.reload();
		}).fail(function(error) {
			alert(error["data"]);
			location.href = "/auth/login"
		});
	},

	deleteReply: function(id) {
		let board_id = $("#boardSeq").val();
		
		$.ajax({
			type: "DELETE",
			url: "/deleteReply/" + id,
		}).done(function(response) {
			if (response.status === 200) {
				alert(response["data"]);
				location.href = "/board/detail/" + board_id;
			} else {
				alert(response["data"]);
			}
		}).fail(function(error) {
			alert(error["data"]);
		});
	},

	replyLike: function(id) {
		$.ajax({
			type: "PUT",
			url: "/replyLike/" + id,
			cache: false
		}).done(function(response) {
			if (response.status === 200) {
				location.reload();
			} else {
				alert(response["data"]);
			}
		}).fail(function(error) {
			alert(error["data"]);
		});
	},

	replyHate: function(id) {
		$.ajax({
			type: "PUT",
			url: "/replyHate/" + id
		}).done(function(response) {
			if (response.status === 200) {
				location.reload();
			} else {
				alert(response["data"]);
			}
		}).fail(function(error) {
			alert(error["data"]);
		});
	},
}

replyObject.init();