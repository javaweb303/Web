<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="resources/css/default.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="resources/js/slider.js"></script>
<script type="text/javascript" src="resources/js/index.js"></script>
<script type="text/javascript" src="resources/js/ae.js"></script>
<script>
$(function(){
   //$('.gnb_sub').hide();주석한이유는 스타일시트가 더 빨라서 주석함.
	$('#gnb>li').on({
		   mouseenter:function(){$(this).addClass('on');},
	   	   mouseleave:function(){$(this).removeClass('on');}
	   });  
});
</script>
</head>
<body>
   <div id="wrap">
   <jsp:include page="./menu.jsp"></jsp:include>
      <header>
         <div id="top_head">
            <div class="tnb">
          	<c:if test="${empty id}">
            <a href="./login">Login</a>
            <a href="./join">Join</a>
            </c:if>
            <c:if test="${!empty id}">
            <span>${id}님</span>&nbsp;
            <a href="./logout">Logout</a>
            <c:if test="${Rank eq '1'}">
		         <a href="./mypage">mypage</a>
		    </c:if>
		    <c:if test="${Rank eq '5'}">
		         <a href="./adIndex">AdminPage</a>
		    </c:if>
            </c:if>
            </div>
         </div>
         <div id="mid_head">
            <div class="logo">
            <a href="./"><img alt="로고" src="resources/images/logo/logo.png"></a>
            </div>
            <div class="search">
            <select name="searchField" class="search_ field">
               <option value="ALL" selected>전체</option>
               <option value="CONT_NAME">서명</option>
               <option value="CONT_AUTHOR">저자</option>
               <option value="Publisher">출판사</option>
            </select> 				
            <input type="text" class="search_ inputbox">
            <input type="image" class="btn" src="resources/images/main/btnSrchM.png" alt="검색" title="검색" onclick="javascript:$('#searchFrm').submit();">
            </div>
            <div class="lnb">
            <c:if test="${empty id}">
            <a href="./login"><img src="resources/images/login.png"></a>
            <a href="#" id="slbtn"><img src="resources/images/menu_Main.png"></a>
            </c:if>
            <c:if test="${!empty id}">
            <a href="./loginout"><img src="resources/images/login.png"></a>
            <c:if test="${Rank eq '1'}">
		         <a href="./mypage"><img src="resources/images/header/myPage.png"></a>
		    </c:if>
		    <c:if test="${Rank eq '5'}">
		         <a href="./adIndex"><img src="resources/images/header/myPage.png"></a>
		    </c:if>
            <a href="#" id="slbtn"><img src="resources/images/menu_Main.png"></a>
            </c:if>
            </div>
         </div>
         <div id="bottom_head">
            <nav>
               <ul id="gnb">
                  <li><a href="./search">도서관 서비스</a>
                        <ul class="gnb_sub">
                           <li><a href="./search">통합검색</a></li>
                           <li><a href="./new">신간도서</a></li>
                           <li><a href="./popular">인기도서</a></li>
                           <li><a href="./recomm">추천도서</a></li>
                        </ul>
                  </li>
                  <li><a href="./eBook">전자 도서관</a>
                        <ul class="gnb_sub">
                           <li><a href="./eBook">전자책</a></li>
                        </ul>
                  </li>
                  <li><a href="./history">도서관 안내</a>
                        <ul class="gnb_sub">
                           <li><a href="./history">도서관 소개</a></li>
                           <li><a href="./guid">도서관 이용</a></li>
                           <li><a href="./status">도서관 현황</a></li>
                           <li><a href="./location">오시는 길</a></li>
                        </ul>
                  </li>
                  <li><a href="./bbs_list">열린공간</a>
                        <ul class="gnb_sub">
                           <li><a href="./bbs_list">공지사항</a></li>
                           <li><a href="./faq">FAQ</a></li>
                        </ul>
                  </li>
               </ul>
            </nav>
         </div>
      </header>
      <div id="content">
      	<div id="slider-wrap">
      		<div class="slider">
      			<ul>
      				<li><div><img alt="슬라이더 이미지" src="resources/images/slider/1.jpg"></div></li>
      				<li><div><img alt="슬라이더 이미지" src="resources/images/slider/2.jpg"></div></li>
      				<li><div><img alt="슬라이더 이미지" src="resources/images/slider/3.jpg"></div></li>
      			</ul>
      			<a href="#" class="btnPrev controller">이전 이미지 보기</a>
      			<a href="#" class="btnNext controller">다음 이미지 보기</a>
      		</div>
      	</div>
      	<div id="bookbox">
      	<h3 style="margin: 20px 30px;">신간도서</h3>
				<ul style="width: auto; height: 275px; overflow: hidden; list-style: none; margin: 0 20px 0 20px; padding-top: 25px;
				border-top: 1px solid gray;">
					<c:forEach items="${pubList}" var="list" step="1">
						<li style="width: 200px; height: 275px; float:left; margin: 0 15px 0 15px;">
						<a href="./bookcont?isbn=${list['isbn13']}">
						<img alt="책이미지" src="${list['cover']}" style="width: 200px; height: 250px;"></a>
						<p style="width: 200px; height: 25px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${list['bookname']}</p>
						</li>
					</c:forEach>
				</ul>
			</div>
      	<div id="listbox" style="margin: 0 20px 0 20px; padding-top: 25px; border-top: 1px solid gray;">
      		<div style="width: 50%; height: 350px; float: left;">
      		<div id="gMain_wrap">
  <h2 class="gMain_title">사용자 공지목록</h2>
  <br>
  <table id="gMain_t">
   <tr>
    <th>제목</th><th>날짜</th>
   </tr>
   <c:if test="${!empty glist}">
   <c:forEach var="g" items="${glist}">
    <tr>
     <th><a href="gongji_cont?gongji_no=${g.gongji_no}">
      <c:if test="${fn:length(g.gongji_title)>16}">
       ${fn:substring(g.gongji_title,0,16)}...
      </c:if>
      <c:if test="${fn:length(g.gongji_title)<16}">
      ${g.gongji_title}
      </c:if>
     </a>
     </th>
     <th>${g.gongji_date}</th>
    </tr>
   </c:forEach>
   </c:if>
   <c:if test="${empty glist}">
    <tr>
     <th colspan="2">공지 목록이 없습니다!</th>
    </tr>   
   </c:if>
  </table>
 </div>
      		</div>
      	</div>
      </div>
      <footer id="footer">
			<div class="footer-info">
				<!--<div class="logo">
					<img alt="하단로고" src="resources/images/logo_white.png">
				</div> -->
				<div class="footer-cont">
					<address>서울특별시 동작구 장승배기로 171 2층, 3층 303호</address>
					문의전화 02) 866-9357 | 팩스 02) 5249-1464
				</div>
				<p class="copy">COPYRIGHT © Library, Inc. All rights reserved</p>
			</div>
			<!--// footer-bottom -->
		</footer>
   </div>
</body>
</html>