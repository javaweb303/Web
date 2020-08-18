<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- appkey <- 이게 api id?값? -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d86e4e592d7bd1b7f34dc62ae0bea41"></script>
<script type="text/javascript" src="resources/js/kakaomap.js"></script>
<style>
/*헤더 색*/
#head{background-color: #D4AF4A}/*색변경*/
/*내용*/
#content{ position:relative; height: 100%;}
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
   <div class="content_head"><h2>도서관안내</h2></div><!-- 이거 바꾸고 -->
   <div class="location"><!-- 이것도 이건 상단에 home>열린공간 >오시는길 이거 표시하는 부분? -->
   <ul class="">
   <li>오시는 길</li>
   <li>도서관안내 > </li>
   <li><a href="/controller">Home</a> > </li>
   </ul>
   </div>
   <div class="container"><!-- 몸체 -->
   <div class="cont_wrap">
      <div class="cont_lnb"><!-- 카테고리 부분 몸체 좌측-->
         <h2>도서관안내</h2>
         <ul class="cont_lnb_sub">
            <li><a href="/controller/history">도서관 소개</a></li>
            <li><a href="/controller/guide">도서관 이용</a></li>
			<li><a href="/controller/status">도서관 현황</a></li>
            <li><a href="/controller/location">오시는 길</a></li>
         </ul>
      </div>
         <div class="cont_box"><!-- 몸체 우측공간 -->
            <h2>오시는 길</h2>
            <div><!-- 여기 안에 들어갈 내용 잘 배치하면됩니다. 지우고 쓰세요-->
               <h3>찾아오시는 길</h3>
               <div id="map" style="width:100%;height:400px;"></div>
               <ul>
                  <li><strong>주소 및 전화번호</strong>
                     <table class="nohead">
                           <tr class="first">
                              <th>주소</th>
                              <td colspan="3">서울특별시 동작구 장승배기로 171 노량진아이비빌딩 3층</td>
                           </tr>
                           <tr>
                              <th>전화번호</th>
                              <td>1666-9210</td>
                              <th>팩스번호</th>
                              <td>02-3672-5615</td>
                           </tr>
                     </table>
                  </li>
                  <li><strong></strong>
                  </li>
               </ul>
            </div>
         </div><!-- 여기까지가 몸체우측 -->
      </div>
   </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>