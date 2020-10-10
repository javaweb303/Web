<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>

<style>

/*헤더 색*/
#head {
	background-color: #5F78D4
} /*색변경*/
#gnb li ul {
	border-top: 7px solid #B36276;
} /*색변경*/
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
	background-color: #6B87ED
} /*색변경*/
#content .content_head h2 {
	padding: 75px 0 70px;
	text-align: center;
}
/*로컬주소*/
#content .location {
	margin: 0 auto 23px;
	width: 100%;
}

#content .location ul li {
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
	padding-bottom: 30px;
}

#content .container .cont_lnb h2 {
	padding: 35px 10px 20px;
	border-bottom: 1px solid gray;
}

#content .container .cont_lnb .cont_lnb_sub li {
	padding: 15px 0;
	border-bottom: 1px solid #e6e6e6;
}

#content .container .cont_lnb {
	padding: 0 10px;
}

/*메인 내용*/
#content .container .cont_box {
	margin-left: 300px;
	width: auto;
}

#content .container .cont_lnb {
	position: absolute;
	width: 250px;
	height: 100%;
	background-color: #fcfcfc;
	padding: 0 10px;
	padding-bottom: 30px;
}

#content .container .cont_box .Category_box, #content .container .cont_box .inputbox,
	#content .container .cont_box .searchbtn {
	box-sizing: border-box;
	margin: 5px;
	height: 30px;
}

#content .container .cont_box .inputbox {
	width: 30%;
}

/*ebook검색창*/
#ebookform {
	width: 100%;
	height: 50px;
	background-color: gray;
	border-radius: 10px;
	text-align: center;
	margin: 15px 0;
}

#ebookform form {
	margin: 0 auto;
	padding: 4.5px;
}

/* 리스트? */
.nav_List {
	padding: 3px 8px;
	font-weight: 700;
}

.reply_menu {
	padding: 0 3px;
}
/*탭상단 클릭시 주고 싶은 효과?*/
.tab_menu span.active {
	
}
/*버튼*/
.btn {
	width: 50px;
	height: 25px;
}
/* 검색 결과 책 정보 */
.searchViewWrap .htitle {
	margin: 20px 0 0;
	padding-bottom: 10px
}

.resultViewDetail {
	overflow: hidden;
	position: relative;
	margin-bottom: 30px;
	border: 2px solid #464646;
	border-radius: 5px;
	background-color: #fff
}

.resultViewDetail .tit {
	position: relative;
	padding: 10px 15px;
	font-weight: 600;
	font-size: 1.154em;
	line-height: 1.3;
	background-color: #f4f4f4;
}

.resultViewDetail .resultBookInfo {
	position: relative;
	min-height: 210px;
	padding: 20px
}

.resultViewDetail .thumb {
	position: absolute;
	top: 20px;
	left: 20px
}

.resultViewDetail .thumb .cover {
	display: inline-block;
	overflow: hidden;
	padding: 6px 17px 10px;
	background: url(/include/image/common/bg_book_cover.png) 0 0 no-repeat
}

.resultViewDetail .thumb .tag {
	position: absolute;
	top: 0;
	left: 22px;
	line-height: 0
}

.resultViewDetail .thumb .img {
	display: block;
	width: 136px;
	height: 194px;
	border: 1px solid #969696
}

.resultViewDetail .thumb .img img {
	display: block;
	width: 100%;
	height: 100%
}

.resultViewDetail .bookDataWrap {
	margin-left: 190px
}

.resultViewDetail .bookDataWrap li {
	margin-bottom: 6px
}

.resultBookDesc {
	padding-bottom: 20px;
	border-bottom: 1px solid #d7d7d7
}

.resultBookDesc>p ~ p, .ebookGuide>p ~ p {
	margin-top: 10px
}
</style>
<script>
$(function(){
	var page='1';
	var e_no=$('#e_no').val();
	var id=$('#id').val();
	if(id == 'null'){
		$('#reply_cont').attr("disabled",true);
		$('#reply_okbtn').attr("disabled",true);
		$('#reply_box').on("click",function(){
			alert('로그인이 필요한 서비스 입니다.');
		});
	}
	
	$('#recommend').on("click",function(){
		var state=$(this).val();
		if(state=="추천"){
			$.ajax({
				type:'get',
				url:'/recommend?ebook_no='+${book.e_no},
				dataType:'text',
				success:function(data){
					if(data=='SUCCESS'){
						location.reload();
					}
					if(data=='noLogin'){
						alert('로그인을 해주세요!');
					}
				}
			});
		}else{
			$.ajax({
				type:'get',
				url:'/non_recommend?ebook_no='+${book.e_no},
				dataType:'text',
				success:function(data){
					if(data=='SUCCESS'){
						location.reload();
					}
					if(data=='noLogin'){
						alert('로그인을 해주세요!');
					}
				}
			});
		}
		
	});
	$('#book_loan_return').on("click",function(){
		var text=$('#book_loan_return').val();
		if(text=='대여'){
			$.ajax({
				type:'post',
				url:'/book_loancount',
				dataType:'text',
				success:function(data){
					if(data==5){
						alert('다참');
					}else{
						$.ajax({
							type:'get',
							url:'/book_loan?e_no='+${book.e_no},
							dataType:'text',
							success:function(data){
								if(data=='SUCCESS'){
									 if (confirm("서재로 이동하겠습니까?") == true){//확인
										 location.href='/mylib';
									 }else{//취소
										 $('#book_loan_return').val('반납');
									     return false;
									 }
								}else{
									alert(data+'일 후에 대출해주세요.');
								}
							}
						});
					}
					if(data=='noLogin'){
						alert('로그인을 해주세요!');
					}
				}
			});
		}//if end
		else if(text=='반납'){
			$.ajax({
				type:'get',
				url:'/book_return?e_no='+${book.e_no},
				dataType:'text',
				success:function(data){
					if(data=='SUCCESS'){
						$('#book_loan_return').val('대여');
					}
					if(data=='noLogin'){
						alert('로그인을 해주세요!');
					}
				}
			});
		}
		else{
			alert('??');
		}
		
	});
	
	
	$('div.tab_menu > span').on("click",function(){//탭 매뉴 클릭시 이벤트.
		 $('div.tab_menu > span').removeClass('active');//모든 탭메뉴 엑티브 클래스제거 다른거 클릭시 엑티브가 2개있는걸 방지
		 $(this).addClass('active');//클릭한 태그에 엑티브 클래스 추가
		 $('div.tab_body').hide();//클래스 태그_바디를 숨긴다
		 $('#'+$(this).data('target')).show();//현재 선택된 data값을 가져와 그 data에 해당하는 id를 보여준다.
		 if($(this).data('target')=="reply_"){
			 if($('#reply____').find('iframe').text()==""){
			 $($('#'+$(this).data('target')).find('#reply____')).append('<iframe src="/reply_getList?e_no=${book.e_no}" name="ireply_box" id="ireply_box" scrolling="no" style="width:100%; height:100%;" frameborder="0"  onload="autoResize(this)" >IFrame을 지원하지 않음.</iframe>');
			 }
		}
	  });
	 });//function();
	 function autoResize(frame){//iframe 화면 높이 변경함수.
	     var iframeHeight=frame.contentWindow.document.body.scrollHeight;
	     frame.style.height=(iframeHeight + 38)+"px";
	 }
</script>
<input type="hidden" value="<%=session.getAttribute("id")%>" id="id"
	name="id" />
<input type="hidden" value="${book.e_no}" id="e_no" />
<div id="content">
	<div class="content_head">
		<h2>전자도서관</h2>
	</div>
	<!-- 이거 바꾸고 -->
	<div class="location">
		<!-- 이것도 이건 상단에 home>열린공간 >오시는길 이거 표시하는 부분? -->
		<ul class="">
			<li>전자책</li>
			<li>전자도서관 ></li>
			<li><a href="/">Home</a> ></li>
		</ul>
	</div>
	<div class="container">
		<!-- 몸체 -->
		<div class="cont_wrap">
			<div class="cont_lnb">
				<!-- 카테고리 부분 몸체 좌측-->
				<h2>도서관 서비스</h2>
				<ul class="cont_lnb_sub">
					<li><a href="/ebook">전자도서관</a></li>
				</ul>
			</div>
			<div class="cont_box">
				<!-- 몸체 우측공간 -->
				<h2>도서</h2>
				<div>
					<!-- 여기 안에 들어갈 내용 잘 배치하면됩니다. 지우고 쓰세요-->
					<h3>도서 정보</h3>
					<br>
					<div>
						<div class="contents" id="contents">
							<div class="searchViewWrap">
								<!-- 도서 기본 정보-->
								<div class="resultViewDetail">
									<!-- 책 제목 -->
									<div class="tit">
										<h4>${book.title}</h4>
									</div>
									<!-- 책 상세 정보 -->
									<div class="resultBookInfo">
										<div class="thumb">
											<!-- 책 이미지 -->
											<div class="cover">
												<span class="img"><img src="${book.imgurl}"
													alt="책이미지"></span>
											</div>
										</div>
										<!-- 책 저자, 출판사, 발행연도, isbn -->
										<div class="bookDataWrap">
											<ul class="sdot-list">
												<li>저자 : ${book.author}</li>
												<li>출판사 : ${book.publisher}</li>
												<li>발행연도 : ${book.publication_year}</li>
												<li>도서 현황 : ${book.status}/5</li>
												<li>추천수 : ${book.recommend}</li>
											</ul>
											<input type="button"
												value="<c:if test="${!empty recommand}"><c:if test="${recommand eq '추천'}">추천</c:if><c:if test="${recommand eq '비추천'}">비추천</c:if></c:if><c:if test="${empty recommand}">추천</c:if>"
												class="btn" id="recommend" /> <input type="button"
												value="<c:if test="${loan_status=='대출중'}">반납</c:if><c:if test="${empty loan_status}">대여</c:if>"
												class="btn" id="book_loan_return" />
										</div>
									</div>
								</div>
								<div class="tab_menu"
									style="padding: 3px 0; border-bottom: 1px solid gray;">
									<span data-target="book_" class="nav_List active">도서 소개</span><span
										data-target="reply_" class="nav_List">리뷰</span>
								</div>
								<!-- <div>
						<br><p style="margin-bottom: 7px; font-weight: 800;">책소개</p><hr><div style="margin: 7px 0 7px 0;">${book.book_introduce}</div>
						</div> -->
							</div>
							<div id="book_" class="tab_body">
								<div style="margin: 7px 0 7px 0;">${book.book_introduce}</div>
							</div>
							<div id="reply_" class="tab_body" style="display: none;">
								<!-- 댓글 -->
								<div id="reply_listbox">
									<!-- 댓글 박스 목록 -->
									<ul id="reply_list">

									</ul>
								</div>
								<div id="reply____" style="width: 100%; height: 100%;"></div>
								<!-- 댓글 창? -->

							</div>
						</div>
					</div>
					<!-- 여기까지가 몸체우측 -->
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>