$(document).ready(function() {
	var loadingTimeout;

	// 링크 클릭 이벤트 처리
	$('a').on('click', function(event) {
		// 링크에 summoner가 포함되어 있지 않으면 기본 동작을 유지하고 종료
		if ($(this).attr('href').indexOf('/summoner') === -1) {
			return;
		}

		// 기본 동작 중지 (링크 클릭 시 페이지 이동 방지)
		event.preventDefault();

		// 클릭한 링크의 href 속성 값 가져오기
		var href = $(this).attr('href');

		// 로딩 화면 표시
		$('.loader').fadeIn();
		$('body').addClass('loading-overlay-active'); // 배경 흐리게 표시

		// 페이지 이동 (href로 이동)
		setTimeout(function() {
			window.location.href = href;
		}, 100);

		// 페이지 이동 후 일정 시간 내에 로딩이 완료되지 않으면 로딩 표시 중지
		loadingTimeout = setTimeout(function() {
			$('.loader').fadeOut();
			$('body').removeClass('loading-overlay-active'); // 배경 흐림 제거
			location.reload();
		}, 3000);
	});

	$('#summoner_search').submit(function(event) {
		// 폼 전송을 중지하여 페이지 이동 방지
		event.preventDefault();

		// 로딩 화면 표시
		$('.loader').fadeIn();
		$('body').addClass('loading-overlay-active'); // 배경 흐리게 표시

		// AJAX 요청 보내기
		$.ajax({
			type: 'GET',
			url: '/summoner',
			data: $('#summoner_search').serialize(),
			success: function(response) {
				// 성공적으로 응답을 받았을 때 새로운 페이지로 이동
				window.location.href = '/summoner?' + $('#summoner_search').serialize();
			},
			error: function(xhr, status, error) {
				// 오류 처리
				console.error('Error:', error);
				// 로딩 화면 숨기기
				$('.loader').fadeOut();
				$('body').removeClass('loading-overlay-active'); // 배경 흐림 제거
			}
		});
	});

	// 페이지 로딩이 완료되었을 때 이벤트 핸들러
	$(window).on('load', function() {
		$('.loader').fadeOut();
		$('body').removeClass('loading-overlay-active'); // 배경 흐림 제거
	});
});