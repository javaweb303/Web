<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<style>
/*헤더 색*/
#head {
	background-color: #da690e
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
	background-color: #ec730f;
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
	border: 1px solid black;
	padding-bottom: 30px;
}

#content .container .cont_lnb h2 {
	padding: 35px 10px 20px;
	text-align: center;
	border-bottom: 1px solid red;
}

#content .container .cont_lnb {
	padding: 0 10px;
}

#content .container .cont_lnb .cont_lnb_sub li {
	padding: 15px 0;
	border-bottom: 1px solid gray;
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

.categorySearchForm {
	margin-bottom: 15px;
	padding: 15px 25px;
	border-radius: 5px;
	background-color: #f1f3f6
}

.categorySearchForm.pageCategory {
	text-align: left
}

.categorySearchForm .field {
	overflow: hidden
}

.categorySearchForm .field+.field {
	margin-top: 8px
}

.categorySearchForm .field .block {
	display: inline-block;
	float: left;
	position: relative;
	width: 50%;
	padding-left: 80px;
	box-sizing: border-box
}

.categorySearchForm.typeTotal .field .block {
	width: 40%
}

.categorySearchForm.typeTotal .field .block+.block {
	width: 60%
}

.categorySearchForm .field .block .tit {
	position: absolute;
	top: 0;
	left: 0;
	width: 80px;
	font-weight: normal;
	line-height: 32px;
	text-align: left
}

.categorySearchForm .field .block select {
	width: 100%
}

.categorySearchForm .field .block select.short {
	max-width: 150px
}

.categorySearchForm .field select.inpTextShort {
	width: 100px
}
</style>
<div id="content">
	<div class="content_head">
		<h2>도서관 서비스</h2>
	</div>
	<div class="location">
		<ul class="">
			<li>전체 검색</li>
			<li>도서관 서비스 ></li>
			<li><a href="../index.jsp">Home</a> ></li>
		</ul>
	</div>

	<!-- body -->
	<div class="container">
		<div class="cont_wrap">

			<!-- 좌측 카테고리 -->
			<div class="cont_lnb">
				<h2>전체 검색</h2>
				<ul class="cont_lnb_sub">
					<li><a href="/controller/search">전체도서</a></li>
					<li><a href="/controller/new">신간도서</a></li>
					<li><a href="/controller/popular">인기도서</a></li>
					<li><a href="/controller/recomm">추천도서</a></li>
				</ul>
			</div>
			<!-- 좌측 카테고리 끝 -->

			<!-- 우측 본문내용 -->
			<div class="cont_box">
				<h2>전체 검색</h2>
				<div>
					<!-- 우측 메뉴 창 -->
					<form name="searchForm" id="searchForm" method="post" action = "/controller/detail">
						<div class="contentcore">
							<div class="nav">
								<h3>전체검색</h3>
								<br>
							</div>
							<div class="contents" id="contents">
								<!-- 검색 폼 -->

								<!-- 검색 카테고리 선택 -->
								<div id="categorySearch">
									<div class="field">
										<span class="block"> <label for="#">카테고리</label> <select
											name="searchCa" class="searchCa">
												<option value="100" selected="selected">국내도서</option>
												<option value="200">외국도서</option>
												<option value="300">음반</option>
												<option value="400">DVD</option>
										</select>
										</span>
									</div>
								</div>
								<!-- 검색 카테고리 선택 끝 -->

								<!-- 검색창 -->
								<div class="keywordSearchForm">
									<div class="searchSelect">
										<label for="searchCondition" class="blind">전체</label> <select
											id="searchCondition" name="searchCondition" title="검색 선택">
											<option value="all" selected="selected">전체</option>
											<option value="title">제목</option>
											<option value="author">저자</option>
											<option value="publisher">출판사</option>
											<option value="isbn">isbn</option>
											<option value="productNumber">상품번호</option>
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
					<!-- 우측 메뉴 끝 -->
					<br>
					<br>
					<hr>
					<br>
					<br>
				</div>
			</div>
			<!-- 여기까지가 몸체우측 -->
		</div>
	</div>
</div>
<jsp:include page="../include/footer.jsp" />