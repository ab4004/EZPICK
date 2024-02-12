let duoObject = {
	init: function() {
		let _this = this;

		$("#insert-duo").on("click", () => {
			_this.insertDuo();
		});

		$("#search-duo").on("click", () => {
			_this.searchDuo();
		});
	},

	insertDuo: function() {
		let insertDuo = {
			duoGameType: $("#gameTypeModal").val(),
			duoTier: $("#tierModal").val(),
			duoPosition: $("#positionModal").val(),
			duoNickname: $("#duoNickname").val(),
			duoContent: $("#duoContent").val(),
		}

		$.ajax({
			type: "POST",
			url: "/duo/insertDuo",
			data: JSON.stringify(insertDuo),
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			if (response["status"] === 200) {
				alert(response["data"]);
				location.href = "/duo/duoList";
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

	searchDuo: function() {
		let searchDuo = {
			gameType: $("#gameTypeSelection").val(),
			tier: $("#tierSelection").val(),
			position: $("#positionSelection").val(),
		};

		$.ajax({
			type: "GET",
			url: "/duo/searchDuo",
			data: $.param(searchDuo),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8"
		}).done(function(response) {
			alert(response["data"]);
			location.href = "/duo/searchDuo";
		})
	},
}

duoObject.init();

document.addEventListener('DOMContentLoaded', function() {
	var imageButtons = document.querySelectorAll('.image-button');

	imageButtons.forEach(function(button) {
		button.addEventListener('click', function() {
			// 다른 이미지 버튼의 클릭 클래스를 제거.
			imageButtons.forEach(function(otherButton) {
				if (otherButton !== button) {
					otherButton.classList.remove('clicked');
				}
			});

			// 클릭한 이미지 버튼에만 클릭 클래스를 토글
			this.classList.toggle('clicked');
		});
	});
});

function modalPosition(value) {
	document.getElementById('positionModal').value = value;
};

function selectPosition(value) {
	document.getElementById('positionSelection').value = value;
};