<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width = 1050, user-scalable = no" />
<script type="text/javascript" src="resources/turnjs/extras/jquery.min.1.7.js"></script>
<script type="text/javascript" src="resources/turnjs/extras/modernizr.2.5.3.min.js"></script>
<style>
.on{color:#ff0000;}
</style>
</head>
<body style="background:url(resources/images/viewer/viewbg.png) repeat"onload="load();">
<div style="width: 100%;">
	<div style="width: 30%; margin: 0 auto; text-align: center; background-color: rgb(68, 68, 68); box-shadow: rgb(48, 48, 48) 0px 5px 7px; height: 30px; border-radius: 0 0 15px 15px / 0 0 15px 15px">
		<input type="button" value="First" id="First_" onclick="first();"><input type="button" value="Previous" id="Pre_" onclick="previous();"><input type="text" size="6" id="page_info" style="text-align: center;"><input type="button" value="Next" id="Next_" onclick="next();"><input type="button" value="Last" id="Last_" onclick="last();">
	</div>
</div>
<div class="flipbook-viewport">
	<div class="container">
		<div class="flipbook">
			<c:forEach begin="0" end="${book_imgfile}" step="1" var="i">
				<div style="background-image:url(/file/book/${book.e_no}_ebook/${i}.png)"></div>
			</c:forEach>
		</div>
	</div>
</div>


<script type="text/javascript">
var Maxpage=0;
function loadApp() {
	Maxpage=${book_imgfile};
	// Create the flipbook

	$('.flipbook').turn({
			// Width

			width:1075,
			
			// Height

			height:700,

			// Elevation

			elevation: 50,
			
			// Enable gradients

			gradients: true,
			
			// Auto center this flipbook

			autoCenter: true

	});
	getPage();
}

// Load the HTML4 version if there's not CSS transform

yepnope({
	test : Modernizr.csstransforms,
	yep: ['resources/turnjs/lib/turn.js'],
	nope: ['resources/turnjs/lib/turn.html4.min.js'],
	both: ['resources/css/basic.css'],
	complete: loadApp
});
function getPage(){
	$('#page_info').val($('.flipbook').turn('page')+'/'+$('.flipbook').turn('pages'));
}
function EvenPage(){
	$('#page_info').val($('.flipbook').turn('page')+'-'+($('.flipbook').turn('page')+1)+'/'+$('.flipbook').turn('pages'));
}
function OddPage(){
	$('#page_info').val($('.flipbook').turn('page')-1+'-'+$('.flipbook').turn('page')+'/'+$('.flipbook').turn('pages'));
}
function next(){
	$('.flipbook').turn('next');
	if($('.flipbook').turn('page')==$('.flipbook').turn('pages')){
		getPage();
	}else{
		EvenPage();
	}
}
function previous(){
	$('.flipbook').turn('previous');
	if($('.flipbook').turn('page')==1){
		getPage();
	}else{
		OddPage();
	}
}
function first(){
	$('.flipbook').turn('page',1);
	getPage();
}
function last(){
	$('.flipbook').turn('page',$('.flipbook').turn('pages'));
	getPage();
}
function inputPage(){//수정해야함.
	var pagenum = $('#page_info').val();
	$('.flipbook').turn('page',pagenum);
}
function divChange(){
	var pagenum=$('.flipbook').turn('page');
	if(pagenum == 1 || pagenum == $('.flipbook').turn('pages')){
		getPage();
	}else{
		if(pagenum % 2 == 0){
			EvenPage();
		}else{
			OddPage();
		}
	}
}
$('.flipbook').on("click",function(){
	divChange();
})
$('#page_info').focusout(function(){
	divChange();
});
$('#page_info').focus(function(){
	$('#page_info').val('');	
});
$('#page_info').keydown(function(event){
	if (event.keyCode == '13' || event.keyCode == '9') {//엔터,탭키 다운시 발생하는 이벤트
		inputPage();
	}
});
</script>

</body>
</html>






