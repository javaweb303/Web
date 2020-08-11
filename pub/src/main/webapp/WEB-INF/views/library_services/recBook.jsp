<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.w3c.dom.*"%> 
<%@ page import="javax.xml.parsers.*"%> 
<%@ page import="java.util.*"%> 
<%@page import="java.util.Map"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
/*헤더 색*/
#head{background-color: #da690e}/*색변경*/
#gnb li ul{border-top: 7px solid #f18023;}/*색변경*/
/*내용*/
#content{ height: 100%;}
#content .container{margin: 0 40px;height: 100%; padding-bottom: 80px;}

/*테마 이름*/
#content .content_head{height: 200px; background-color: #ec730f;}/*색변경*/
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

/*이미지*/
.imgList_wrap {
    position: relative;
    padding: 10px 0
}

.imgList_wrap .list_img {
    display: inline-block;
    width: 100%
}

.imgList_wrap .list_img li {
    position: relative;
    display: block;
    box-sizing: border-box;
    cursor: pointer;
    float: left;
    margin: 0 2.5% 30px 0;
    width: 18%;
}
.imgList_wrap .list_img li:last-child,.imgList_wrap .list_img li:nth-child(5),.imgList_wrap .list_img li:nth-child(10),.imgList_wrap .list_img li:nth-child(15) {
    margin: 0 0 30px 0
}

.imgList_wrap .list_img .thumImg {
    width: 200px;
    height: 250px
}

</style>

<div id="content">
   <div class="content_head"><h2>도서관 서비스</h2></div><!-- 이거 바꾸고 -->
   <div class="location"><!-- 이것도 이건 상단에 home>열린공간 >오시는길 이거 표시하는 부분? -->
   <ul class="">
   <li>추천도서</li>
   <li>도서관서비스 > </li>
   <li><a href="../index.jsp">Home</a> > </li>
   </ul>
   </div>
   <div class="container"><!-- 몸체 -->
   <div class="cont_wrap">
      <div class="cont_lnb"><!-- 카테고리 부분 몸체 좌측-->
         <h2>도서관 서비스</h2>
         <ul class="cont_lnb_sub">
            <li><a href="#">추천도서</a></li>
         </ul>
      </div>
         <div class="cont_box"><!-- 몸체 우측공간 -->
            <h2>추천도서</h2>
            <div><!-- 여기 안에 들어갈 내용 잘 배치하면됩니다. 지우고 쓰세요-->           
          <div class="imgList_wrap">
          <ul class="list_img">
   		  <c:forEach items="${pubList}" var="list" step="1">
          <li>
          
          <a href="#"><img src="${list['coverLargeUrl']}" class="img-responsive thumImg"></a>
          </li>
   			</c:forEach>
             </ul>
          </div>
            </div>
         </div><!-- 여기까지가 몸체우측 -->
      </div>
   </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>