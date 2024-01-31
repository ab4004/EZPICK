let boardObject = {
	init: function() {
		let _this = this;

		$("#insert-board").on("click", () => {
			_this.insertBoard();
		});

		/*	$("#update-board").on("click", () => {
				_this.updateBoard();
			});
			
			$("#delete-board").on("click", () => {
				_this.deleteBoard();
			}); */
	},

	insertBoard: function() {
		let insertBoard = {
			boardTitle: $("#title").val(),
			boardContent: $("#content").val(),
		}

		$.ajax({
			type: "POST",
			url: "/board/insertBoard",
			data: JSON.stringify(insertBoard),
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			alert(response["data"]);
			location = "/";
		}).fail(function(error) {
			alert(error["data"]);
		});
	},

	/* updatePost : function() {
		let updatePost = {
			id : $("#id").val(),
			title : $("#title").val(),
			content : $("#content").val(),
		}
		
		$.ajax({
			type : "PUT",
			url : "/post/updatePost",
			data : JSON.stringify(updatePost),
			contentType : "application/json; charset=utf-8"
		}).done(function(response) {
			alert(response["data"]);
			location = "/";
		}).fail(function(error) {
			alert(error["data"]);
		});
	},
	
	deletePost : function() {
		let deletePost = $("#id").val();
		
		$.ajax({
			type : "DELETE",
			url : "/post/deletePost/" + deletePost.id,
		}).done(function(response) {
			alert(response["data"]);
			location = "/";
		}).fail(function(error) {
			alert("실패");
				//error["data"]
		});
	} */
}

boardObject.init();