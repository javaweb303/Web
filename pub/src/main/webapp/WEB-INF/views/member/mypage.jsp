<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(function(){
	$('.go_book').on("click",function(){
		location.href='/ebookcont?isbn='+$(this).data('isbn');
	})
	$('.LoanBookBox').on("click",".bookreturn",function(){
		var eno=$($(this).parents('.LoanBookBox')).data("e_no");
		if (confirm("반납 하겠습니까?") == true){//확인
			$.ajax({
				type:'get',
				url:'/book_return?e_no='+eno,
				success:function(result){
					if(result=="SUCCESS"){
						location.href='/mypage?tab_menu=lib';//새로 고침을 하면 ?뒤에 내용이 없어져서 내서재에 대한 
					}
				}
			});	
		 }else{//취소
		     return false;
		 }
	});
	
	$('.LoanBookBox').on("click", ".read", function() {
			var eno = $($(this).parents('.LoanBookBox')).data("e_no");
			if (confirm("뷰로 이동.") == true){//확인
				window.open("/read?e_no="+eno,"뷰어","width=1200px,height=800px"+
				 ",scrollbars=no");
			 }else{//취소
			     return false;
			 }
		});
	if('${tab_send}'=='lib'){
		$('#my_info').hide();
		$('.container').css("height","1210");
	}else{
		$('#lib').hide();
		$('.container').css("height","900");
	}
	$('.edit_btn').on("click",function(){
		var text = $(this).val();
		if(text == '내정보 수정'){
			window.open("/member_edit","회원탈퇴","width=570px,height=550px"+
			 ",scrollbars=yes");
		}
		if(text == '비밀번호 변경'){
			window.open("/change_pw","회원탈퇴","width=370px,height=310px"+
			 ",scrollbars=yes");
		}
		if(text == '회원 탈퇴'){
			window.open("/member_del","회원탈퇴","width=450px,height=450px"+
			 ",scrollbars=no");
		}
	});
	
	//페이지 새로고침을 확인하기위해 가져온것..
	/*
	if (window.performance) {
		  console.info("window.performance work's fine on this browser");
	}
	if (performance.navigation.type == 1) {//새로고침됬을떄.
		location.href='/mypage';
	} else {
		 console.info( "This page is not reloaded");
	}*/
	});//function
function pwd(){
		window.open('resources/Popup_pwd.jsp',',비밀번호 변경','width=330, height=150, toolbar=no, menubar=no, location=no, scrllbars=no, resizable=no, fullscreen=no, status=no, left=500, top=400');
	}
function tab_click(obj){
	var data=obj.getAttribute('data-taget');//해당 이벤트가 발생한 data-taget에 대한 값을 data에 저장.
	location.href='/mypage?tab_menu='+data;
}
function home(){
	location.href='/';
}
function reload(){
	location.reload();
}
</script>
<style>
/*컬러는 임시..*/
body{margin: 0;}
p{margin: 0;}
#head{color: white;}
#top{background-color: #171d33;}
.box{width: 100%;}
/*최상위*/
#content{ position:relative; height: 100%;}

/*머리*/
#head_left{position: absolute; left: 20px;}
#logo{width: 100px;}
#head_left #logo img{height: 50px;}
#head_right{position:absolute; right: 20px; top:12px;}
#content .tap_menuBox{margin: 0 auto; background-color: #2c375f;}
#content .top_menu{display: inline-block; margin: 0 5px 0 5px;}


/*몸체*/
#content .container{margin: 0 40px; height: 100%;}
.cont_wrap{position: relative; max-width: 914px; height: 55px; margin: 0 auto; padding: 0 20px;}
#content .content_head{position: relative; max-width: 914px; height: 55px; margin: 0 auto; padding: 0 20px;}/*색변경*/

/*표*/
table{border-bottom: 1px solid #e5e5e5; width: 100%; border-collapse: collapse;}
th,td{border-top: 1px solid #e5e5e5}
th{border-right: 1px solid #e5e5e5; text-align: left; padding: 12px 0 12px 30px; width: 150px;}
td{padding: 12px 0 12px 10px;}

.mypage_btn{margin:  0 65px 0 65px; width: 100px;}


#footer{text-align: center; background-color: #171d33; color: white;}
#footer_info{position: relative; max-width: 914px; height: 55px; margin: 0 auto; padding: 0 20px;}
</style>
<div id="content">
	<div id="head">
		<div id="top">
			<div class="content_head">
				<div id="head_left">
					<div id="logo"><img alt="로고" src="resources/images/logo/logo_white.png" onclick="location.href='/'"></div>
				</div>
				<div id="head_right">
					<span class="head_rigth_">${id} 님</span><span class="head_rigth_" onclick="location.href='/'">
						HOME </span><span class="head_rigth_" onclick="location.href='/logout'"> Logout </span>
				</div>
			</div>
		</div>
		<div class="tap_menuBox">
			<div style="max-width: 914px; margin: 0 auto; padding: 0 20px;">
				<div class="top_menu">
					<span data-taget="my_info" onclick="tab_click(this);">내 정보</span>
				</div>
				<div class="top_menu">
					<span data-taget="lib" onclick="tab_click(this);">내 서재</span>
				</div>
			</div>
		</div>
	</div>
	<div class="container"><!-- 몸체 -->
   	 <div class="cont_wrap">
     	<div style="position: absolute;" id="my_info" class="box"><!-- 내정보 -->
     		<div>
     			<h3 style="border-bottom: 1px solid gray;">내정보</h3>
					<table>
						<tr>
							<th>이름</th>
							<td>${member_info.name}</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>${member_info.id}</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>${member_info.birth}</td>
						</tr>
						<tr>
							<th rowspan="2">연락처</th>
							<td>${member_info.email}@${member_info.email_domain}</td>
						</tr>
						<tr>
							<td>${member_info.mem_phone1}-${member_info.mem_phone2}-${member_info.mem_phone3}</td>
						</tr>
						<tbody>
							<tr>
								<th>우편번호</th>
								<td>${member_info.zipNo}</td>
							</tr>
							<tr>
								<th>도로명주소</th>
								<td>${member_info.roadAddrPart1} ${member_info.roadAddrPart2}</td>
							</tr>
							<tr>
								<th>상세주소</th>
								<td>${member_info.addrDetail}</td>
							</tr>
						</tbody>
						<tr>
							<th>대출중인 도서 개수</th>
							<td>${loancount}개</td>
						</tr>
					</table>
     		</div>
     		<div style="height: 150px;">
     			<h3 style="border-bottom: 1px solid gray;">내정보 수정</h3>
     			<p style="text-align: center; margin-bottom: 18px;">＊ ${member_info.name}님의 개인정보 및 비밀번호를 변경할 수 있습니다. 변경을 원하시는 항목을 선택해주세요.</p>
     			<div style="text-align: center;">
     				<input type="button" value="내정보 수정" class="mypage_btn edit_btn"> <input type="button" value="비밀번호 변경" class="mypage_btn edit_btn"> <input type="button" value="회원 탈퇴" class="mypage_btn edit_btn">
     			</div>
     		</div>
     	</div>
			<div style="position: absolute; width: 100%;" id="lib" class="box">
				<!-- 내서재 -->
				<div>
					<h3>내서재</h3>
					<div>
						<c:if test="${empty myloanlist}">대출중인 도서가 없습니다.</c:if>
						<c:if test="${!empty myloanlist}">
						<ul style="list-style-type: none;">
							<c:forEach items="${myloanlist}" var="loanlist">
									<li style="height: 225px; border-bottom: 1px solid gray;" class="LoanBookBox" data-e_no="${loanlist.e_no}">
										<div>
											<c:if test="${!empty loanlist.imgurl}">
											<img alt="" src="${loanlist.imgurl}" style="width: 165px; height: 225px; margin: 0; float: left;">
											</c:if>
											<c:if test="${empty loanlist.imgurl}">
											<img src="/file/book_img/${loanlist.e_no}_/${loanlist.title}.png" style="width: 165px; height: 225px; margin: 0; float: left;">
											</c:if>
											<div style="padding-top: 15px;">
												<p style="font-size: 25px; margin: 5px 0 5px 0; overflow: hidden; height: 33px;" data-isbn="${loanlist.isbn}" class="go_book">${loanlist.title}</p>
													<span>저자:${loanlist.author}</span><br>
													<span>출판사:${loanlist.publisher}</span><br>
													<span>출판연도:${loanlist.publication_year}</span><br>
													<span>대출일:${loanlist.loan_date}</span><br>
													<span>반납예정일:${loanlist.return_date}</span>
											</div>
											<div style="position: absolute; right: 10px; margin-top: 12px;">
												<input type="button" value="보기" onclick="" class="read">
												<input type="button" value="반납" onclick="" class="bookreturn">
											</div>
										</div>
									</li>
							</c:forEach>
						</ul>
						</c:if>
					</div>
				</div>
			</div>
			<div><!-- 보안설정(비밀번호 변경,회원 탈퇴) -->
     	</div>
     </div>
     
   </div>
   <footer id="footer">
			<div class="footer-info">
				<div class="footer-cont">
					<address>서울특별시 동작구 장승배기로 171 2층, 3층 303호</address>
					문의전화 02) 866-9357 | 팩스 02) 5249-1464
				</div>
				<p class="copy">COPYRIGHT © Library, Inc. All rights reserved</p>
			</div>
			<!--// footer-bottom -->
		</footer>
</div>

   </div>
</body>
</html>