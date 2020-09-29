<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>

/*헤더 색*/
#head{background-color: #5F78D4}/*색변경*/
#gnb li ul{border-top: 7px solid #B36276;}/*색변경*/
/*내용*/
#content{ height: 100%;}
#content .container{margin: 0 40px;height: 100%; padding-bottom: 80px;}

/*테마 이름*/
#content .content_head{height: 200px; background-color: #6B87ED}/*색변경*/
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
			<div class="cont_box">
				<!-- 몸체 우측공간 -->
				<h2>전자책</h2>
				<div>
					<!-- 여기 안에 들어갈 내용 잘 배치하면됩니다. 지우고 쓰세요-->
					<h3>전자책 리스트</h3>
					<div id="ebookform">
						 <script>
						
              				function find(){
              					if($.trim($('#inputbox').val()) == ""){
              						alert('검색어를 입력하세요!');
              						$('#inputbox').focus();
              						return false;
              					}
              				}
              				$(function(){
              					var findname="<c:out value='${find_name}'/>";
              					var findfield="<c:out value='${find_field}'/>";
              					var findtheme="<c:out value='${find_theme}'/>";
              					if(findname !="" || findfield!="" || findtheme!=""){
              						$("#search_menu").val(findfield).prop("selected", true);
              						$("#theme").val(findtheme).prop("selected", true);
              						$("#inputbox").val(findname);
              					}else{
	              					
              					}
              				});
               			</script> 
               <form method="post" onsubmit="return find();" action="/eBook">
						<select name="theme" class="theme Category_box" id="theme">
							<option value="전체">전체</option>
							<option value="컴퓨터/IT">컴퓨터/IT</option>
							<option value="교양/심리">교양/심리</option>
							<option value="철학/종교">철학/종교</option>
							<option value="사회">사회</option>
							<option value="자연/기술과학">자연/기술과학</option>
							<option value="문화/예술">문화/예술</option>
							<option value="가정/생활">가정/생활</option>
							<option value="취미/여행">취미/여행</option>
							<option value="언어/외국어">언어/외국어</option>
							<option value="문학">문학</option>
							<option value="역사">역사</option>
							<option value="유아/어린이">유아/어린이</option>
						</select> <select name="search_menu" class="search_menu Category_box"
							id="search_menu">
							<option value="all">전체</option>
							<option value="e_title">책제목</option>
							<option value="e_author">저자</option>
							<option value="e_publisher">출판사</option>
						</select> <input class="inputbox" id="inputbox" name="inputbox"/> 
						<input type="submit" value="검색" class="searchbtn" />
					</form>
					</div>
					<c:if test="${empty list}">
						<div><h2>전자책이 없습니다.</h2></div>
					</c:if>
					<c:if test="${!empty list}">
					<div>
						<!-- 리스트  -->
						<ul>
							<c:forEach items="${list}" var="book_info">
								<li>
									<div
										style="margin: 10px; border-bottom: 1px solid gray; padding: 10px; width: auto; height: 250px;">
										<a
											href="/ebookcont?ebook_no=${book_info.e_no}">
											<img
											src="/file/book_img/${book_info.e_no}_/${book_info.e_title}.png"
											style="float: left; width: 200PX; height: 250px; margin-right: 15px;">
											<div>
												<p>제목 : ${book_info.e_title}</p>
												<p>저자 : ${book_info.e_author}</p>
												<p>출판사 : ${book_info.e_publisher}</p>
												<p>출판연도 : ${book_info.e_publication_year}</p>
												<p>도서현황 : 5/${book_info.e_status}</p>
												<p>추천수 : ${book_info.e_recommend}</p>
												<br>
												<p>
													책소개<br>${book_info.book_introduce}</p>
											</div>
										</a>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div id="bList_paging">
						<%--검색전 페이징 --%>
						<c:if test="${(empty find_field)&&(empty find_name)&&(empty find_theme)}">
							<c:if test="${page <=1}">[이전]&nbsp;</c:if>
							<c:if test="${page >1}">
								<a href="eBook?page=${page-1}">[이전]</a>&nbsp;
   							</c:if>

							<%--쪽번호 출력부분 --%>
							<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
								<c:if test="${a == page}"><${a}></c:if>
								<%--현재 쪽번호가 선택된 경우 --%>

								<c:if test="${a != page}">
									<%--현재 쪽번호가 선택안된 경우 --%>
									<a href="eBook?page=${a}">[${a}]</a>&nbsp;
    							</c:if>
							</c:forEach>

							<c:if test="${page>=maxpage}">[다음]</c:if>
							<c:if test="${page<maxpage}">
								<a href="eBook?page=${page+1}">[다음]</a>
							</c:if>
						</c:if>

						<%--검색후 페이징 --%>
						<c:if test="${(!empty find_field) || (!empty find_name) || (!empty find_theme)}">
							<c:if test="${page <=1}">[이전]&nbsp;</c:if>
								<c:if test="${page >1}">
									<a href="eBook?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
								</c:if>

							<%--쪽번호 출력부분 --%>
							<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
								<c:if test="${a == page}"><${a}></c:if>
									<c:if test="${a != page}">
										<a href="eBook?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
									</c:if>
							</c:forEach>

							<c:if test="${page>=maxpage}">[다음]</c:if>
								<c:if test="${page<maxpage}">
									<a href="eBook?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
								</c:if>
						</c:if>

					</div>
					</c:if>
				</div>
			</div>
			<!-- 여기까지가 몸체우측 -->
      </div>
   </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>