let bookObject = {

	init: function() {

		let _this = this;

		// 경기 일정 데이터 삽입 버튼
		$("#btn-insertBook").on("click", () => {
			_this.insertBook();
		});
	},

	// 경기 일정 데이터 삽입
	insertBook: function() {
		alert("경기 일정 데이터 삽입 요청됨");

		let bookInfo = {

			date: $("#year").val() + "-" + $("#month").val() + "-" + $("#day").val() + "T" + $("#hour").val() + ":" + $("#min").val() + ":" + $("#sec").val(),
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
			//location = "/book/insertBook";
		}).fail(function(error) {
			alert(error["data"]);
		})
	},
}

bookObject.init();