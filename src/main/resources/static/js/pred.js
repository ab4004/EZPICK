let predObject = {

	init: function() {

		$(".btn-home").click(
			function() {
				let pickHome = {
					id: $(this).val()
				}

				$.ajax({
					type: "POST",
					url: "/pred/pickHome",
					data: JSON.stringify(pickHome),
					contentType: "application/json; charset=utf-8",

					success: function(
						response) {
						alert(response["data"]);
						location.reload();
					},
					error: function(
						error) {
						alert(error["data"]);
						location.reload();
					}
				});
			});

		$(".btn-away").click(
			function() {
				let pickAway = {
					id: $(this).val()
				}

				$.ajax({
					type: "POST",
					url: "/pred/pickAway",
					data: JSON.stringify(pickAway),
					contentType: "application/json; charset=utf-8",

					success: function(
						response) {
						alert(response["data"]);
						location.reload();
					},
					error: function(
						error) {
						alert(error["data"]);
						location.reload();
					}
				});
			});
	}
}



predObject.init();