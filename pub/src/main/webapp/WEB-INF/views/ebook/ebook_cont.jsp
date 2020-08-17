<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>

<style>
/*헤더 색*/
#head{background-color: #de6b0e}/*색변경*/
/*헤더 색*/
#head{background-color: #da690e}/*색변경*/
#gnb li ul{border-top: 7px solid #f18023;}/*색변경*/
/*내용*/
#content{ height: 100%;}
#content .container{margin: 0 40px;height: 100%; padding-bottom: 80px;}

/*테마 이름*/
#content .content_head{height: 200px; background-color: #f0740f}/*색변경*/
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

/*버튼*/
.btn{width: 50px; height: 25px; }

</style>
<script>
$(function(){
	/*if(${book.e_status} == '0'){//0이면 대출버튼 비활성화.
		$('#book_loan_return').attr("disabled",true);
	}else{
		
	}*/
	$('#recommend').on("click",function(){
		alert('버튼클릭');
		$.ajax({
			type:'post',
			url:'/recommend',
			success:function(data){
				if(data=='SUCCESS'){
					alert('정상');
				}
				if(data=='noLogin'){
					alert('로그인을 해주세요!');
				}
			}
		});
	});
	$('#book_loan_return').on("click",function(){
		alert('버튼클릭');
		$.ajax({
			type:'post',
			url:'/book_loan',
			success:function(data){
				if(data=='SUCCESS'){
					alert('정상');
				}
				if(data=='noLogin'){
					alert('로그인을 해주세요!');
				}
			}
		});
	});
});
</script>
<div id="content">
	<div class="content_head">
		<h2>도서관 서비스</h2>
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
						<div style="height: 250px;">
						<div>
							<c:forEach items="${book.file}" var="file">
								<c:if
									test="${file.ext eq '.jpg' || file.ext eq '.png' || file.ext eq '.jpeg'}">
									<img
										src="/file/${file.y}/${file.m}/${file.d}/img/${file.stored_file_name}"
										style="float: left; width: 200PX; height: 250px; margin-right: 15px;">
								</c:if>
							</c:forEach>
						</div>
						<div>
							<p>제목 : ${book.e_title}</p>
							<p>저자 : ${book.e_author}</p>
							<p>출판사 : ${book.e_publisher}</p>
							<p>출판연도 : ${book.e_publication_year}</p>
							<p>도서현황 : 5/${book.e_status}</p>
							<p>추천수 : ${book.e_recommend}</p>
							<br> 
							<input type="button" value="추천" class="btn" id="recommend" />
							<input type="button" value="대여" class="btn" id="book_loan_return" />
							<p>
						</div>
						</div>
						<div>
						<br><p style="margin-bottom: 7px; font-weight: 800;">책소개</p><hr><div style="margin: 7px 0 7px 0;">${book.e_introduce}</div>
						</div>
					</div>
					<!-- 댓글 창? -->
					<div>
					
					</div>
				</div>
			</div>
			<!-- 여기까지가 몸체우측 -->
		</div>
	</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>