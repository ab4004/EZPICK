let userObject = {
	init: function() {
		let _this = this;

		$("#register-user").on("click", () => {
			_this.registerUser();
		});

		$("#get-user").on("click", () => {
			_this.getUser();
		});
	},

	registerUser: function() {
		let registerUser = {
			user_id: $("#id").val(),
			user_password: $("#password").val(),
			user_name: $("#name").val(),
			user_nickname: $("#nickname").val(),
			user_phone: $("#phone").val()
		}

		$.ajax({
			type: "POST",
			url: "/auth/registerUser",
			data: JSON.stringify(registerUser),
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			alert(response["data"]);
			location = "/";
		}).fail(function(error) {
			alert(error["data"]);
		});
	},

	getUser: function() {
		let getUser = {
			user_id: $("#id").val()
		}

		$.ajax({
			type: "POST",
			url: "/auth/getUser",
			data: JSON.stringify(getUser),
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			alert(response["data"]);
		}).fail(function(error) {
			alert(error["data"]);
		});
	},
}

userObject.init();