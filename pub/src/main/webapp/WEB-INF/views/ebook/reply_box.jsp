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
	var geteno=parent.$('#e_no').val();
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
							"<p id='edit_id' style='font-size: 12px;font-weight:700'>"+_id+"</p>"+
							"<textarea id='editcont' rows='4' style='width:100%;'>"+_cont+"</textarea>"+
							"<div style='float:right;'><button id='Edit_ok' style='font-size: 12px;'>확인</button>  <button id='edit_close' style='font-size: 12px;'>취소</button></div>"+
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
					location.reload();
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
					  e_no:geteno,//오른쪽에 있는 값이 좌측변수에 할당
					  id:getid,//댓글 작성자
					  reply_cont:cont,//댓글내용
		//이것이 ReplyVO빈클래스의 변수명이 된다.
				  }),//보내는 데이터가 JSON문자열=>JSON데이터
				  success : function(result){
					  //비동기식으로 가져오는 것이 성공시 호출되는 콜백함수,가져온 문자열은
					  //result매개변수에 저장
					  if(result == 'SUCCESS'){
						  alert('댓글이 등록되었습니다!');
						  location.reload();
					  }
				  }
			  });
		}
	});
	if($('#getID').val() == "null"){
		$('#reply_box').hide();
	}
});
function del(r_no){
	$.ajax({
		type:'get',
		url:'/replyDel?r_no='+r_no,
		success:function(result){
			if(result=="OK"){
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
					<p class="reply_id" style="font-size: 12px;font-weight:700">${reply.id}</p>
					<p class="reply_cont" style="font-size: 10px; margin: 3px 0 3px 0;">${reply.reply_cont}</p>
					<span style="font-size: 8px;color: gray;">${reply.regdate}</span>
					<c:if test="${reply.id==sessionScope.id}">
					<div class="__" style="float:right;">
						<span class="edit" style="font-size: 8px;color: gray;" >수정</span>  <span onclick="del(${reply.reply_no})" style="font-size: 8px;color: gray;">삭제</span>
					</div>
				</c:if>
				</div>
				<div class="replyEditBox">
				</div>
			</div>
		</c:forEach>
		</div>
		<p>
		<div style="text-align: center; font-size: 12px;">
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
	<p>
	<div id="reply_box">
		<div style="text-align: center;">
			<textarea rows="4" cols="" id="reply_cont"
				style="width: 80%; vertical-align: middle;"></textarea>
			<input type="button" value="등록" id="reply_okbtn"
				style="width: 65px; height: 65px; vertical-align: middle;" />
		</div>
	</div>
</body>
</html>