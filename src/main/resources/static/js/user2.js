let userObject = {
	init: function() {
		let _this = this;

		$("#register-user").on("click", function(event) {
			event.preventDefault();

			// 클라이언트 측에서의 유효성 검사
			if (_this.validateForm()) {
				// 서버로 회원가입 요청 전송
				_this.registerUser();
			}
		});

		$("#login-user").on("click", () => {
			_this.loginUser();
		});

		$("#logout-user").on("click", () => {
			_this.logoutUser();
		});

		$("#userPassword, #userName, #userNickname, #userPhone").on("blur", function() {
			_UserDTO.validateField($(this));
		});

		$("#userId").on("input", function() {
			_this.validateUserId();
		});
	},

	validateForm: function() {
		// 클라이언트 측에서의 각 필드에 대한 유효성 검사를 수행
		let isValid = true;

		if (!this.validateUserId()) {
			isValid = false;
		}

		if (!this.validateUserPassword()) {
			isValid = false;
		}

		if (!this.validateUserName()) {
			isValid = false;
		}

		if (!this.validateUserNickname()) {
			isValid = false;
		}

		if (!this.validateUserPhone()) {
			isValid = false;
		}

		return isValid;
	},

	validateUserId: function() {
		let userId = $("#userId").val();
		let userIdErrorElement = $("#userIdError");

		if (!this.validateBasicUserId(userId, userIdErrorElement)) {
			return;
		}

		// 실시간으로 아이디 중복 검사를 수행
		this.checkUserIdDuplicate(userId, userIdErrorElement);
	},

	validateBasicUserId: function(userId, userIdErrorElement) {
		// 기본적인 유효성 검사
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

		// 유효성 검사 통과 시 오류 메시지 초기화
		userIdErrorElement.text("");
		return true;
	},

	checkUserIdDuplicate: function(userId, userIdErrorElement) {
		// 아이디 중복 검사를 수행
		$.ajax({
			type: "GET",
			url: "/auth/checkUserId/" + userId,
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			if (response["status"] === 200) {
				// 중복이 없으면 메시지 초기화
				userIdErrorElement.text("");
			} else if (response["status"] === 400) {
				// 중복이 있으면 에러 메시지 표시
				userIdErrorElement.text("이미 사용 중인 아이디입니다.");
			}
		}).fail(function(error) {
			// 에러 처리
			console.error("Error checking user ID:", error);
		});
	},

	registerUser: function() {
		let registerUser = {
			userId: $("#id").val(),
			userPassword: $("#password").val(),
			userName: $("#name").val(),
			userNickname: $("#nickname").val(),
			userPhone: $("#phone").val()
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
				// 클라이언트 측에서 유효성 검사에 실패한 경우, 각 입력란 아래에 에러 메시지를 표시
				$.each(response["data"], function(fieldName, errorMessage) {
					$("#" + fieldName + "Error").text(errorMessage);
				});
			}
		}).fail(function(error) {
			alert(error["data"]);
		});
	},

	loginUser: function() {
		let loginUser = {
			userId: $("#id").val(),
			userPassword: $("#password").val()
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
			userPasswordErrorElement.text("비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.");
			return false;
		}

		userPasswordErrorElement.text("");
		return true;
	},

	validateUserName: function() {
		let userNameInput = $("#userName").val();
		let userNameErrorElement = $("#userNameError");

		if (userNameInput.trim() === "") {
			userNameErrorElement.text("이름은 필수 입력 항목입니다.");
			return false;
		}

		let hasSpecialCharacters = /[!@#$%^&*(),.?":{}|<>]/.test(userNameInput);
		if (hasSpecialCharacters) {
			userNameErrorElement.text("이름에는 특수 문자가 포함될 수 없습니다.");
			return false;
		}

		let userNameRegex = /^[a-zA-Z가-힣]*$/;
		if (!userNameRegex.test(userNameInput)) {
			userNameErrorElement.text("이름은 한글, 영문 대/소문자만 사용 가능합니다. (특수기호, 공백 사용 불가)");
			return false;
		}

		let nameLength = userNameInput.length;
		if (nameLength < 2 || nameLength > 20) {
			userNameErrorElement.text("이름은 2자 이상 20자 이하로 입력하세요.");
			return false;
		}

		userNameErrorElement.text("");
		return true;
	},

	validateUserNickname: function() {
		let userNicknameInput = $("#userNickname").val();
		let userNicknameErrorElement = $("#userNicknameError");

		if (userNicknameInput.trim() === "") {
			userNicknameErrorElement.text("닉네임은 필수 입력 항목입니다.");
			return false;
		}

		let hasSpecialCharacters = /[!@#$%^&*(),.?":{}|<>]/.test(userNicknameInput);
		if (hasSpecialCharacters) {
			userNicknameErrorElement.text("닉네임에는 특수 문자가 포함될 수 없습니다.");
			return false;
		}

		let userNicknameRegex = /^[a-zA-Z가-힣]*$/;
		if (!userNicknameRegex.test(userNicknameInput)) {
			userNicknameErrorElement.text("닉네임은 한글, 영문 대/소문자만 사용 가능합니다. (특수기호, 공백 사용 불가)");
			return false;
		}

		let nicknameLength = userNicknameInput.length;
		if (nicknameLength < 2 || nicknameLength > 16) {
			userNicknameErrorElement.text("닉네임은 2자 이상 16자 이하로 입력하세요.");
			return false;
		}

		userNicknameErrorElement.text("");
		return true;
	},

	validateUserPhone: function() {
		let userPhoneInput = $("#userPhone").val();
		let userPhoneErrorElement = $("#userPhoneError");

		if (userPhoneInput.trim() === "") {
			userPhoneErrorElement.text("휴대전화번호는 필수 입력 항목입니다.");
			return false;
		}

		let hasNonNumeric = /\D/.test(userPhoneInput); // Check for non-numeric characters
		if (hasNonNumeric) {
			userPhoneErrorElement.text("휴대전화번호는 숫자로만 입력하세요.");
			return false;
		}

		let phoneLength = userPhoneInput.length;
		if (phoneLength < 10 || phoneLength > 11) {
			userPhoneErrorElement.text("휴대전화번호는 10자 이상 11자 이하로 입력하세요.");
			return false;
		}

		userPhoneErrorElement.text("");
		return true;
	}
}
userObject.init();