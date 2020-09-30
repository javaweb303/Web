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
<body style="background:url(resources/images/viewer/viewbg.png) repeat">
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

function loadApp() {

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
}

// Load the HTML4 version if there's not CSS transform

yepnope({
	test : Modernizr.csstransforms,
	yep: ['resources/turnjs/lib/turn.js'],
	nope: ['resources/turnjs/lib/turn.html4.min.js'],
	both: ['resources/css/basic.css'],
	complete: loadApp
});

</script>

</body>
</html>






