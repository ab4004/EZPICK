let duoObject = {
	init: function() {
		let _this = this;

		$("#find-duo").on("click", () => {
			_this.findDuo();
		});
	},

	findDuo: function() {
		let findDuo = {
			duoGameType: $("#queueModal").val(),
			duoTier: $("#tierModal").val(),
			duoPosition: $("#positionModal").val(),
			duoNickname: $("#duoNickname").val(),
			duoContent: $("#duoContent").val(),
		}

		$.ajax({
			type: "POST",
			url: "/duo/findDuo",
			data: JSON.stringify(findDuo),
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			alert(response["data"]);
			location = "/duo/duoList";
		}).fail(function(error) {
			alert(error["data"]);
		});
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

function selectPosition(value) {
	document.getElementById('positionModal').value = value;
};