<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
/*헤더 색*/
#head{background-color:#D4AF4A}/*색변경*/
#gnb li ul{border-top: 7px solid #d34451;}/*색변경*/
/*내용*/
#content{ height: 100%;}
#content .container{margin: 0 40px;height: 100%; padding-bottom: 80px;}

/*테마 이름*/
#content .content_head{height: 200px; background-color: #EDC453;}/*색변경*/
#content .content_head h2{padding: 75px 0 70px; text-align: center; color:white;}
/*로컬주소*/
#content .location{margin: 0 auto 23px; width: 100%;}
#content .location ul li{float: right; list-style: none; right: 4%;}
/*카테고리*/
#content .cont_wrap{position: relative;}
#content .container .cont_lnb {position:absolute; width: 250px; height:100%; background-color:#fcfcfc; padding: 0 10px; padding-bottom: 30px;}
#content .container .cont_lnb h2{padding: 35px 10px 20px; border-bottom: 1px solid gray;}
#content .container .cont_lnb .cont_lnb_sub li{padding: 15px 0; border-bottom: 1px solid #e6e6e6;}
#content .container .cont_lnb .cont_lnb_sub a{color:#2f2f2f; font-weight: 500;}

/*메인 내용*/
#content .container .cont_box{margin-left:300px;width:auto;}
#content .container .cont_box h2{padding: 35px 10px 20px; border-bottom: 1px solid gray; margin-bottom: 30px;}
</style>

<div id="content">
	<div class="content_head">
		<h2>도서관안내</h2>
	</div>
	<!-- 이거 바꾸고 -->
	<div class="location">
		<!-- 이것도 이건 상단에 home>열린공간 >오시는길 이거 표시하는 부분? -->
		<ul class="">
			<li>도서관 소개</li>
			<li>도서관안내 ></li>
			<li><a href="/controller">Home</a> ></li>
		</ul>
	</div>
	<div class="container">
		
		<!-- body -->
		<div class="cont_wrap">
			
			<!-- body 좌측-->
			<div class="cont_lnb">
				<h2>도서관안내</h2>
				<ul class="cont_lnb_sub">
					<li><a href="/controller/history">도서관 소개</a></li>
					<li><a href="/controller/guide">도서관 이용</a></li>
					<li><a href="/controller/status">도서관 현황</a></li>
					<li><a href="/controller/location">오시는 길</a></li>
				</ul>
			</div>
			<!-- body 좌측 끝-->
			
			<!-- body 우측 -->
			<div class="cont_box">	
				<h2>도서관 현황</h2>
				
				<!-- 연혁 끝 -->

			</div>
			<!-- body 우측 끝 -->
			
		</div>
		<!-- body 끝 -->
		
	</div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>