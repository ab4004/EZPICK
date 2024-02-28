let bookObject = {

	init: function() {

		let _this = this;

		// 경기 일정 데이터 삽입 버튼
		$("#btn-insertBook").on("click", () => {
			_this.insertBook();
		});

		// 경기 일정 데이터 수정 버튼
		$(".btn-updateBook").on("click", function() {
			// 수정 버튼이 속한 행
			let row = $(this).closest("tr");

			// 해당 행에서 필요한 데이터 가져오기
			let bookInfo = {
				date: row.find("#date").val(),
				status: row.find("#status").val(),
				round: row.find("#round").val(),
				homeTeam: row.find("#homeTeam").val(),
				awayTeam: row.find("#awayTeam").val(),
				homeScore: row.find("#homeScore").val(),
				awayScore: row.find("#awayScore").val(),
				versus: row.find("#versus").val(),
				link: row.find("#link").val(),
				stadium: row.find("#stadium").val(),
				result: row.find("#result").val(),
				bookId: $(this).data("updateid") // 수정 버튼의 data-updateid 값을 가져옴
			};

			_this.updateBook(bookInfo);
		});

		// 경기 일정 데이터 삭제 버튼
		$(".btn-deleteBook").on("click", function() {
			let row = $(this).closest("tr");

			let bookId = $(this).data("deleteid");

			_this.deleteBook(bookId);
		});
	},

	// 경기 일정 데이터 삽입
	insertBook: function() {
		alert("경기 일정 데이터 삽입 요청됨");

		let bookInfo = {
			date: $("#year").val() + "-" + $("#month").val() + "-" + $("#day").val() + "T" + $("#hour").val() + ":" + $("#min").val() + ":00",
			status: $("#status").val(),
			round: $("#round").val(),
			homeTeam: $("#homeTeam").val(),
			awayTeam: $("#awayTeam").val(),
			homeScore: $("#homeScore").val(),
			awayScore: $("#awayScore").val(),
			versus: $("#versus").val(),
			link: $("#link").val(),
			stadium: $("#stadium").val(),
		}

		$.ajax({
			type: "POST",
			url: "/admin/insertBook",
			data: JSON.stringify(bookInfo),
			contentType: "application/json; charset=utf-8"

		}).done(function(response) {
			alert(response["data"]);
			location.reload();
		}).fail(function(error) {
			alert(error["data"]);
		})
	},

	updateBook: function(bookInfo) {
		$.ajax({
			type: "PUT",
			url: "/admin/updateBook/" + bookInfo.bookId,
			data: JSON.stringify(bookInfo),
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			alert(response["data"]);
			location.reload();
		}).fail(function(error) {
			alert(error["data"]);
		});
	},

	deleteBook: function(bookId) {
		$.ajax({
			type: "DELETE",
			url: "/admin/deleteBook/" + bookId,
		}).done(function(response) {
			alert(response["data"]);
			location.reload();
		}).fail(function(error) {
			alert(error["data"]);
		});
	}
}

bookObject.init();