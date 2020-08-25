<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />

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

#content .container .cont_lnb {
	padding: 0 10px;
}

#content .container .cont_lnb .cont_lnb_sub li {
	padding: 15px 0;
	border-bottom: 1px solid #e6e6e6;
}

/*메인 내용*/
#content .container .cont_box {
	margin-left: 300px;
	width: auto;
}

#content .container .cont_box h2 {
	padding: 35px 10px 20px;
	border-bottom: 1px solid gray;
	margin-bottom: 30px;
}

/* 검색 카테고리 선택 */
#categorySearch {
	margin-bottom: 15px;
	padding: 15px 25px;
	border-radius: 5px;
	background-color: #f1f3f6;
}

/* 검색창 */
.keywordSearchForm {
	position: relative;
	height: 38px;
	line-height: 38px;
	border-radius: 5px;
	border: 3px solid #464646;
}

.keywordSearchForm .searchSelect {
	position: absolute;
	top: 0;
	left: 0;
	width: 80px;
	height: 38px;
	margin: 0;
	padding: 0;
}

.keywordSearchForm .searchSelect select {
	width: 100%;
	height: 38px;
	line-height: 38px;
	padding: 0 15px 0 5px;
	vertical-align: top;
	border: 0;
	background-color: transparent;
}

.keywordSearchForm .keywordInput {
	position: relative;
	margin: 0 85px;
}

.keywordSearchForm .keywordInput input {
	display: block;
	width: 100%;
	height: 38px;
	margin: 0;
	padding: 0;
	border: 0 none;
	box-sizing: border-box;
}

.keywordSearchForm .btnSubmit {
	position: absolute;
	top: 0;
	right: 0;
}

.keywordSearchForm .btnSubmit a {
	display: block;
	width: 55px;
	padding-left: 20px;
	font-weight: 600;
	font-size: 16px;
	line-height: 38px;
	color: #fff;
	text-align: center;
	background: #464646 url(../images/keywordSearchBtn.png) 10px 50%
		no-repeat;
}

.blind {
	overflow: hidden;
	position: absolute;
	top: -9999em;
	left: -9999em;
	width: 1px;
	height: 1px;
	line-height: 1px;
	text-indent: -9999em;
}

/* keyword search form */
.keywordSearchForm {
	position: relative;
	height: 38px;
	line-height: 38px;
	border-radius: 5px;
	border: 3px solid #464646;
	
}

.keywordSearchForm .field {
	position: absolute;
	top: 0;
	left: 0;
	width: 80px;
	height: 38px;
	margin: 0;
	padding: 0;
	float : left;
}
.keywordSearchForm .field select {
	width: 100%;
	height: 38px;
	line-height: 38px;
	padding: 0 15px 0 5px;
	vertical-align: top;
	border: 0;
	background-color: transparent
}

.keywordSearchForm .searchSelect {
	position: absolute;
	top: 0;
	left: 85px;
	width: 80px;
	height: 38px;
	margin: 0;
	padding: 0;
	float: left;
	
	
}

.keywordSearchForm .searchSelect select {
	width: 100%;
	height: 38px;
	line-height: 38px;
	padding: 0 15px 0 5px;
	vertical-align: top;
	border: 0;
	background-color: transparent
}

.keywordSearchForm .keywordInput {
	position: relative;
	margin: 0 175px;
}

.keywordSearchForm .keywordInput input {
	display: block;
	width: 100%;
	height: 38px;
	margin: 0;
	padding: 0;
	border: 0 none;
	box-sizing: border-box
}

.keywordSearchForm .btnSubmit {
	position: absolute;
	top: 0;
	right: 0
}

.keywordSearchForm .btnSubmit a {
	display: block;
	width: 55px;
	padding-left: 20px;
	font-weight: 600;
	font-size: 16px;
	line-height: 38px;
	color: #fff;
	text-align: center;
	background: #464646 url(/include/image/common/ico_srch.png) 10px 50%
		no-repeat
}

/* 책 정보 */
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
</style>
<div id="content">
	<div class="content_head">
		<h2>도서관 서비스</h2>
	</div>
	<div class="location">
		<ul class="">
			<li>통합 검색</li>
			<li>도서관 서비스 ></li>
			<li><a href="../index.jsp">Home</a> ></li>
		</ul>
	</div>

	<!-- body -->
	<div class="container">
		<div class="cont_wrap">

			<!-- 좌측 카테고리 -->
			<div class="cont_lnb">
				<h2>통합 검색</h2>
				<ul class="cont_lnb_sub">
					<li><a href="/search">통합검색</a></li>
					<li><a href="/new">신간도서</a></li>
					<li><a href="/popular">인기도서</a></li>
					<li><a href="/recomm">추천도서</a></li>
				</ul>
			</div>
			<!-- 좌측 카테고리 끝 -->

			<!-- 우측 본문내용 -->
			<div class="cont_box">
				<h2>통합 검색</h2>
				<div>
					<!-- 우측 메뉴 창 -->
					<form name="searchForm" id="searchForm">
						<div class="contentcore">
							<div class="nav">
								<h3>통합검색</h3>
								<br>
							</div>
							<div class="contents" id="contents">
								<!-- 검색 폼 -->



								<!-- 검색창 -->
								<div class="keywordSearchForm">
									<div class="field">
										<label for="searchCa" class="blind">전체</label> <select
											name="searchCa" class="searchCa">
											<option value="0" selected="selected">전체</option>
											<option value="1">소설/시/희곡</option>
											<option value="656">인문학</option>
											<option value="987">과학</option>
											<option value="798">사회과학</option>
											<option value="74">역사</option>
											<option value="517">예술/대중문화</option>
											<option value="1322">외국어</option>
											<option value="1237">종교/역학</option>
										</select>
									</div>
									<div class="searchSelect">

										<label for="searchCondition" class="blind">전체</label> <select
											id="searchCondition" name="searchCondition" title="검색 선택">
											<option value="Keyword" selected="selected">전체</option>
											<option value="Title">제목</option>
											<option value="Author">저자</option>
											<option value="Publisher">출판사</option>
										</select>
									</div>
									<div class="keywordInput">
										<input type="text" id="searchKeyword" name="searchKeyword"
											title="검색어를 입력하세요" placeholder="검색어를 입력하세요"
											autocomplete="off" class="ac_input">
									</div>
									<div class="btnSubmit">
										<!-- <a href="/controller/detail" onclick="">검색</a> -->
										<input type="submit" value="검색">
									</div>
								</div>
								<!-- 검색창 끝 -->
							</div>
						</div>
					</form>
					<br> <br>
					<hr>
					<br> <br>
					<div class="imgList_wrap">
						<ul class="list_img">
							<c:forEach items="${pubList}" var="list" step="1">
								<li>
									<div class="over"
										onclick="location.href='/bookcont?isbn=${list['isbn13']}';">
										<strong>${list['title']}</strong>
										<%-- <span>${list['author']}</span>--%>
										<p>${list['publisher']}</p>
										<p>${list['pubDate']}</p>
									</div> <img src="${list['cover']}" class="img-responsive thumImg">
								</li>
							</c:forEach>
						</ul>
					</div>

					<!-- 우측 메뉴 끝 -->
				</div>
			</div>
			<!-- 여기까지가 몸체우측 -->
		</div>
	</div>
</div>
<jsp:include page="../include/footer.jsp" />