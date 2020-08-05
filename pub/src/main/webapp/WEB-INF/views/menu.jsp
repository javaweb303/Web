	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#slidermenu_back{background:url("resources/images/menuShadow.png") repeat; position: fixed; right:-100%; z-index: 10;}
#slmenu_wrap{position:fixed; right:-100%; overflow: hidden; width:250px; z-index: 20; height: 100%; background-color: white; padding: 10px 20px;}
#slmenu_wrap .top_menu {border-bottom: 2px solid black; text-align: center;}
#slmenu_wrap .top_menu img{height: 80px;z-index: 20;}
#slider_menu{}
.listmenu ul li{list-style: none;z-index: 20;}
#slider_menu>li {padding: 20px 0; border-bottom: 1px solid gray;}
#slider_menu>li>a{font-size: 20px; font-weight: 600;}
#slider_menu li ul{display: none;}
#slider_menu li ul li{padding: 10px 5px;}
#slider_menu li.open ul{opacity:1; transition: 0.5s ease-in-out; -webkit-transition: 0.5s ease-in-out;}
</style>

<div id="slidermenu_back"></div>
   <div id="slmenu_wrap">
      <div class="top_menu"><img alt="상단로고" src="resources/images/logo.png"></div>
         <div class="listmenu">
            <ul id="slider_menu">
               <li><a>도서관 서비스</a>
                        <ul class="gnb_sub">
                           <li><a href="./jsp/search.jsp">통합검색</a></li>
                           <li><a href="#">신간도서</a></li>
                           <li><a href="/controller/popular">베스트 셀러</a></li>
                           <li><a href="#">추천도서</a></li>
                        </ul>
                  </li>
                  <li><a>전자 도서관</a>
                        <ul class="gnb_sub">
                           <li><a href="./jsp/ebook.jsp">전자책</a></li>
                        </ul>
                  </li>
                  <li><a>열린공간</a>
                        <ul class="gnb_sub">
                           <li><a href="/controller/history">도서관 소개</a></li>
                           <li><a href="/controller/guide">도서관 이용</a></li>
                           <li><a href="/controller/status">도서관 현황</a></li>
                           <li><a href="/controller/location">오시는 길</a></li>
                        </ul>
                  </li>
                  <li><a>안내</a>
                        <ul class="gnb_sub">
                           <li><a href="/controller/bbs_list">공지사항</a></li>
                           <li><a href="/controller/faq">FAQ</a></li>
                        </ul>
                  </li>
            </ul>
         </div>
      </div>