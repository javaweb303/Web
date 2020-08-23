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
$('document').ready(function(){
	<%
	String id=(String)request.getSession().getAttribute("id");
	%>
	if(<%=id%> == null){
		$('#reply_cont').attr("disabled",true);
		$('#reply_okbtn').attr("disabled",true);
		$('#reply_box').on("click",function(){
			alert('로그인이 필요한 서비스 입니다.');
		});
	}
});
$(function(){
	/*if(${book.e_status} == '0'){//0이면 대출버튼 비활성화.
		$('#book_loan_return').attr("disabled",true);
	}else{
		
	}*/
	getAllList();
	var eno=$('#e_no').val();
	$('#recommend').on("click",function(){
		var state=$(this).val();
		if(state=="추천"){
			$.ajax({
				type:'get',
				url:'/recommend?ebook_no='+${book.e_no},
				dataType:'text',
				success:function(data){
					if(data=='SUCCESS'){
						alert('정상');
						$('#recommend').val('비추천');
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
						alert('정상');
						$('#recommend').val('추천');
					}
					if(data=='noLogin'){
						alert('로그인을 해주세요!');
					}
				}
			});
		}
		
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
	$('#reply_okbtn').on("click",function(){
		var cont=$('#reply_cont').val();
		if(!cont==''){
			$.ajax({//jQuery 비동기식 아작스 함수
				  type : 'post',//메서드 보내는 방식이 post
				  url : '/reply_add', //매핑주소
				  headers :{
					  "Content-Type" : "application/json",
					  "X-HTTP-Method-Override" : "POST",
				  }, //HTTP 헤더에 추가되는 컨텐트 타입형식이 json이고,메서드방식이
				  //POST
				  dataType : 'text',//자료형식이 문자열
				  data: JSON.stringify({
					  e_no:e_no,//오른쪽에 있는 값이 좌측변수에 할당
					  id:<%=id%>,//댓글 작성자
					  replycont:replycont,//댓글내용
		//이것이 ReplyVO빈클래스의 변수명이 된다.
				  }),//보내는 데이터가 JSON문자열=>JSON데이터
				  success : function(result){
					  //비동기식으로 가져오는 것이 성공시 호출되는 콜백함수,가져온 문자열은
					  //result매개변수에 저장
					  if(result == 'SUCCESS'){
						  alert('댓글이 등록되었습니다!');
						  getAllList();//댓글목록함수를 호출
					  }
				  }
			  });
		}
	});
	$('.reply_idlike').on("click",function(){
		 var reply=$('.replyLi').val();
		 alert(reply);
		 /*$.ajax({
			type:"post",
			url:"/reply_del",
			headers:{
				 "Content-Type" : "application/json",
				 "X-HTTP-Method-Override" : "POST",
			},
			datatype:"text",
			data:JSON.stringify({
				reply_no:,
				id:,
			}),
			success : function(result){
				if(result=='SUCCESS'){
					alert('댓글이 삭제 되었습니다.');
				}
			}
			});*/
	 });
	function getAllList(){
		   $.getJSON("/reply_getlist/"+${book.e_no},function(data){
	        var str="";
	        $(data).each(function(){//jQuery each()함수로 반복
	        str += "<li data-reply_no='"+this.reply_no+"' class='replyLi'><div>"
	        +"<div><span>"+this.id+"</span><input type='button' value='삭제' class='reply_idlike' ></div>"//아이디
	        +"<div>"+this.reply_cont+"</div>"//내용
	        +"<div><span>"+this.regdate+"</span></div>"//날짜
	        +"</div></li><br/>"
	        });
	        $('#reply_list').html(str);//ul 아이디영역에 jQuery html()함수로 읽어온 문자와 태그를 함께 변경적용
		   });
	   }//댓글목록함수
	 
	   
	 });//function();
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
						<input type="hidden" value="${book.e_no}" id="e_no" />
							<div>
								<img src="/file/${book.img_file.y}/${book.img_file.m}/${book.img_file.d}/img/${book.img_file.stored_file_name}" style="float:left; width: 200PX; height: 250px; margin-right: 15px;">
							</div>
							<div>
							<p>제목 : ${book.e_title}</p>
							<p>저자 : ${book.e_author}</p>
							<p>출판사 : ${book.e_publisher}</p>
							<p>출판연도 : ${book.e_publication_year}</p>
							<p>도서현황 : 5/${book.e_status}</p>
							<p>추천수 : ${book.e_recommend}</p>
							<br> 
							<input type="button" value="<c:if test="${!empty recommand}"><c:if test="${recommand eq '추천'}">추천</c:if><c:if test="${recommand eq '비추천'}">비추천</c:if></c:if><c:if test="${empty recommand}">추천</c:if>" class="btn" id="recommend" />
							<input type="button" value="대여" class="btn" id="book_loan_return" />
							<p>
						</div>
						</div>
						<div>
						<br><p style="margin-bottom: 7px; font-weight: 800;">책소개</p><hr><div style="margin: 7px 0 7px 0;">${book.e_introduce}</div>
						</div>
					</div>
					<div id="reply_listbox"><!-- 댓글 박스 목록 -->
					<ul id="reply_list">
						
					</ul>
					</div>
					<!-- 댓글 창? -->
					<div id="reply_box">
						<div style="text-align: center;">
						<textarea rows="4" cols="" id="reply_cont" style="width: 80%; vertical-align: middle;" ></textarea>
						<input type="button" value="확인" id="reply_okbtn" style="width: 65px; height: 65px; vertical-align: middle;" />
						</div>
					</div>
				</div>
			</div>
			<!-- 여기까지가 몸체우측 -->
		</div>
	</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>