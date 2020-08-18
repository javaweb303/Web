<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>

<style>
/*헤더 색*/
#head{background-color: #D4748C;}/*색변경*/
/*#gnb li ul{border-top: 7px solid #b5c13e;}/*색변경*/
/*내용*/
#content{ height: 100%;}
#content .container{margin: 0 40px;height: 100%; padding-bottom: 80px;}

/*테마 이름*/
#content .content_head{height: 200px; background-color: #ED829D;}/*색변경*/
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
   <div class="content_head"><h2>도서관 서비스</h2></div><!-- 이거 바꾸고 -->
   <div class="location"><!-- 이것도 이건 상단에 home>열린공간 >오시는길 이거 표시하는 부분? -->
   <ul class="">
   <li>인기도서</li>
   <li>도서관서비스 > </li>
   <li><a href="/controller">Home</a> > </li>
   </ul>
   </div>
   <div class="container"><!-- 몸체 -->
   <div class="cont_wrap">
      <div class="cont_lnb"><!-- 카테고리 부분 몸체 좌측-->
         <h2>도서관 서비스</h2>
            <ul class="cont_lnb_sub">
               <li><a href="/search">전체도서</a></li>
               <li><a href="/new">신간도서</a></li>
               <li><a href="/popular">인기도서</a></li>
               <li><a href="/recomm">추천도서</a></li>
            </ul>
      </div>
         <div class="cont_box"><!-- 몸체 우측공간 -->
            <h2>도서</h2>
				<div>
					<!-- 여기 안에 들어갈 내용 잘 배치하면됩니다. 지우고 쓰세요-->
					<h3>도서 정보</h3>
					<br>
					<div id="bookcont">
							<c:forEach items="${pubList}" var="list" step="1">
							<div style="display: inline-block; width: 100%; height: 150px; padding: 15px 0 15px 0; border-bottom: 1px solid gray;">
							<img src="${list['bookImageURL']}" style="float: left; width: 100px; height: 150px; padding: 0 10px 0 15px;">
								<p><Strong>${list['bookname']}</Strong></p>
								<p>저자 : ${list['authors']}</p>
								<p>장르 : ${list['publisher']}</p>
								<p>출판년도 : ${list['publication_year']}</p>
								<p>ISBN : ${list['isbn']}</p>
							</div>
							<p><Strong>책 소개</Strong></p>
							<p>${list['description']}</p>
							</c:forEach>
					</div>
					<!-- 댓글 창? -->
					<div>
					</div>
				</div>
			</div><!-- 여기까지가 몸체우측 -->
      </div>
   </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>