/**
 * index.js
 */
$(document).ready(function(){
	
});
$(function(){
	$('#service').on("click",function(){
		location.href='/search';
	});
	$('#eBook').on("click",function(){
		location.href='/eBook';
	});
	$('#history').on("click",function(){
		location.href='/history';
	});
	$('#open').on("click",function(){
		location.href='/bbs_list';
	});
	$('#mypage').on("click",function(){
		location.href='/mypage';
	});
	$('#mylib').on("click",function(){
		location.href='/mypage?tab_menu=lib';
	});
	$('#adpage').on("click",function(){
		location.href='/admin/adIndex';
	});
	$('#logout').on("click",function(){
		location.href='/logout';
	});
	
	
	$('#find_id').on("click",function(){
		window.open("/id_find","아이디검색","width=400px,height=300px"+
		 ",scrollbars=yes");
	});
	$('#find_pw').on("click",function(){
		window.open("/pwd_find","비번검색","width=450px,height=300px"+
		 ",scrollbars=yes");
	});
	$('#join').on("click",function(){
		location.href='/join';
	});
	
	
	$('#new_book_more').on("click",function(){
		location.href='/new';
	});
	$('#popular_book').on("click",function(){
		location.href='/popular';
	});
	$('#recomm_book').on("click",function(){
		location.href='/recomm';
	});
	$('#gongi_more').on("click",function(){
		location.href='/bbs_list';
	});
	
	
	
	$('#depth_label').on("click","span",function(){
		$('#depth_label > span').removeClass('active');
		$('.book_tap_body').hide();
		$(this).addClass('active');
		$('#'+$(this).data('tap')).show();
	});
});