/**
 * 
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
	setMapSize();								//함수 실행	
	$(window).resize(setMapSize);				//윈도우창 사이즈 변하면 함수 재실행

});
$(function() {
	/*.on(events,selector,data,function());
			1		2		3		4		

		1 = 이벤트들을 나열하면 된답니다. 하나이상의 이벤트를 나열하고싶을 때는
		공백으로 구문하면됩니다.
		예)'click mouseover'
		2 = 자손 요소들을 필터링 할때 사용합니다.
		예)':not(#aa)'
		3 = 이벤트가 발생했을때 전달하고 싶은 데이터값
		예) '{변수명 : 값}' 
		4 = 특정 이벤트가 발생했을때 실행될 함수를 지정하며 괄호안에는
		이벤트 객체가 매개변수로 전달되므로 이름을 지정해줘야한다.
		예) 'function(이름 아무거나)' 

		2,3은 없어도 그만.

		이벤트 처리하는 메서드 bind는 오래전에 생긴 녀석이고 on은 나온지 얼마 안된 파릇파릇한 놈*/
	$('#gnb>li').on({
		//마우스가 올라갔을때 올라가있는 li에 'on'클래스 추가.
		mouseenter : function() {
			$(this).addClass('on');
		},
		//마우스가 떠나갔을때 마우스가 올라가 있엇던 li에 'on'클래스 삭제.
		mouseleave : function() {
			$(this).removeClass('on');
		}
	});
	/*
		$(document).mouseup(function(e) {
			if ($(e.target).parents('slider_menu').length == 0) {
				$('#slider_menu li').removeClass('open');
				$('#slider_menu ul').hide();
			}
		});*/
	/*우측 메뉴에안에 메뉴 클릭시 발생하는 이벤트 다른데 눌르면 없어지는 이벤트임.*/
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