<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(function(){
	var getid=parent.$('#id').val();
	$('#getID').val(getid);
	
	//수정클릭
	$('.edit').on("click",function(){
		$parent=$(this).parents('.replyList');
		$parent.hide();
		$parents=$parent.closest('.replyBox');
		$Box=$parents.find('.replyEditBox');
		$.ajax({
			type:'get',
			url:'/getreply?r_no='+$parent.data('reply_no'),
			success:function(result){
				if(result!=null){
					var _id=$(result).find('id').text();
					var _cont=$(result).find('reply_cont').text();
					$Box.append("<div>"+
							"<p id='edit_id'>"+_id+"</p>"+
							"<textarea id='editcont' rows='4' style='width:100%;'>"+_cont+"</textarea>"+
							"<div style='float:right;'><span id='Edit_ok'>확인</span>  <span id='edit_close'>취소</span></div>"+
							"</div>");
				}
			}
			
		});
	});//수정 끝
	
	//수정 확인 클릭
	$('.replyBox').on("click","#Edit_ok",function(){
		$parent=$(this).parents('.replyBox');
		var r_no=$parent.find('.replyList').data('reply_no');
		var send_id=$parent.find('#edit_id').val();
		var send_cont=$parent.find('#editcont').val();
		$.ajax({
			type:'post',
			url:'/replyEdit',
			dataType: "json",
			contentType:"application/json;charset=UTF-8",
			data:JSON.stringify({
				reply_no:r_no,
				id:send_id,
				reply_cont:send_cont,
			}),
			success:function(result){
				if(result=="OK"){
					$parent.find('.replyEditBox').empty();
					$parent.find('.replyList').show();
				}
			}
		});
	});//수정 확인 끝
	
	//수정 취소
	$('.replyBox').on("click","#edit_close",function(){
		$parent=$(this).parents('.replyBox');
		$parent.find('.replyEditBox').empty();
		$parent.find('.replyList').show();
	});//수정 취소 끝
});
function del(r_no){
	$.ajax({
		type:'get',
		url:'/replyDel?r_no='+r_no,
		success:function(result){
			if(result=='OK'){
				location.reload();
			}
		}
	});
}
</script>
</head>
<body>
<input type="hidden" value="" id="getID">
	<c:if test="${empty list}"><p>댓글이 없음.</p></c:if>
	<c:if test="${!empty list}">
		<div>
		<c:forEach items="${list}" var="reply">
			<div class="replyBox">
				<div class="replyList" data-reply_no="${reply.reply_no}">
					<p class="reply_id">${reply.id}</p>
					<p class="reply_cont">${reply.reply_cont}</p>
					<span>${reply.regdate}</span>
					<c:if test="${reply.id==sessionScope.id}">
					<div class="__" style="float:right;">
						<span class="edit">수정</span>  <span onclick="del(${reply.reply_no})">삭제</span>
					</div>
				</c:if>
				</div>
				<div class="replyEditBox">
				</div>
			</div>
		</c:forEach>
		</div>
		<div>
			<c:if test="${page <=1}">[이전]&nbsp;</c:if>
			<c:if test="${page >1}">
				<a href="/reply_getList?e_no=${e_no}&page=${page-1}">[이전]</a>&nbsp;
   							</c:if>

			<%--쪽번호 출력부분 --%>
			<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a == page}"><${a}></c:if>
				<%--현재 쪽번호가 선택된 경우 --%>

				<c:if test="${a != page}">
					<%--현재 쪽번호가 선택안된 경우 --%>
					<a href="/reply_getList?e_no=${e_no}&page=${a}">[${a}]</a>&nbsp;
    							</c:if>
			</c:forEach>

			<c:if test="${page>=maxpage}">[다음]</c:if>
			<c:if test="${page<maxpage}">
				<a href="/reply_getList?e_no=${e_no}&page=${page+1}">[다음]</a>
			</c:if>
		</div>
	</c:if>
</body>
</html>