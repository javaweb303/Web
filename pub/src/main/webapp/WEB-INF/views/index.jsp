<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="resources/css/index.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="resources/js/slider.js"></script>
<script type="text/javascript" src="resources/js/mainpage.js"></script>
<script>
</script>
</head>
<body>
   <div id="wrap">
   <jsp:include page="./menu.jsp"></jsp:include>
      <header>
      	<div style="height: 110px; background-image: url('resources/images/logo.png'); background-position: 0 0; background-size: 200px 110px; background-repeat: no-repeat;"></div>
      	<div id="navbox">
         <nav id="nav">
         	<span id="service">도서관 서비스</span><span id="eBook">전자 도서관</span><span id="history">도서관 안내</span><span id="open">열린공간</span>
         </nav>
         </div>
      </header>
      <div id="container" role="main">
      	<div id="con_top">
      		<div id="con_top_left">
      			<div id="slider-wrap">
		      		<div class="slider">
		      			<ul>
		      				<li><div><img alt="슬라이더 이미지" src="resources/images/slider/s1.jpg"></div></li>
		      				<li><div><img alt="슬라이더 이미지" src="resources/images/slider/s2.jpg"></div></li>
		      				<li><div><img alt="슬라이더 이미지" src="resources/images/slider/s3.jpg"></div></li>
		      			</ul>
		      			<a href="#" class="btnPrev controller"><img alt="" src="resources/images/slider/btnPrev.png"> </a>
		      			<a href="#" class="btnNext controller"><img alt="" src="resources/images/slider/btnNext.png"></a>
		      		</div>
		      	</div>
      		</div>
      		<div id="con_top_right">
      		<c:if test="${empty id}">
      		<div id="member_box">
      			
	      			<div>
	      				<form action="/login_ok" method="post">
	      				<table>
	      				<tr>
	      				<th><input type="text" name="id" class="member_input" placeholder="아이디"></th>
	      				</tr>
	      				<tr>
	      				<th><input type="password" name="pwd" class="member_input" placeholder="비밀번호"></th>
	      				</tr>
	      				<tr>
	      				<th><input type="submit" id="login_btn" class="member_input" value="로그인"></th>
	      				</tr>
	      				</table>
	      				</form>
	      			</div>
	      			<span id="find_id">아이디 찾기</span> <span id="find_pw">비밀번호 찾기</span><span id="join">회원가입</span>
      		</div>
      		</c:if>
      		<c:if test="${!empty id}">
	      			<div class="login_box" style="height: 100%; float: left; overflow: hidden; padding-left:10px">
	      			<h2>
	      			<img alt="로그인" src="<c:url value='resources/images/txt_login.gif' />">
	      			</h2>
	      			<ul class="login" style="width:180px; height:40px; padding:5px; margin-left:15px; float:left;">
	      			<li class="login_id" style="margin-bottom: 5px;">
	      			<strong style="color:#555274;">${id}</strong>님 환영합니다.<br>
	      			<div class="email" style="color:gray; font-size:small">${member_info.email}@${member_info.email_domain}</div>
	      			</li>
	      			</ul>
	      			<a href="/logout"><img src="<c:url value='/resources/images/btn_logout.gif' />" alt="로그아웃"></a>
	      			<div class="new_box" style="overflow:hidden; display:inline-block; padding:10px; width:100%; margin-top:5px; margin-left:10px; float:left; font-size:small"> 
	      			<c:if test="${Rank eq '1'}">
	      			<a href="/mypage?tab_menu=lib" class="link_new">내 서재</a>
	      			<a href="/mypage" class="link_new">마이 페이지</a> 
	      			</c:if>
	      			<c:if test="${Rank eq '5'}">
	      			<a href="/mypage" class="link_new">마이페이지</a> 
	      			<a href="/admin/adIndex" class="link_new">관리자 페이지</a> 
	      			</c:if>
	      			</div>  
	      			</div>
	      			</c:if>
      		</div>
      	</div>
      	<div id="con_center">
      		<div id="bookbox">
      			<div id="booklable">
      			<div id="depth_label" style="border-bottom: 1px solid gray; ">
      			<span data-tap="new_book" class="active">신간도서</span><span data-tap="popular_book">인기도서</span><span data-tap="recomm_book">추천도서</span>
      			</div>
      			</div>
      			<div id="new_book" class="book_tap_body">
					<ul style="width: auto; height: 225px; overflow: hidden; list-style: none; padding-top: 25px; position: relative;">
						<c:forEach items="${newList}" var="list" step="1">
							<li style="width: 150px; height: 225px; float:left; margin: 0 25px;">
							<a href="./bookcont?isbn=${list['isbn13']}">
							<img alt="책이미지" src="${list['cover']}" style="width: 150px; height: 200px;"></a>
							<p style="width: 150px; height: 25px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${list['bookname']}</p>
							</li>
						</c:forEach>
						<span style="position: absolute; bottom: 3px; right: 3px;" id="new_book_more">더보기>></span>
					</ul>
				</div>
				<div id="popular_book" class="book_tap_body" style="display: none;">
					<ul style="width: auto; height: 225px; overflow: hidden; list-style: none; padding-top: 25px; position: relative;">
						<c:forEach items="${popularList}" var="list" step="1">
							<li style="width: 150px; height: 225px; float:left; margin: 0 25px;">
							<a href="./bookcont?isbn=${list['isbn13']}">
							<img alt="책이미지" src="${list['cover']}" style="width: 150px; height: 200px;"></a>
							<p style="width: 150px; height: 25px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${list['bookname']}</p>
							</li>
						</c:forEach>
						<span style="position: absolute; bottom: 3px; right: 3px;" id="popular_book_more">더보기>></span>
					</ul>
				</div>
				<div id="recomm_book" class="book_tap_body" style="display: none;">
					<ul style="width: auto; height: 225px; overflow: hidden; list-style: none; padding-top: 25px; position: relative;">
						<c:forEach items="${recommList}" var="list" step="1">
							<li style="width: 150px; height: 225px; float:left; margin: 0 25px;">
							<a href="./bookcont?isbn=${list['isbn13']}">
							<img alt="책이미지" src="${list['cover']}" style="width: 150px; height: 200px;"></a>
							<p style="width: 150px; height: 25px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${list['bookname']}</p>
							</li>
						</c:forEach>
						<span style="position: absolute; bottom: 3px; right: 3px;" id="recomm_book_more">더보기>></span>
					</ul>
				</div>
      		</div><!-- bookbox -->
				<div id="gongibox" style="padding-top: 5px; width: 100%">
					<div style="display: table; width: 100%; height: 60px;"><div style="display: table-cell; table-layout: fixed; vertical-align: middle; border-bottom: 1px solid gray; background-color: #726d98; "><span style="font-size: 18px;padding: 15px 4%; font-weight: 700; color: white;">공지사항</span></div></div>
					<div id="listBox">
						<ul style="position: relative; padding-bottom: 20px;">
							<c:if test="${!empty glist}">
								<c:forEach var="g" items="${glist}">
								<li><a href="gongji_cont?gongji_no=${g.gongji_no}"><span>${g.gongji_title}</span></a><span style="float: right;">${g.gongji_date}</span></li>
								</c:forEach>
							</c:if>
							
							<c:if test="${empty glist}">
								<p>공지사항이 없다.</p>
							</c:if>
							<span style="position: absolute; bottom: 3px; right: 3px;" id="gongi_more">더보기 >></span>
						</ul>
					</div>
				</div>
			</div>
      <footer id="footer">
			<div class="footer-info">
				<!--<div class="logo">
					<img alt="하단로고" src="resources/images/logo_white.png">
				</div> -->
				<div class="footer-cont">
					<address>서울특별시 동작구 장승배기로 171 2층, 3층 303호</address>
					문의전화 02) 866-9357 | 팩스 02) 5249-1464
				</div>
				<p class="copy">COPYRIGHT © Library, Inc. All rights reserved</p>
			</div>
			<!--// footer-bottom -->
		</footer>
   </div>
</body>
</html>