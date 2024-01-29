let userObject = {
	init: function() {
		let _this = this;

		$("#register-user").on("click", function() {
			if (_this.validateForm()) {
				_this.registerUser();
			}
		});

		$("#login-user").on("click", function() {
			_this.loginUser();
		});

		$("#logout-user").on("click", function() {
			_this.logoutUser();
		});

		$("#findId-user").on("click", function() {
			_this.findIdUser();
		});
	},

	validateForm: function() {
		let validators = [
			() => this.validateUserId(),
			() => this.validateUserPassword(),
			() => this.validateUserName(),
			() => this.validateUserNickname(),
			() => this.validateUserEmail()
		];
		return validators.every(validator => validator());
	},

	sendNumber: function() {
		$("#mail_number").css("display", "block");
		$.ajax({
			url: "/auth/checkEmail",
			type: "post",
			dataType: "json",
			data: { "mail": $("#userEmail").val() },
			success: function(data) {
				// 이메일 입력란 수정 못하도록 비활성화
				$("#userEmail").prop("disabled", true);
				alert("인증번호 발송");
				$("#Confirm").attr("value", data);
			}
		});
	},

	confirmNumber: function() {
		var number1 = $("#number").val();
		var number2 = $("#Confirm").val();

		if (number1 == number2) {
			alert("인증되었습니다.");
			$("#userInfoSection").show();
			$("#confirmButtonSection").show();
			$("#mail_number").hide();  // 인증번호 입력란 숨기기
			// 이메일 입력란 수정 못하도록 비활성화
		} else {
			alert("인증번호를 다시 확인해주세요.");
		}
	},

	validateUserId: function() {
		let userId = $("#userId").val();
		let userIdErrorElement = $("#userIdError");

		if (!this.validateBasicUserId(userId, userIdErrorElement)) {
			return false;
		}
		// 실시간으로 아이디 중복 검사를 수행
		this.checkUserId(userId, userIdErrorElement);

		return true;
	},

	validateUserNickname: function() {
		let userNickname = $("#userNickname").val();
		let userNicknameErrorElement = $("#userNicknameError");

		if (!this.validateBasicUserNickname(userNickname, userNicknameErrorElement)) {
			return false;
		}
		this.checkUserNickname(userNickname, userNicknameErrorElement);

		return true;
	},

	validateUserEmail: function() {
		let userEmail = $("#userEmail").val();
		let userEmailErrorElement = $("#userEmailError");

		if (!this.validateBasicUserEmail(userEmail, userEmailErrorElement)) {
			return false;
		}
		this.checkUserEmail(userEmail, userEmailErrorElement);
	},

	checkUser: function(type, value, errorElement) {
		$.ajax({
			type: "GET",
			url: `/auth/check${type}/${value}`,
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			if (response["status"] === 200) {
				errorElement.text("");
			} else if (response["status"] === 400) {
				errorElement.text(response["data"]);
			}
		}).fail(function(error) {
			errorElement.text("서버 오류가 발생했습니다.");
		});
	},

	checkUserId: function(userId, userIdErrorElement) {
		this.checkUser('UserId', userId, userIdErrorElement);
	},

	checkUserNickname: function(userNickname, userNicknameErrorElement) {
		this.checkUser('UserNickname', userNickname, userNicknameErrorElement);
	},

	checkUserEmail: function(userEmail, userEmailErrorElement) {
		this.checkUser('UserEmail', userEmail, userEmailErrorElement);
	},

	validateBasicUserId: function(userId, userIdErrorElement) {
		if (userId.trim() === "") {
			userIdErrorElement.text("아이디는 필수 입력 항목입니다.");
			return false;
		}

		let hasSpace = /\s/.test(userId);
		if (hasSpace) {
			userIdErrorElement.text("아이디에는 공백이 포함될 수 없습니다.");
			return false;
		}

		let userIdLength = userId.length;
		if (userIdLength < 5 || userIdLength > 40) {
			userIdErrorElement.text("아이디는 5자 이상 40자 이하로 입력하세요.");
			return false;
		}

		let userIdPattern = /^[a-z0-9]+$/;
		if (!userIdPattern.test(userId)) {
			userIdErrorElement.text("아이디는 영문 소문자와 숫자로만 입력하세요.");
			return false;
		}

		userIdErrorElement.text("");
		return true;
	},

	validateBasicUserNickname: function(userNickname, userNicknameErrorElement) {
		if (userNickname.trim() === "") {
			userNicknameErrorElement.text("닉네임은 필수 입력 항목입니다.");
			return false;
		}

		let hasSpecialCharacters = /[!@#$%^&*(),.?":{}|<>]/.test(userNickname);
		if (hasSpecialCharacters) {
			userNicknameErrorElement.text("닉네임은 특수 문자가 포함될 수 없습니다.");
			return false;
		}

		let nicknameLength = userNickname.length;
		if (nicknameLength < 2 || nicknameLength > 16) {
			userNicknameErrorElement.text("닉네임은 2자 이상 16자 이하로 입력하세요.");
			return false;
		}

		userNicknameErrorElement.text("");
		return true;
	},

	validateBasicUserEmail: function(userEmail, userEmailErrorElement) {
		if (userEmail.trim() === "") {
			userEmailErrorElement.text("이메일은 필수 입력 항목입니다.");
			return false;
		}

		// 이메일 형식을 확인하는 정규식
		let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		if (!emailRegex.test(userEmail)) {
			userEmailErrorElement.text("올바른 이메일 형식이 아닙니다.");
			return false;
		}

		userEmailErrorElement.text("");
		return true;
	},

	validateUserPassword: function() {
		let userPassword = $("#userPassword").val();
		let userPasswordErrorElement = $("#userPasswordError");

		if (userPassword.trim() === "") {
			userPasswordErrorElement.text("비밀번호는 필수 입력 항목입니다.");
			return false;
		}

		let hasSpace = /\s/.test(userPassword);
		if (hasSpace) {
			userPasswordErrorElement.text("비밀번호에는 공백이 포함될 수 없습니다.");
			return false;
		}

		let passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,16}$/;
		if (!passwordRegex.test(userPassword)) {
			userPasswordErrorElement.text("비밀번호는 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.");
			return false;
		}

		userPasswordErrorElement.text("");
		return true;
	},

	validateUserName: function() {
		let userName = $("#userName").val();
		let userNameErrorElement = $("#userNameError");

		if (userName.trim() === "") {
			userNameErrorElement.text("이름은 필수 입력 항목입니다.");
			return false;
		}

		let hasSpecialCharacters = /[!@#$%^&*(),.?":{}|<>]/.test(userName);
		if (hasSpecialCharacters) {
			userNameErrorElement.text("이름에는 특수 문자가 포함될 수 없습니다.");
			return false;
		}

		let userNameRegex = /^[a-zA-Z가-힣]*$/;
		if (!userNameRegex.test(userName)) {
			userNameErrorElement.text("이름은 한글, 영문 대/소문자만 사용 가능합니다. (특수기호, 공백 사용 불가)");
			return false;
		}

		let nameLength = userName.length;
		if (nameLength < 2 || nameLength > 20) {
			userNameErrorElement.text("이름은 2자 이상 20자 이하로 입력하세요.");
			return false;
		}

		userNameErrorElement.text("");
		return true;
	},

	registerUser: function() {
		let userEmail = $("#userEmail").val();
		let registerUser = {
			userId: $("#userId").val(),
			userPassword: $("#userPassword").val(),
			userName: $("#userName").val(),
			userNickname: $("#userNickname").val(),
			userEmail: userEmail
		}

		$.ajax({
			type: "POST",
			url: "/auth/register",
			data: JSON.stringify(registerUser),
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			if (response["status"] === 200) {
				alert(response["data"]);
				location.href = "/auth/login";
			} else if (response["status"] === 400) {
				let errorMessage = response["data"];
				if (typeof errorMessage === 'string') {
					alert(errorMessage);
				} else {
					alert("입력하신 내용을 다시 확인해주세요.");
				}
			}
		}).fail(function(error) {
			console.error("Error during registration:", error);
		});
	},

	loginUser: function() {
		let loginUser = {
			userId: $("#userId").val(),
			userPassword: $("#userPassword").val()
		}

		$.ajax({
			type: "POST",
			url: "/auth/login",
			data: JSON.stringify(loginUser),
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			if (response["status"] === 200) {
				location.href = "/";
			} else {
				// 로그인 실패 시에 대한 처리
				alert(response["data"]);
			}
		}).fail(function(error) {
			alert(error["data"]);
		});
	},

	logoutUser: function() {
		alert("로그아웃이 완료되었습니다.");
		location.href = "/";
	},

	findIdUser: function() {
		let findIdUser = {
			userEmail: $("#userEmail").val(),
		}

		$.ajax({
			type: "POST",
			url: "/auth/findId",
			data: $.param(findIdUser), // 변환
			contentType: "application/x-www-form-urlencoded; charset=UTF-8"
		}).done(function(response) {
			if (response["status"] === 200) {
				alert(response["data"]);
				location.href = "/auth/login";
			} else {
				alert(response["data"]);
			}
		}).fail(function(error) {
			alert(error["data"]);
		});
	},
};

$(document).ready(function() {
	userObject.init();
});