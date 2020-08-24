<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>

<style>
/*헤더 색*/
#head {
	background-color: #D4748C;
} /*색변경*/
/*#gnb li ul{border-top: 7px solid #b5c13e;}/*색변경*/
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
	clear: both;
	overflow: hidden;
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

/* 책정보 */
div {
	display: block;
}
/*contents*/
#contents {
	position: relative;
}

@media screen and (min-width:1000px) {
	#contents {
		min-height: 500px
	}
}

/* search result view */
.searchViewWrap .htitle {
	margin: 20px 0 0;
	padding-bottom: 10px
}

.resultViewDetail {
	overflow: hidden;
	position: relative;
	margin-bottom: 30px;
	border: 2px solid #464646;
	border-radius: 5px;
	background-color: #fff
}

.resultViewDetail .tit {
	position: relative;
	padding: 10px 15px;
	font-weight: 600;
	font-size: 1.154em;
	line-height: 1.3;
	background-color: #f4f4f4
}

.resultViewDetail .resultBookInfo {
	position: relative;
	min-height: 210px;
	padding: 20px
}

.resultViewDetail .thumb {
	position: absolute;
	top: 20px;
	left: 20px
}

.resultViewDetail .thumb .cover {
	display: inline-block;
	overflow: hidden;
	padding: 6px 17px 10px;
	background: url(/include/image/common/bg_book_cover.png) 0 0 no-repeat
}

.resultViewDetail .thumb .tag {
	position: absolute;
	top: 0;
	left: 22px;
	line-height: 0
}

.resultViewDetail .thumb .img {
	display: block;
	width: 136px;
	height: 194px;
	border: 1px solid #969696
}

.resultViewDetail .thumb .img img {
	display: block;
	width: 100%;
	height: 100%
}

.resultViewDetail .bookDataWrap {
	margin-left: 190px
}

.resultViewDetail .bookDataWrap li {
	margin-bottom: 6px
}

.resultBookDesc {
	padding-bottom: 20px;
	border-bottom: 1px solid #d7d7d7
}

.resultBookDesc>p ~ p, .ebookGuide>p ~ p {
	margin-top: 10px
}

/* title */
.htitle {margin:30px 0 10px;font-weight:600;font-size:1.286em}
.htitle:first-child,.htitle:nth-of-type(1) {margin-top:0}
.htitle {color: #0066b3 !important;}

/* button */
.btnGroup {overflow:hidden;position:relative;margin:30px auto;text-align:center}
.btnGroup:after {content:"";display:block;clear:both}

.btn {display:inline-block;min-width:80px;padding:7px 15px;line-height:20px;color:#fff;text-align:center;letter-spacing:-1px;vertical-align:middle;box-sizing:border-box;background-color:#666}
@media screen and (max-width:640px) {
	.btnGroup .btn {margin-bottom:5px}
}
@media screen and (max-width:360px) {
	.btnGroup .btn {display:block}
}
@media screen and (min-width:1000px) {
	.btnGroup .btn {padding:10px 20px}
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
			<li>상세정보</li>
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
				<h2>도서 상세 정보</h2>
				<div>
					<!-- 여기 안에 들어갈 내용 잘 배치하면됩니다. 지우고 쓰세요-->
					<div class="contents" id="contents">

						<c:forEach items="${pubList}" var="list" step="1">
							<div class="searchViewWrap">
								<!-- 도서 기본 정보-->
								<div class="resultViewDetail">
									<div class="tit">
										<h4>${list['bookname']}</h4>
									</div>
									<div class="resultBookInfo">
										<div class="thumb">
											<div class="cover">
												<span class="img"><img src="${list['bookImageURL']}"
													alt="책이미지"
													onerror="javascript:fnErrorBookImgFile(this); return false;"></span>
											</div>
										</div>
										<div class="bookDataWrap">
											<ul class="sdot-list">
												<li>저자 : ${list['authors']}</li>
												<li>출판사 : ${list['publisher']}</li>
												<li>발행연도 : ${list['publication_year']}</li>
												<li>ISBN : ${list['isbn']}</li>
											</ul>
										</div>
									</div>
								</div>
								<h5 class="htitle">책소개</h5>
								<div class="resultBookDesc">

									<p>${list['description']}</p>

								</div>
								<div class="btnGroup">
									<a href="#none" id="listBtn" class="btn list">목록</a>
								</div>
							</div>
						</c:forEach>
					</div>

					<!-- 여기까지가 몸체우측 -->
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
