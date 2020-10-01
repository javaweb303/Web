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
	margin: 0 2.5% 30px 0;
	width: 18%;
	border: 1px solid #d7d7d7
}

.imgList_wrap .list_img li:last-child, .imgList_wrap .list_img li:nth-child(5),
	.imgList_wrap .list_img li:nth-child(10), .imgList_wrap .list_img li:nth-child(15)
	{
	margin: 0 0 30px 0
}

.imgList_wrap .list_img .thumImg {
	width: 100%;
	height: 308px
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
	display: none;
	z-index: 1;
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

@media screen and (max-width:1200px) {
	.imgList_wrap .list_img .thumImg {
		height: 235px
	}
	.imgList_wrap .list_img li .over>span {
		font-size: 1.1em
	}
	.imgList_wrap .list_img li .over>em {
		bottom: 54px
	}
	.imgList_wrap .list_img li .over>em:before {
		margin: 10px 0 0 -13px
	}
}

@media screen and (max-width:993px) {
	.imgList_wrap .list_img .thumImg {
		height: 195px
	}
	.imgList_wrap .list_img li {
		border: 0 solid #d7d7d7
	}
	.imgList_wrap .list_img li .over>span {
		font-size: .75em
	}
	.imgList_wrap .list_img li .over>p {
		font-size: 1em
	}
	.imgList_wrap .list_img li:hover .over {
		display: none
	}
}

@media screen and (max-width:768px) {
	.imgList_wrap .list_img li {
		position: relative;
		display: block;
		box-sizing: border-box;
		cursor: pointer;
		float: left;
		margin: 0 4% 30px 0;
		width: 22%;
		border: 0 solid #d7d7d7
	}
	.imgList_wrap .list_img li:nth-child(5), .imgList_wrap .list_img li:nth-child(10),
		.imgList_wrap .list_img li:nth-child(15) {
		margin: 0 4% 30px 0
	}
	.imgList_wrap .list_img li:nth-child(4), .imgList_wrap .list_img li:nth-child(8),
		.imgList_wrap .list_img li:nth-child(12), .imgList_wrap .list_img li:nth-child(16)
		{
		margin: 0 0 30px 0
	}
	.imgList_wrap .list_img .thumImg {
		height: 225px
	}
	.imgList_wrap .btns {
		position: absolute;
		bottom: 18px;
		left: 0;
		right: 0;
		padding: 0 10%;
		text-align: center;
		margin: 10px 0 0
	}
}

@media screen and (max-width:640px) {
	.imgList_wrap .list_img li {
		position: relative;
		display: block;
		box-sizing: border-box;
		cursor: pointer;
		float: left;
		margin: 0 2% 30px 0;
		width: 32%;
		border: 0 solid #d7d7d7
	}
	.imgList_wrap .list_img li:nth-child(4), .imgList_wrap .list_img li:nth-child(5),
		.imgList_wrap .list_img li:nth-child(8), .imgList_wrap .list_img li:nth-child(10),
		.imgList_wrap .list_img li:nth-child(15), .imgList_wrap .list_img li:nth-child(16)
		{
		margin: 0 2% 30px 0
	}
	.imgList_wrap .list_img li:nth-child(3), .imgList_wrap .list_img li:nth-child(6),
		.imgList_wrap .list_img li:nth-child(9), .imgList_wrap .list_img li:nth-child(12),
		.imgList_wrap .list_img li:nth-child(15), .imgList_wrap .list_img li:nth-child(18)
		{
		margin: 0 0 30px 0
	}
	.imgList_wrap .list_img .thumImg {
		height: 235px
	}
}

@media screen and (max-width:560px) {
	.imgList_wrap .list_img .thumImg {
		height: 210px
	}
}

@media screen and (max-width:480px) {
	.imgList_wrap .list_img .thumImg {
		height: 185px
	}
}

@media screen and (max-width:414px) {
	.imgList_wrap .list_img li .over {
		display: none
	}
}

@media screen and (max-width:375px) {
	.imgList_wrap .list_img .thumImg {
		height: 165px
	}
}

a {
	cursor: pointer;
}

.img-responsive {
	max-width: 100%;
}

img {
	border: 0 none;
	vertical-align: top;
}

/* select box*/

.selectNomal {
    position: relative;
    display: block;
    height: 30px;
    top: -70px;
    margin-top: 0;
    margin-bottom: 0;
    bottom: 120px;
}

.selectBox01Nomal {
    position: relative;
    top: 0;
    right: 0;
    float: right;
}

.select.nomal {
    width: 215px;
    height: 28px;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    background: #fff url(data:image/png;base64,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) no-repeat 100%;
    padding-left: 12px;
    box-sizing: border-box;
    border: 1px solid #cdcdcd;
    font-size: 15px;
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
			<li>추천도서</li>
			<li>도서관서비스 ></li>
			<li><a href="/">Home</a> ></li>
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
				<h2>추천도서</h2>
				<div>
					<!-- 추천 도서 api 출력 -->
					<div class="imgList_wrap">
					<form name="search" method="post" action="/recomm">
					<div class="selectNomal">
						<div class="selectBox01Nomal">
							<select name="searchCa" class="select width nomal" onchange="location.href=(this.value)">
								<option value="/recomm?searchCa=1230" <c:if test="${categoryId==1230}">selected</c:if> >전체</option>
								<option value="/recomm?searchCa=1" <c:if test="${categoryId==1}">selected</c:if>>소설/시/희곡</option>
								<option value="/recomm?searchCa=656" <c:if test="${categoryId==656}">selected</c:if>>인문학</option>
								<option value="/recomm?searchCa=987" <c:if test="${categoryId==987}">selected</c:if>>과학</option>
								<option value="/recomm?searchCa=798" <c:if test="${categoryId==798}">selected</c:if>>사회과학</option>
								<option value="/recomm?searchCa=74" <c:if test="${categoryId==74}">selected</c:if>>역사</option>
								<option value="/recomm?searchCa=517" <c:if test="${categoryId==517}">selected</c:if>>예술/대중문화</option>
								<option value="/recomm?searchCa=1322" <c:if test="${categoryId==1322}">selected</c:if>>외국어</option>
								<option value="/recomm?searchCa=1237" <c:if test="${categoryId==1237}">selected</c:if>>종교/역학</option>
							</select>
						</div>
					</div>
					</form>
						<ul class="list_img">
							<!-- 반복문을 통해 api의 도서 정보 리스트 출력 -->
							<c:forEach items="${pubList}" var="list" step="1">
								<li>
									<!-- 도서 정보 hover로 보여짐 -->
									<div class="over"
										onclick="location.href='/bookcont?isbn=${list['isbn13']}';">
										<strong>${list['title']}</strong> <span>${list['author']}</span>
										<p>${list['publisher']}</p>
										<p>${list['pubDate']}</p>
									</div> <!-- 도서 이미지 --> <img src="${list['cover']}"
									class="img-responsive thumImg">
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