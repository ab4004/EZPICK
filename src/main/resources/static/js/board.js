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

	 updateBoard : function() {
		let updateInfo = {
			boardSeq : $("#id").val(),
			boardTitle : $("#title").val(),
			boardContent : $("#content").val(),
			categoryNo: $("#category").val(),
		}
		
		$.ajax({
			type : "PUT",
			url : "/board/updateBoard",
			data : JSON.stringify(updateInfo),
			contentType : "application/json; charset=utf-8"
		}).done(function(response) {
			alert(response["data"]);
			location.href = "/board/detail/" + updateInfo.boardSeq;
		}).fail(function(error) {
			alert(error["data"]);
		});
	},
	
	deleteBoard : function() {
		let boardSeq = $("#id").val();
		
		$.ajax({
			type : "DELETE",
			url : "/board/deleteBoard/" + boardSeq,
		}).done(function(response) {
			alert(response["data"]);
			location.href = "/board";
		}).fail(function(error) {
			alert("실패");
		});
	} 
}

boardObject.init();