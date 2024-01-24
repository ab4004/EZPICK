let userObject = {
	init: function() {
		let _this = this;

		$("#register-user").on("click", () => {
			_this.registerUser();
		});

		$("#get-user").on("click", () => {
			_this.getUser();
		});

		$("#login-user").on("click", () => {
			_this.loginUser();
		});

		$("#logout-user").on("click", () => {
			_this.logoutUser();
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
			url: "/auth/register",
			data: JSON.stringify(registerUser),
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			alert(response["data"]);
			if (response["status"] === 200) {
				// 회원가입이 성공하면 로그인 페이지로 이동
				location.href = "/auth/login";
			}
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

	loginUser: function() {
		let loginUser = {
			user_id: $("#id").val(),
			user_password: $("#password").val()
		}

		$.ajax({
			type: "POST",
			url: "/auth/login",
			data: JSON.stringify(loginUser),
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			alert(response["data"]);
			if (response["status"] === 200) {
				// 로그인이 성공하면 메인 페이지로 이동
				location.href = "/";
			}
		}).fail(function(error) {
			alert(error["data"]);
		});
	},

	logoutUser: function() {
		alert("로그아웃이 완료되었습니다.");
		location.href = "/";
	}
}

userObject.init();