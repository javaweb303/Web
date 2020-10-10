<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />

<style>
/*헤더 색*/
#head {
	background-color: #5F78D4
} /*색변경*/
#gnb li ul {
	border-top: 7px solid #B36276;
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
	background-color: #6B87ED;
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
	float: left;
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

/* 검색 버튼 */
.keywordSearchForm .btnSubmit input {
	display: block;
	width: 70px;
	padding-left: 20px;
	font-weight: 600;
	line-height: 36px;
	color: #fff;
	text-align: center;
	background: #464646 url(/resources/images/library_img/ico_srch.png) 10px
		50% no-repeat;
}

/* 검색 결과 리스트 */
.bookDataWrap {
	font-size: 0.928em
}

.bookDataWrap .tit {
	display: block;
	margin-bottom: 6px;
	font-size: 1.154em;
	color: #333
}

.bookDataWrap .tit a:hover, .bookDataWrap .tit a:focus, a.writer:hover,
	a.writer:focus, a.publisher:hover, a.publisher:focus {
	text-decoration: underline
}

.bookDataWrap a.btnState:hover, .bookDataWrap a.btnState:focus {
	box-shadow: inset 0 0 5px 2px rgba(255, 255, 255, .9)
}

.bookDataWrap .txt span {
	margin-right: 7px;
	padding-right: 8px;
	background: url(/include/image/common/bg_slit.png) 100% 52% no-repeat
}

.bookDataWrap .txt span:last-child {
	margin-right: 0;
	padding-right: 0;
	background: none
}

.resultList {
	border-top: 2px solid #464646
}

.resultFilter ~ .resultList {
	border-top: 0
}

.resultList>li {
	overflow: hidden;
	position: relative;
	padding: 15px 0;
	border-bottom: 1px solid #c5c5c5
}

.resultList>li.emptyNote {
	line-height: 135px
}

.resultList .thumb .cover {
	display: inline-block;
	max-width: 110px;
	height: 150px;
	padding-top: 4px;
	background: url(/resources/images/library_img/bg_book.png) 0 0 no-repeat;
	background-size: 100% 4px
}

.resultList .thumb .cover img {
	display: block;
	max-width: 100%;
	height: 100%;
	border: 1px solid #969696;
	box-sizing: border-box
}

.resultList.descType>li {
	min-height: 154px
}

.resultList.descType .thumb {
	position: absolute;
	top: 15px;
	left: 0
}

.resultList.descType .thumb a {
	position: relative
}

.resultList.descType .bookDataWrap {
	margin-left: 125px
}

.resultList.descType .bookDataWrap li {
	margin-bottom: 6px
}

.resultList.descType .desc {
	overflow: hidden;
	height: 40px;
	line-height: 20px;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical
}

.resultList.dataType>li {
	padding: 0
}

/*책 제목 색*/
.themeFC {
	color: #0066b3 !important;
}

/*책정보- 저자, 출판사 등*/
.sdot-ist>li {
	padding-left: 6px;
}
</style>
<div id="content">
	<div class="content_head">
		<h2>전자잭</h2>
	</div>
	<div class="location">
		<ul class="">
			<li>통합검색</li>
			<li>전자도서관 ></li>
			<li><a href="/">Home</a> ></li>
		</ul>
	</div>

	<!-- body -->
	<div class="container">
		<div class="cont_wrap">

			<!-- 좌측 카테고리 -->
			<div class="cont_lnb">
				<h2>전자 책</h2>
				<ul class="cont_lnb_sub">
					<li><a href="/eBook">통합검색</a></li>
				</ul>
			</div>
			<!-- 좌측 카테고리 끝 -->

			<!-- 우측 본문내용 -->
			<div class="cont_box">
				<h2>전자책</h2>
				<div>
					<!-- 우측 메뉴 창 -->
					<!-- 검색 폼(검색 버튼 클릭하면 검색 키워드가 컨트롤러에 전송) -->
					<form name="searchForm" id="searchForm">
						<div class="contentcore">
							<div class="nav">
								<h3>통합검색</h3>
								<br>
							</div>
							<!-- 검색창 -->
							<div class="contents" id="contents">
								<!-- 검색 카테고리(kdc분류) -->
								<div class="keywordSearchForm">
									<div class="field">
										<label for="searchCa" class="blind">전체</label> <select
											name="searchCa" class="searchCa">
											<option value="0" <c:if test="${categoryId==0}">selected</c:if>>전체</option>
											<option value="1" <c:if test="${categoryId==1}">selected</c:if>>소설/시/희곡</option>
											<option value="656" <c:if test="${categoryId==656}">selected</c:if>>인문학</option>
											<option value="987" <c:if test="${categoryId==987}">selected</c:if>>과학</option>
											<option value="798" <c:if test="${categoryId==798}">selected</c:if>>사회과학</option>
											<option value="74" <c:if test="${categoryId==74}">selected</c:if>>역사</option>
											<option value="517" <c:if test="${categoryId==517}">selected</c:if>>예술/대중문화</option>
											<option value="1322" <c:if test="${categoryId==1322}">selected</c:if>>외국어</option>
											<option value="1237" <c:if test="${categoryId==1237}">selected</c:if>>종교/역학</option>
										</select>
									</div>
									<!-- 검색 키워드 분류 카테고리(전체 or 제목 or 저자 or 출판사) -->
									<div class="searchSelect">
										<label for="searchCondition" class="blind">전체</label> <select
											id="searchCondition" name="searchCondition" title="검색 선택">
											<option value="Keyword" <c:if test="${queryType=='Keyword'}">selected</c:if>>전체</option>
											<option value="Title" <c:if test="${queryType=='Title'}">selected</c:if>>제목</option>
											<option value="Author" <c:if test="${queryType=='Author'}">selected</c:if>>저자</option>
											<option value="Publisher" <c:if test="${queryType=='Publisher'}">selected</c:if>>출판사</option>
										</select>
									</div>
									<!-- 검색어 입력 -->
									<div class="keywordInput">
										<input type="text" id="searchKeyword" name="searchKeyword"
											title="검색어를 입력하세요" placeholder="검색어를 입력하세요"
											autocomplete="off" class="ac_input" value="${query}">
									</div>
									<!-- 버튼으로 검색 결과 컨트롤러에 전송 -->
									<div class="btnSubmit">
										<input type="submit" value="검색">
									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- 검색창 끝 -->
					<br> <br>
					<!-- 검색 결과 리스트 출력 -->
					<ul class="resultList descType">
					<!-- 반복문을 통해 검색 결과 리스트 출력 -->
						<c:forEach items="${pubList}" var="list" step="1">
							<li>
								<!-- 검색한 책 이미지 출력(isbn을 통해 도서 상세 페이지로 이동) -->
								<div class="thumb">
									<a href="/ebookcont?isbn=${list['isbn13']}" class="cover"> <img
										src="${list['cover']}">
									</a>
								</div>
								<!-- 검색한 책 제목, 정보 출력(isbn을 통해 책 제목을 클릭하면 도서 상세 페이지로 이동) -->
								<div class="bookDataWrap">
									<strong class="tit"> <a
										href="ebookcont?isbn=${list['isbn13']}"> <span
											class="seachKwd themeFC">${list['title']}</span>
									</a>
									</strong>
									<!-- 검색한 책 정보 출력(저자, 출판사, 발행연도, isbn) -->
									<ul class="sdot-list">
										<li>저자 : ${list['author']}</li>
										<li>출판사 : ${list['publisher']}</li>
										<li>발행연도 : ${list['pubDate']}</li>
										<li>ISBN : ${list['isbn13']}</li>
									</ul>
								</div>
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
<jsp:include page="../include/footer.jsp" />