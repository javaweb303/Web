<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions" %>     

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
#content .history {
   margin: 0 auto 23px;
   width: 100%;
}

#content .history ul li {
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

fieldset{border:none;}
.blind{position:absolute;left:0;top:0;width:0;height:0;font-size:0;line-height:0;text-indent:-9999px;overflow:hidden;visibility:hidden;}

.list{margin-left:300px}
.list h3{padding:26px 0 25px;border-bottom:1px solid #9f9f9f;color:#000;font-size:28px;line-height:100%}
.list{margin-left:0}
.list h3{padding-top:0}

/* 검색 */
.searchForm{margin-top:30px;margin-bottom:40px;padding:20px;background-color:#f7f7f7;text-align:center}
.searchForm label{margin-right:15px}
.searchForm label input{margin-right:5px}
.searchForm label span{margin-top:-2px;margin-right:5px}
.searchForm  div{display:inline-block}
.searchForm .inputText1{width:540px;height:45px;margin-left:20px;padding:0 10px;box-sizing:border-box;vertical-align:top}

@media (min-width:1025px) and (max-width:1500px){
	.searchForm .inputText1{width:300px}
}

@media (min-width:0) and (max-width:1024px){
	.searchForm{position:relative;text-align:left}
	.searchForm div{padding-right:80px;display:block}
	.searchForm .inputText1{width:100%;margin-top:20px;margin-right:0;margin-left:0}
	.searchForm .btn5{position:absolute;bottom:20px;right:20px}
}

/*checkbox*/
.checkBox3 input[type="checkbox"]{display:none;}
.checkBox3 input[type="checkbox"] + span{display:inline-block;width:18px;height:17px;background:url(../images/checkBox.jpg) no-repeat 0 0;vertical-align:middle;}
.checkBox3 input[type="checkbox"]:checked + span{background-position:0 -17px}


/*button*/
.btn5{display:inline-block;min-width:40px;padding:0 25px;height:45px;background-color:#484848;font-size:14px;color:#fff;line-height:45px;text-decoration:none;text-align:center;border:none;vertical-align:middle}
.btn5:hover, .btn5:focus{background-color:#333}

/* 게시글*/
/* Table */
.listTable{width:100%;border-top:1px solid #808080}
.listTable caption{display:none}
.listTable thead th{padding:20px 10px;border-bottom:1px solid #e7e7e7;background-color:#f3f3f3;text-align:center;color:#1c1c1c;font-size:17px;font-family:NotoSans, sans-serif}
.listTable tbody td{padding:20px 10px;border-bottom:1px solid #e7e7e7;color:#5b5a5a;font-size:15px}
.listTable tbody tr:hover{background-color:#fffddf}
.listTable tbody td.title a{color:#5b5a5a;text-decoration:none}
.listTable tbody td.title a:hover, .listTable tbody td.title a:focus{color:#4295e2;text-decoration:underline}

@media (min-width:0) and (max-width:767px){
	.listTable thead{display:none}
}
.listTable tbody td.footable-cell-detail{background-color:#f8f8f8}
.responsiveTable.breakpoint > tbody > tr > td.expand {
	/*padding:14px 23px 14px 10px;*/
	padding-right:30px;
	background:url(../../image/common/tableOn.png) no-repeat 97% 50%
}
.responsiveTable.breakpoint > tbody > tr.footable-detail-show > td.expand {
	background:url(../../image/common/tableOff.png) no-repeat 97% 50%;
}
.footable-row-detail-inner > div{margin-top:15px;}
.footable-row-detail-inner > div:first-child{margin-top:0}
.footable-row-detail-inner > div strong{display:inline-block;min-width:55px;margin-right:10px;color:#1c1c1c;font-family:NotoSans, sans-serif;}

.textCenter {
    text-align: center;
}

.paging{margin:80px 0 0;text-align:center}
.paging > div{display:inline-block;}
.paging > div > a{float:left;margin-left:-1px;border:1px solid #ccc;vertical-align:middle}
.paging > div > span{float:left}
.paging > div > span a{float:left;height:38px;margin-left:-1px;padding:0 14px;color:#808080;font-size:15px;text-decoration:none;border:1px solid #ccc;vertical-align:middle;line-height:38px}
.paging > div > span span{float:left;height:35px;margin-left:-1px;padding:0 14px;border:1px solid #ccc;border-bottom:4px solid #000;font-size:15px;vertical-align:middle;line-height:38px;color:#000}


a:link, a:visited {text-decoration: none; color: #656565;}
 .board_list {width:100%;border-top:2px solid #252525;border-bottom:1px solid #ccc} 
 .board_list thead th:first-child{background-image:none} 
 .board_list thead th {border-bottom:1px solid #ccc;padding:12px 0 13px 0;color:#3b3a3a;vertical-align:middle} 
 .board_list tbody td {border-top:1px solid #ccc;padding:10px 0;text-align:center;vertical-align:middle} 
 .board_list tbody tr:first-child td {border:none} 
 .board_list tbody td.title {text-align:left; padding-left:20px} 
 .board_list tbody td a {display:inline-block} 
 .board_view {width:50%;border-top:2px solid #252525;border-bottom:1px solid #ccc} 
 .board_view tbody th {text-align:left;background:#f7f7f7;color:#3b3a3a} 
 .board_view tbody th.list_tit {font-size:13px;color:#000;letter-spacing:0.1px} 
 .board_view tbody .no_line_b th, .board_view tbody .no_line_b td {border-bottom:none} 
 .board_view tbody th, .board_view tbody td {padding:15px 0 16px 16px;border-bottom:1px solid #ccc} 
 .board_view tbody td.view_text {border-top:1px solid #ccc; border-bottom:1px solid #ccc;padding:45px 18px 45px 18px} 
 .board_view tbody th.th_file {padding:0 0 0 15px; vertical-align:middle} 
 .wdp_90 {width:90%} 
 .btn {border-radius:3px;padding:5px 11px;color:#fff !important; display:inline-block; background-color:#6b9ab8; border:1px solid #56819d;vertical-align:middle}


</style>




<div id="content">
   <div class="content_head">
      <h2>열린공간</h2>
   </div>
   <!-- 이거 바꾸고 -->
   <div class="history">
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
               <li><a href="/bbs_list">공지사항</a></li>
               <li><a href="/controller/faq">자주 묻는 질문</a></li>
            </ul>
         </div>
         <div class="cont_box">
            <!-- 몸체 우측공간 -->
            <div class="body_contents">
               <!-- 여기 안에 들어갈 내용 잘 배치하면됩니다. 지우고 쓰세요-->
             <%--공지 내용--%>
<div id="gCont_wrap">
  <h2 class="gCont_title">공지내용</h2>
  
 
  
  

   <table class="board_view">
       
            <colgroup>
             <col width="15%"/>
     		 <col width="35%"/>
             <col width='15%' />
             <col width='35%' />
            </colgroup>

<tr>
	<th scope="row">글 번호</th>
	<td>${g.gongji_no} </td>
	<th scope="row">조회수</th>
	<td>${g.gongji_hit}</td>
</tr>
	
<tr>
	<th scope="row">작성자</th>
	<td>${g.gongji_name }</td>
	<th scope="row">작성시간</th>
	<td>${g.gongji_date }</td>
</tr>

<tr>
	<th scope="row">제목</th>
	<td colspan="3">${g.gongji_title }</td>
</tr>

<tr>
	<th scope="row">내용</th>
	<td colspan="4">${g_cont }</td>
</tr>		
	
   
  </table>
  </div>

   
  </div>
 <!-- 이전글/다음글 -->
 
 <br><br>
  <div class="prev">

  <a href="/gongji_cont?gongji_no=${g.gongji_no-1}">이전글</a>

<br>  
<hr>
  
    <a href="/gongji_cont?gongji_no=${g.gongji_no+1}">다음글</a> 
  </div>
  
  <br><br>
  <div id="gCont_menu">
   <input class="btn" type="button" value="공지목록"
   onclick="location='/bbs_list';" />
  </div>
 </div>
 
               <!-- 여기까지가 몸체우측 -->
            </div>
         </div>
      </div>
   </div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>