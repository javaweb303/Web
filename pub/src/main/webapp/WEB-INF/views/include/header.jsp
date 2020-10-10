<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="resources/css/header.css" />
<link rel="stylesheet" type="text/css" href="resources/css/footer.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="resources/js/ae.js"></script>
<style>
#slidermenu_back{background:url("resources/images/menuShadow.png") repeat; position: fixed; right:-100%; z-index: 10;}
</style>
</head>
<body>
	<div id="wrap">
	<jsp:include page="../menu.jsp"></jsp:include>
	<div id="topsp"></div>
		<header>
			<div id="head">
				<div class="logo">
					<a href="/"><img alt="로고" src="resources/images/logo/logo_white.png"></a>
				</div>
				<nav class="nav">
					<ul id="gnb">
						<li class="gnb_menu"><a href="/search">도서관 서비스</a>
							<ul class="gnb_sub">
								<li><a href="/search">통합검색</a></li>
								<li><a href="/new">신간도서</a></li>
								<li><a href="/popular">인기도서</a></li>
								<li><a href="/recomm">추천도서</a></li>
							</ul></li>
						<li class="gnb_menu"><a href="/eBook">전자 도서관</a>
							<ul class="gnb_sub">
								<li><a href="/eBook">전자책</a></li>
							</ul></li>
						<li class="gnb_menu"><a href="/history">도서관안내</a>
							<ul class="gnb_sub">
								<li><a href="/history">도서관 소개</a></li>
								<li><a href="/guide">도서관 이용</a></li>
								<li><a href="/location">오시는 길</a></li>
							</ul></li>
						<li class="gnb_menu"><a href="/bbs_list">열린공간</a>
							<ul class="gnb_sub">
								<li><a href="/bbs_list">공지사항</a></li>
								<li><a href="/faq">FAQ</a></li>
							</ul></li>
					</ul>
				</nav>
				<div class="lnb">
					<!--<a href="#"><img alt="로고" src="../images/searchBtn.png"></a>-->
					<c:if test="${empty id}">
					<a href="/login"><img alt="로고" src="resources/images/sllogin.png"></a>
					</c:if>
					<c:if test="${!empty id}">
					<a href="/logout"><img alt="로고" src="resources/images/sllogin.png"></a>
					<c:if test="${Rank eq '1'}">
		            	<a href="./mypage"><img src="resources/images/header/myPage.png"></a>
		            </c:if>
		            <c:if test="${Rank eq '5'}">
		            	<a href="/admin/adIndex"><img src="resources/images/header/myPage.png"></a>
		            </c:if>
					</c:if>
					<!-- href를 안쓰는 이유 쓰면 상단을 이동됨. 아니면 #'아무문자나 입력' --> 
					<a id="slbtn"><img alt="로고" src="resources/images/menu.png"></a>
				</div>
			</div>
		</header>