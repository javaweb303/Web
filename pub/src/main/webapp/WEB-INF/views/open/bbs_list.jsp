<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />

<style>
/*헤더 색*/
#head{background-color: #4b4992}/*색변경*/
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
   background-color: #504e9a;
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
               <li><a href="/controller/bbs_list">공지사항</a></li>
               <li><a href="/controller/faq">자주 묻는 질문</a></li>
            </ul>
         </div>
         <div class="cont_box">
            <!-- 몸체 우측공간 -->
            <h2>공지사항</h2>
            <div class="body_contents">
               <!-- 여기 안에 들어갈 내용 잘 배치하면됩니다. 지우고 쓰세요-->
               <form class="searchForm">
                  <fieldset>
                     <legend class="blind">검색</legend>
                     <label class="checkBox3"><input type="checkbox" name="sf"
                        value="title" checked=""><span></span> 글제목</label> <label
                        class="checkBox3"><input type="checkbox" name="sf"
                        value="content" checked=""><span></span> 내용</label> <input
                        type="text" placeholder="검색어를 입력해 주세요" name="sw"
                        class="inputText1" value=""> <input type="submit"
                        value="검색" class="btn5">
                  </fieldset>
               </form>
               <table class="listTable responsiveTable default">
						<caption class="blind">공지사항</caption>
						<thead>
							<tr>
								<th scope="col" class="footable-first-column">번호</th>								
								<th scope="col" data-class="expand">제목</th>
								<th scope="col" data-hide="phone">이름</th>
								<th scope="col" data-hide="phone">등록일</th>
								<th scope="col" data-hide="phone">조회</th>
								<th scope="col" data-hide="phone" class="footable-last-column">첨부</th>								
							</tr>
						</thead>
						<tbody>
						 
							<tr>    
							
								<td class="textCenter footable-first-column">2</td>
								<td class="title expand"><a href="/bbs/viewBbs.do?notice_id=64&amp;pg=1">문아공간도서관 서비스 운영 안내</a></td>
								<td class="textCenter">관리자</td> 
								<td class="textCenter">2020-04-13</td>
								<td class="textCenter">1656</td> 
								<td class="textCenter footable-last-column"></td>
							</tr>
						 
							<tr>    
							
								<td class="textCenter footable-first-column">1</td>
								<td class="title expand"><a href="/bbs/viewBbs.do?notice_id=63&amp;pg=1">문아공간도서관 공지사항</a></td>
								<td class="textCenter">관리자</td> 
								<td class="textCenter">2020-04-09</td>
								<td class="textCenter">1504</td> 
								<td class="textCenter footable-last-column"></td>
							</tr>
							
							
						</tbody>
					</table>
               <script type="text/javascript">
                  function linkPage(pageNo) {
                     location.href = "?&read_cnt=0&totalCount=2&&&cntPerPage=10&cntPerUnit=10&rn=0&fCount=0&thisDepth=0&groupFlag=true&defaultPageCnt=8&defaultGroupCnt=4&p_pg=1&p_totalCount=0&offset=1&root_id=5&menu_name=열린마당&menu_type=bbs&menu_desc=default text&year=2020&month=06&day=29&os=desc&of=&pg="
                           + (pageNo);
                  }
               </script>
               <div class="paging">
                  <div>

                     <span><span>1</span></span>


                  </div>
               </div>
               <!-- 여기까지가 몸체우측 -->
            </div>
         </div>
      </div>
   </div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>