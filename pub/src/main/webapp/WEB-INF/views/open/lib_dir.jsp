<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	
	//FAQ에서 질문열림 처리 함수 sendview() 이건 컨텐츠에서 호출되는 함수

$(document).ready(function() {

  $(".a").hide();

  //content 클래스를 가진 div를 표시/숨김(토글)

  $(".q").click(function()

  {

    $(this).next(".a").slideToggle(500);

    $("i", this).toggleClass("fa-chevron-down fa-chevron-up");

  });

});

 

function moveurl(url) { 

    location.href = url;

} 


</script>

<style>
/*헤더 색*/
#head{background-color: #4B6E26}/*색변경*/
#gnb li ul{border-top: 7px solid #6FA138;}/*색변경*/
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
	background-color: #6FA138;
}

#content .content_head h2 {
	padding: 75px 0 70px;
	text-align: center;
}
/*로컬주소*/
#content .bbs {
	margin: 0 auto 23px;
	width: 100%;
}

#content .bbs ul li {
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
	background-color:#fcfcfc;
	padding-bottom: 30px;
}

#content .container .cont_lnb h2{padding: 35px 10px 20px; border-bottom: 1px solid gray;}

#content .container .cont_lnb {
	padding: 0 10px;
}

#content .container .cont_lnb .cont_lnb_sub li{padding: 15px 0; border-bottom: 1px solid #e6e6e6;}

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
/* reset.css에서 가져옴 */
div, form, label, span {
	margin: 0;
	padding: 0;
	border: 0;
}
a {
	text-decoration: none;
	color: inherit;
}

/* category select */
.pageCategory {
	overflow: hidden;
	margin-bottom: 10px;
	text-align: right
}

.pageCategory label.tit {
	display: inline-block;
	margin-right: 6px;
	font-weight: 600;
	line-height: 32px;
	color: #333;
	vertical-align: middle
}

.pageCategory select {
	min-width: 80px;
	margin-left: 3px;
	vertical-align: middle
}

.pageCategory select+.btn {
	margin-left: 3px
}

.pageCategory p {
	line-height: 32px
}

.ta_c {
	text-align: center !important;
}

/*button size*/
.btn.input {
	display: inline-block;
	min-width: 40px;
	padding: 0 10px;
	line-height: 30px;
	color: #fff;
	text-align: center;
	border: 0;
	box-sizing: border-box;
	background-color: #555
}

/* FAQ list */
.faqList {
	border-top: 2px solid #555
}

.faqList>li {
	border-bottom: 1px solid #ddd
}

.faqList>li>div {
	position: relative;
	padding: 12px 20px 12px 45px;
	line-height: 1.8
}

.faqList div.q {
	background-color: #fff
}

.faqList div.a {
	border-top: 1px solid #ddd;
	background-color: #fbfbfb
}

.faqList .ico {
	overflow: hidden;
	position: absolute;
	top: 12px;
	left: 10px;
	width: 25px;
	height: 25px;
	line-height: 25px;
	color: #fff;
	border-radius: 25px;
	background: #0066b3 url(../images/ico_faq.png) 0 0 no-repeat
}

.faqList .q .ico {
	background-position: 0 0
}

.faqList .a .ico {
	background-position: 0 -25px
}

.themeColor {background-color:#888 !important}

/*hidden*/
.blind {
	overflow: hidden;
	position: absolute;
	top: -9999em;
	left: -9999em;
	width: 1px;
	height: 1px;
	line-height: 1px;
	text-indent: -9999em
}



/* paging */
.pagingWrap {
	overflow: hidden;
	position: relative;
	min-height: 27px;
	margin-top: 20px;
	padding: 4px 0;
	text-align: center
}

.paging img {
	vertical-align: top
}

.paging span, .paging a {
	display: inline-block;
	width: 27px;
	height: 27px;
	line-height: 27px;
	text-align: center;
	vertical-align: top;
	border: 1px solid #ddd
}

.paging span.tp {
	width: 29px;
	height: 29px;
	line-height: 29px;
	font-weight: 600;
	color: #fff;
	border: none
}

.paging a:hover, .paging a:focus, .paging a:active {
	background-color: #f5f5f5
}

.paging .btn-paging {
	width: 27px;
	height: 27px;
	line-height: 27px;
	border: 1px solid #ddd;
	background: url(/include/image/board/arr_sp.png) 0 0 no-repeat
}

.paging .btn-paging.first {
	background-position: 0 0
}

.paging .btn-paging.prev {
	margin-right: 5px;
	background-position: 0 -25px
}

.paging .btn-paging.next {
	margin-left: 5px;
	background-position: 0 -50px
}

.paging .btn-paging.last {
	background-position: 0 -75px
}

.pagingWrap .btn {
	position: absolute;
	bottom: 0;
	right: 0
} /* 글쓰기(등록)버튼 */
.pagingWrap+form #pageSearch, .boardWrap ~ form #pageSearch {
	margin-top: 30px
}

.paging span.tp {
	background-color: #555 !important; 
}
</style>

<div id="content">
	<div class="content_head">
		<h2>열린공간</h2>
	</div>
	<!-- 이거 바꾸고 -->
	<div class="bbs">
		<!-- 이것도 이건 상단에 home>열린공간 >오시는길 이거 표시하는 부분? -->
		<ul class="">
			<li>공지사항</li>
			<li>열린공간 ></li>
			<li><a href="/controller">Home</a> ></li>
		</ul>
	</div>
	<div class="container">
		<!-- 몸체 -->
		<div class="cont_wrap">
			<div class="cont_lnb">
				<!-- 카테고리 부분 몸체 좌측-->
				<h2>열린공간</h2>
				<ul class="cont_lnb_sub">
					<li><a href="/controller/bbs_list">공지사항</a></li>
					<li><a href="/controller/faq">자주 묻는 질문</a></li>
				</ul>
			</div>
			<div class="cont_box">
				<!-- 몸체 우측공간 -->
				<h2>자주 묻는 질문</h2>
				<div class="body_contents">
					<!-- 여기 안에 들어갈 내용 잘 배치하면됩니다. 지우고 쓰세요-->
					<form name="searchForm" id="searchForm" method="get">
                            <h4 class="faqTitle">전자도서관</h4>
                            
						<div class="pageCategory">
						 
						 <label for="typeSelect" class="tit">분류 선택</label>
							
							<select name=url onchange="moveurl(this.value);">

							<option value="/controller/lib_dir">전자도서관</option>
							
							<option value="/controller/faq">홈페이지</option>

								<option value="/controller/lib_service">도서관 서비스</option>

								<option value="/controller/lib_space">열린공간</option>


							</select> 
						</div>

					</form>
					<ul class="faqList">

 <c:if test="${!empty dirlist}">

                    <c:forEach var="d" items="${dirlist}">

                    <li>

<div class="q">

<span class="ico themeColor"><span class="blind">질문 </span></span>

  ${d.dirfre}

</div>

 

<div class="a">

<span class="ico"><span class="blind">A 답변</span></span> 

${d.dirquestion}

</div>

</li>

</c:forEach>

</c:if>

<c:if test="${empty dirlist}"> 

<div class="heading">

없습니다.

</div>

 

<div class="content">

없습니다.

</div>

</c:if>

					</ul>
					<div class="pagingWrap">

						<p class="paging">
							  
							 

     

     <%--쪽번호 --%>

     <c:forEach var="a" begin="${startpage}" end="${endpage}"

     step="1"><%-- 시작페이지부터 끝페이지까지 1씩증가하면서 쪽번호가 출력 --%>

      <c:if test="${a == page}"><%--현재 쪽번호가 선택된 경우 --%>

       <span> ${a} </span>

      </c:if>

      <c:if test="${a != page}"><%--현재 쪽번호가 선택안된 경우 --%>

<a href="/controller/lib_dir?page=${a}">${a}</a>      

      </c:if>

     </c:forEach>

  

   
						</p>

					</div>
					<!-- 여기까지가 몸체우측 -->
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>