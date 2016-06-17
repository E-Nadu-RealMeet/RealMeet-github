/*
	Prologue by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
 */

(function($) {

	skel.breakpoints({
		wide : '(min-width: 961px) and (max-width: 1880px)',
		normal : '(min-width: 961px) and (max-width: 1620px)',
		narrow : '(min-width: 961px) and (max-width: 1320px)',
		narrower : '(max-width: 960px)',
		mobile : '(max-width: 736px)'
	});

	$(function() {

		var $window = $(window), $body = $('body');

		// Disable animations/transitions until the page has loaded.
		$body.addClass('is-loading');

		$window.on('load', function() {
			$body.removeClass('is-loading');
		});

		// CSS polyfills (IE<9).
		if (skel.vars.IEVersion < 9)
			$(':last-child').addClass('last-child');

		// Fix: Placeholder polyfill.
		$('form').placeholder();

		// Prioritize "important" elements on mobile.
		skel.on('+mobile -mobile', function() {
			$.prioritize('.important\\28 mobile\\29',
					skel.breakpoint('mobile').active);
		});

		// Scrolly links.
		$('.scrolly').scrolly();

		// Nav.
		var $nav_a = $('#nav a');

		// Scrolly-fy links.
		$nav_a.scrolly().on('click', function(e) {

			var t = $(this), href = t.attr('href');

			if (href[0] != '#')
				return;

			e.preventDefault();

			// Clear active and lock scrollzer until scrolling has stopped
			$nav_a.removeClass('active').addClass('scrollzer-locked');

			// Set this link to active
			t.addClass('active');

		});

		// Initialize scrollzer.
		var ids = [];

		$nav_a.each(function() {

			var href = $(this).attr('href');

			if (href[0] != '#')
				return;

			ids.push(href.substring(1));

		});

		$.scrollzer(ids, {
			pad : 200,
			lastHack : true
		});

		// Header (narrower + mobile).

		// Toggle.
		$(
				'<div id="headerToggle">'
						+ '<a href="#header" class="toggle"></a>' + '</div>')
				.appendTo($body);

		// Header.
		$('#header').panel({
			delay : 500,
			hideOnClick : true,
			hideOnSwipe : true,
			resetScroll : true,
			resetForms : true,
			side : 'left',
			target : $body,
			visibleClass : 'header-visible'
		});

		// Fix: Remove transitions on WP<10 (poor/buggy performance).
		if (skel.vars.os == 'wp' && skel.vars.osVersion < 10)
			$('#headerToggle, #header, #main').css('transition', 'none');

	});

})(jQuery);

/* contextPath 가져오는 함수 by 지원 */
function getContextPath() {
	var offset = location.href.indexOf(location.host) + location.host.length;
	var ctxPath = location.href.substring(offset, location.href.indexOf('/',
			offset + 1));
	return ctxPath;
}

function loginChk() {
	$.ajax({
		url : getContextPath() + '/midCheck',
		type : 'POST',
		dataType : 'text',
		success : function(data) {
			if (data === "true") {
			} else {
				if (confirm("로그인이 필요합니다. 로그인 하시겠습니까?")) {
					openLoginForm();
				} else {
				}
			}
		},
		error : function(data) {
			alert('에러 발생')
		}
	})
}
function openLoginForm() {
	$('.login-sum').fadeIn(360);
	$('.login-sum').click(function(e) {
		closeLoginForm();
		$('.login-sum').off("click");
	})
}
function closeLoginForm() {
	$('.login-sum').fadeOut(180);
}
$('#reg-link').click(function() {
	loginChk()
})
$(document).ready(function(){
	$('.login-sum').click(function(e) {
		closeLoginForm();
		$('.login-sum').off("click");
	})
})
