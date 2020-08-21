<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="javax.xml.parsers.*"%>
<%@ page import="java.util.*"%>
<%@page import="java.util.Map"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<style>
/*헤더 색*/
#head {
	background-color: #D4748C
} /*색변경*/
#gnb li ul {
	border-top: 7px solid #f18023;
} /*색변경*/
/*내용*/
#content {
	height: 100%;
}

#content .container {
	margin: 0 40px;
	height: 100%;
	padding-bottom: 80px;
}

/*테마 이름*/
#content .content_head {
	height: 200px;
	background-color: #ED829D;
} /*색변경*/
#content .content_head h2 {
	padding: 75px 0 70px;
	text-align: center;
}
/*로컬주소*/
#content .location {
	margin: 0 auto 23px;
	width: 100%;
}

#content .location ul li {
	float: right;
	list-style: none;
	right: 4%;
}
/*카테고리*/
#content .cont_wrap {
	position: relative;
}

#content .container .cont_lnb {
	position: absolute;
	width: 250px;
	height: 100%;
	padding-bottom: 30px;
}

#content .container .cont_lnb h2 {
	padding: 35px 10px 20px;
	border-bottom: 1px solid gray;
}

#content .container .cont_lnb .cont_lnb_sub li {
	padding: 15px 0;
	border-bottom: 1px solid #e6e6e6;
}

#content .container .cont_lnb {
	padding: 0 10px;
}

/*메인 내용*/
#content .container .cont_box {
	margin-left: 300px;
	width: auto;
}

#content .container .cont_lnb {
	position: absolute;
	width: 250px;
	height: 100%;
	background-color: #fcfcfc;
	padding: 0 10px;
	padding-bottom: 30px;
}

#content .container .cont_box .Category_box, #content .container .cont_box .inputbox,
	#content .container .cont_box .searchbtn {
	box-sizing: border-box;
	margin: 5px;
	height: 30px;
}

#content .container .cont_box .inputbox {
	width: 30%;
}

#content .container .cont_box h2 {
	padding: 35px 10px 20px;
	border-bottom: 1px solid gray;
	margin-bottom: 30px;
}

/*책 이미지*/
.imgList_wrap {
	position: relative;
	padding: 10px 0
}

.imgList_wrap .list_img {
	display: inline-block;
	width: 100%
}

.imgList_wrap .list_img li {
	position: relative;
	display: block;
	box-sizing: border-box;
	cursor: pointer;
	float: left;
	margin: 0;
	width: 18%;
}

.imgList_wrap .list_img li:last-child, .imgList_wrap .list_img li:nth-child(5),
	.imgList_wrap .list_img li:nth-child(10), .imgList_wrap .list_img li:nth-child(15)
	{
	margin: 0 0 30px 0
}

.imgList_wrap .list_img .thumImg {
	width: 80%;
	height: 250px;
	margin : 20px;
}

.imgList_wrap .list_img li .over {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	padding: 20% 0 0;
	width: 100%;
	line-height: 28px;
	color: #fff;
	text-align: center;
	background: rgba(0, 0, 0, .7);
	font-size: 12px;
	display: none
}

.imgList_wrap .list_img li:hover .over {
	display: block
}

.imgList_wrap .list_img li .over>strong {
	padding: 0 10px;
	font-weight: lighter;
	font-size: 1.5em !important;
	color: #ff7200;
	display: -webkit-box;
	-webkit-line-clamp: 2
}

.imgList_wrap .list_img li .over>span, .over>strong {
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-box-orient: vertical;
	word-wrap: break-word
}

.imgList_wrap .list_img li .over>span {
	display: -webkit-box;
	-webkit-line-clamp: 1
}

.imgList_wrap .list_img li .over>p, .imgList_wrap .list_img li .over>span
	{
	margin: 5% 0 0;
	padding: 0 10px;
	color: #fff;
	font-size: 1.25em
}

.imgList_wrap .list_img li .over>em {
	position: absolute;
	bottom: 72px;
	left: 0;
	right: 0;
	padding-top: 10px;
	font-size: 1.1em;
	text-align: center
}

.imgList_wrap .list_img li .over>em:before {
	content: "";
	position: absolute;
	top: 0;
	left: 50%;
	margin: 0 0 0 -13px;
	display: inline-block;
	width: 27px;
	height: 1px;
	background: #fff
}
</style>

<div id="content">
	<div class="content_head">
		<h2>도서관 서비스</h2>
	</div>
	<!-- 이거 바꾸고 -->
	<div class="location">
		<!-- 이것도 이건 상단에 home>열린공간 >오시는길 이거 표시하는 부분? -->
		<ul class="">
			<li>신간도서</li>
			<li>도서관서비스 ></li>
			<li><a href="../index.jsp">Home</a> ></li>
		</ul>
	</div>
	<div class="container">
		<!-- 몸체 -->
		<div class="cont_wrap">
			<div class="cont_lnb">
				<!-- 카테고리 부분 몸체 좌측-->
				<h2>도서관 서비스</h2>
				<ul class="cont_lnb_sub">
					<li><a href="/search">통합검색</a></li>
					<li><a href="/new">신간도서</a></li>
					<li><a href="/popular">인기도서</a></li>
					<li><a href="/recomm">추천도서</a></li>
				</ul>
			</div>
			<div class="cont_box">
				<!-- 몸체 우측공간 -->
				<h2>신간도서</h2>
				<div>
					<!-- 여기 안에 들어갈 내용 잘 배치하면됩니다. 지우고 쓰세요-->
					<div class="imgList_wrap">
						<ul class="list_img">
							<c:forEach items="${pubList}" var="list" step="1">
								<li>
								<a href="/bookcont?isbn=${list['isbn']}">
									<div class="over">
										<strong>${list['title']}</strong><br>
										<%-- <span>${list['author']}</span>--%>
										<p>${list['publisher']}</p>
										<p>${list['pubDate']}</p>
									</div> 
									<img src="${list['coverLargeUrl']}" class="img-responsive thumImg">
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<!-- 여기까지가 몸체우측 -->
		</div>
	</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>