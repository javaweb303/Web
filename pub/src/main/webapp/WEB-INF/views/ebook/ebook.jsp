<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
/*헤더 색*/
#head{background-color: #995465}/*색변경*/
/*헤더 색*/
#head{background-color: #995465}/*색변경*/
#gnb li ul{border-top: 7px solid #B36276;}/*색변경*/
/*내용*/
#content{ height: 100%;}
#content .container{margin: 0 40px;height: 100%; padding-bottom: 80px;}

/*테마 이름*/
#content .content_head{height: 200px; background-color: #B36276}/*색변경*/
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

/*ebook검색창*/
#ebookform {width:100%; height: 50px;background-color:gray; border-radius:10px; text-align: center; margin: 15px 0;}
#ebookform form{margin: 0 auto; padding: 4.5px;}

</style>
<div id="content">
   <div class="content_head"><h2>전자 도서관</h2></div><!-- 이거 바꾸고 -->
   <div class="location"><!-- 이것도 이건 상단에 home>열린공간 >오시는길 이거 표시하는 부분? -->
   <ul class="">
   <li>전자책</li>
   <li>전자도서관 > </li>
   <li><a href="/">Home</a> > </li>
   </ul>
   </div>
   <div class="container"><!-- 몸체 -->
   <div class="cont_wrap">
      <div class="cont_lnb"><!-- 카테고리 부분 몸체 좌측-->
         <h2>전자 도서관</h2>
         <ul class="cont_lnb_sub">
            <li><a href="/eBook">전자책</a></li>
         </ul>
      </div>
         <div class="cont_box"><!-- 몸체 우측공간 -->
            <h2>전자책</h2>
            <div><!-- 여기 안에 들어갈 내용 잘 배치하면됩니다. 지우고 쓰세요-->
               <h3>전자책 리스트</h3>
               <div id="ebookform">
               <form>
               <select name="Category_no1" class="Category_no1 Category_box">
               	<option value="" selected>전체</option>
               	<option value="ad">일반 자료</option>
               	<option value="children">어린이 자료</option>
               </select> <select name="Category_no2" class="Category_no2 Category_box">
						<option value="1111">소설</option>
						<option value="1112">시/에세이/기행</option>
						<option value="1113">문학</option>
						<option value="1114">인문</option>
						<option value="1115">역사/지리/인물</option>
						<option value="1116">예술/대중문화</option>
						<option value="1117">사회/정치/법</option>
						<option value="1118">경영/경제</option>
						<option value="1119">건강/의학</option>
						<option value="1120">자연과학/공학</option>
						<option value="1121">컴퓨터/인터넷</option>
						<option value="1122">가족/생활/요리</option>
						<option value="1123">여행/취미</option>
						<option value="1124">외국어</option>
						<option value="1126">청소년</option>
						<option value="1211">유아</option>
						<option value="1212">어린이</option>
						<option value="1213">어린이영어</option>
					</select> <select name="Category_no3" class="Category_no3 Category_box">
               <option value="ALL" selected>전체</option>
               <option value="Book_Name">책제목</option>
               <option value="Cont_Author">저자</option>
               <option value="Publisher">출판사</option>
               </select>
               <input class="inputbox">
               <input type="button" value="검색" class="searchbtn">
               </form>
               </div>
               <div><!-- 리스트  -->
					<ul>
						<c:forEach items="${list}" var="book_info">
							<li>
								<div style="margin: 10px; border-bottom: 1px solid gray; padding:10px; width: auto; height: 250px;">
								<a href="/ebookcont?ebook_no=${book_info.e_num}">
								<c:forEach items="${book_info.file}" var="file">
								<c:if test="${file.ext eq '.jpg' || file.ext eq '.png' || file.ext eq '.jpeg'}">
								<img src="/file/${file.y}/${file.m}/${file.d}/img/${file.stored_file_name}" style="float:left; width: 200PX; height: 250px; margin-right: 15px;">
								</c:if>
								</c:forEach>
								<div>
								<p>제목 : ${book_info.e_title}</p>
								<p>저자 : ${book_info.e_author}</p>
								<p>출판사 : ${book_info.e_publisher}</p>
								<p>출판연도 : ${book_info.e_publication_year}</p>
								<p>도서현황 : 5/${book_info.e_status}</p>
								<p>추천수 : ${book_info.e_recommend}</p>
								<br>
								<p>책소개<br>${book_info.e_introduce}</p>
								</div>
								</a>
								</div>
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