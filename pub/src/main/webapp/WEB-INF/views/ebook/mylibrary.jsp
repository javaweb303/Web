<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내서재</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(function(){
	$('.LoanBookBox').on("click",".bookreturn",function(){
		var eno=$($(this).parents('.LoanBookBox')).data("e_no");
		if (confirm("반납 하겠습니까?") == true){//확인
			$.ajax({
				type:'get',
				url:'/book_return?e_no='+eno,
				success:function(result){
					if(result=="SUCCESS"){
						location.reload();
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
				location.href='/read?e_no='+eno+'';
			 }else{//취소
			     return false;
			 }
		});
	});//function
</script>
</head>
<body>
	<div id="LoanList_Wrap">
		<c:if test="${empty myloanlist}">대출중인 도서가 없습니다.</c:if>
		<c:if test="${!empty myloanlist}">
			<c:forEach items="${myloanlist}" var="loanlist">
				<div class="LoanBookBox" style="width: 250px; height: 400px; float: left;" data-e_no="${loanlist.e_no}">
					<!-- 사진 -->
					<div class="LoanBook_imgBox" style="width: 100%; height: 300px; z-index: 2">
						<img src="/file/book_img/${loanlist.e_no}_${loanlist.e_title}/${loanlist.e_title}.png" style="width: 250PX; height: 300px;">
					</div>
					<!-- 책 정보 -->
					<div class="LoanBook_info" style="position: absolute; top:300px; text-align: center; width: 250px;">
					<span>${loanlist.e_title}</span>
					</div>
					<!-- 대출 기간 -->
					<div class="LoanDateBox" style="width: 100%; height: 25px; text-align: center;">
					<p>${loanlist.loan_date} ~ ${loanlist.return_date}</p>
					</div>
					<!-- 보기 및 반납 -->
					<div class="LoanBookBox_Btn" style="width: 100%;height: 75px; text-align: center;"><input type="button" value="읽기" class="read" style="width: 40px; height: 30px; margin-top: 15px; margin-right: 10px;"/><input type="button" value="반납" class="bookreturn" style="width: 40px; height: 30px; margin-top: 15px;"/></div>
					
				</div>
			</c:forEach>
		</c:if>
	</div>
</body>
</html>