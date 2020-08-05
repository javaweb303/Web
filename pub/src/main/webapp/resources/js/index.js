/**
 * index.js
 */
$(document).ready(function () {					//문서 세팅 되면
	var screen = document.getElementById('body');	
	var set=document.getElementById('slidermenu_back');
	var he=document.getElementById('head');
	var winHeight = 0;
	var winWidth = 0;//윈도우 높이 저장할 변수 초기화

	function setMapSize(){
		winHeight = $('body').height();			
		winWidth = $('body').width();	
		set.style.height = "100%";		
		set.style.width = "100%";
		he.style.width=winWidth+"px";
	}
	setMapSize();								//함수 실행																//함수 실행
	$(window).resize(setMapSize);				//윈도우창 사이즈 변하면 함수 재실행

});
$(function(){
	$("#slider_menu li>a").click(function() {
		var li = $(this).parent();
		var ul = li.parent()
		ul.find('li').removeClass('open');
		ul.find('ul').not(li.find('ul')).hide();
		li.children('ul').fadeToggle(100);
		if (li.children('ul').is(':visible') || li.has('ul')) {
			li.addClass('open');
		}
	});
	/*우측 메뉴 뒷배경클릭시 발생하는 이벤트*/
	$("#slidermenu_back").click(function() {
		$(this).animate({
			right : '-100%'
		}, 500);
		$('#slmenu_wrap').animate({
			right : '-100%'
		}, 500);
	});
	/* 우측에 메뉴 버튼 클릭시 발생하는 이벤트*/
	$('#slbtn').click(function() {
		$('#slidermenu_back').animate({
			right : '0%'
		}, 500);
		$('#slmenu_wrap').animate({
			right : '0%'
		}, 500);
	});
});