<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>

<style>
/*헤더 색*/
#head{background-color: #848d2e;}/*색변경*/
/*#gnb li ul{border-top: 7px solid #b5c13e;}/*색변경*/
/*내용*/
#content{ height: 100%;}
#content .container{margin: 0 40px;height: 100%; padding-bottom: 80px;}

/*테마 이름*/
#content .content_head{height: 200px; background-color: #a0ac37;}/*색변경*/
#content .content_head h2{padding: 75px 0 70px; text-align: center;}
/*로컬주소*/
#content .location{margin: 0 auto 23px; width: 100%;}
#content .location ul li{float: right; list-style: none; right: 4%;}
/*카테고리*/
#content .cont_wrap{position: relative;}
#content .container .cont_lnb {position:absolute; width: 250px; height:100%; padding-bottom: 30px;}
#content .container .cont_lnb h2{padding: 35px 10px 20px; border-bottom: 1px solid gray;}
#content .container .cont_lnb .cont_lnb_sub li{padding: 15px 0; border-bottom: 1px solid #e6e6e6;}
#content .container .cont_lnb {padding: 0 10px;}

/*메인 내용*/
#content .container .cont_box{margin-left:300px;width:auto;}
#content .container .cont_lnb {position:absolute; width: 250px; height:100%; background-color:#fcfcfc; padding: 0 10px; padding-bottom: 30px;}
#content .container .cont_box .Category_box, #content .container .cont_box .inputbox,  #content .container .cont_box .searchbtn{box-sizing: border-box; margin: 5px; height: 30px;}
#content .container .cont_box .inputbox{width: 30%;}
#content .container .cont_box h2{padding: 35px 10px 20px; border-bottom: 1px solid gray; margin-bottom: 30px;}

/*ebook검색창*/
#ebookform {width:100%; height: 50px;background-color:gray; border-radius:10px; text-align: center; margin: 15px 0;}
#ebookform form{margin: 0 auto; padding: 4.5px;}

</style>
<div id="content">
	<div class="content_head">
		<h2>도서관 서비스</h2>
	</div>
	<!-- 이거 바꾸고 -->
	<div class="location">
		<!-- 이것도 이건 상단에 home>열린공간 >오시는길 이거 표시하는 부분? -->
		<ul class="">
			<li>인기도서</li>
			<li>도서관서비스 ></li>
			<li><a href="/controller">Home</a> ></li>
		</ul>
	</div>
	<div class="container">
		<!-- 몸체 -->
		<div class="cont_wrap">
			<div class="cont_lnb">
				<!-- 카테고리 부분 몸체 좌측-->
				<h2>도서관 서비스</h2>
				<ul class="cont_lnb_sub">
					<li><a href="/controller/search">통합검색</a></li>
					<li><a href="/controller/new">신간도서</a></li>
					<li><a href="/controller/popular">인기도서</a></li>
					<li><a href="/controller/recomm">추천도서</a></li>
				</ul>
			</div>
			<div class="cont_box">
				<!-- 몸체 우측공간 -->
				<h2>인기도서</h2>
				<div>
					<!-- 여기 안에 들어갈 내용 잘 배치하면됩니다. 지우고 쓰세요-->
					<h3>인기 도서 목록</h3>
					<br>
					<script>
					$(function(){
						$('#popbook ul li .book').hover(function(){
							$(this).find('a').children('.bookinfo_back').css("display","block");
							$(this).find('a').children('.bookinfo').css("display","block");
						},
						function(){
							$(this).find('a').children('.bookinfo_back').css("display","none");
							$(this).find('a').children('.bookinfo').css("display","none");
						});
					});
					</script>
					<div id="popbook" class="clearfix">
						<!--<c:forEach items="${pubList}" var="list" step="1">
							<div style="display: inline-block; width: 100%; height: 150px; padding: 15px 0 15px 0; border-bottom: 1px solid gray;">
							<img src="${list['bookImageURL']}" style="float: left; width: 100px; height: 150px; padding: 0 10px 0 15px;">
								<p><a href="/controller/bookcont?isbn=${list['isbn13']}">${list['bookname']}</a></p>
								<p>저자 : ${list['authors']}</p>
								<p>출판사 : ${list['publisher']}</p>
								<p>출판년도 : ${list['publication_year']}</p>
								<input type="hidden" value="${list['isbn13']}" name="isbn" />
							</div>
							</c:forEach> -->
							<style>
							.book{width: 200px; height: 250px; margin: 20px; float: left;}
							.bookimg img{position: absolute; width: 200px; height: 250px;}
							
							/*opacity 투명도 설정 */
							.bookinfo_back{position: absolute; width: 200px; height: 250px; background-color: white; opacity: 70%; display: none;}
							
							.bookinfo{position: absolute; text-align: center; width: 200px; height: 250px;display: none;}
							/*화면 넘어 가는 글자 ...처리 p태그 너비 맞추고 높이는 25로*/
							.bookinfo p{width:auto; height:25px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; margin: 15px 10px 0 10px;}
						</style>
						<ul>
							<c:forEach items="${pubList}" var="list" step="1">
							<li>
							<div class="book">
							<a href="/bookcont?isbn=${list['isbn13']}">
							<div class="bookimg"><img src="${list['bookImageURL']}"></div><!-- 책이미지들어가는곳 1-->
							<div class="bookinfo_back"></div><!-- 책이미지위에 덮을 반투명한 이미지? 2-->
							<div class="bookinfo">
							<p>${list['bookname']}</p>
							<p>${list['authors']}</p>
							<p>${list['publisher']}</p>
							<p>${list['publication_year']}</p>
							<p>아아아아아아아아kkkkkkkkkkkkkkkkkkkkkkk</p>
							</div><!-- 책 내용에 대한 정보가 들어갈 공간. 3 숫자는 z-index번호-->
							</a>
							</div>
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