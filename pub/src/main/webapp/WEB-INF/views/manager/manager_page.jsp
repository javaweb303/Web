<%@page import="java.io.File"%>
<%@page import="org.pub.temp.FileChooser"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매니저 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(function(){
	$('#ok').on("click",function(){
		alert($('#file_path').val());
		$.ajax({
			type:'post',
			url:'/newadd',
			contentType:"application/json;charset=UTF-8",
			data:JSON.stringify({
				book:$('#book').val(),
			}),
			success:function(result){
				
			}
		});
	});
}
function getRealPath(obj){
	obj.select();
	var input = document.memberform.file ;
	var fReader = new FileReader();
	fReader.readAsDataURL(input.files[0]);
	fReader.onloadend = function(event){
		document.getElementById('file_path').value = event.target.result;
	}
	 // document.selection.createRange().text.toString(); 이게 실행이 안된다면....
	 // document.selection.createRangeCollection()[0].text.toString(); 이걸로....
	 //document.getElementById('file_path').value = obj.;
}
function pdf(){

}
</script>
</head>
<body>
<br>
<form method="post" enctype="multipart/form-data" action="/add" > 
<table>
<tr>
<th>제목</th><td><input id="e_title" name="e_title"></td>
</tr>
<tr>
<th>저자</th><td><input id="e_author" name="e_author"></td>
</tr>
<tr>
<th>출판사</th><td><input id="e_publisher" name="e_publisher"></td>
</tr>
<tr>
<th>출판연도</th><td><input id="e_publication_year" name="e_publication_year"></td>
</tr>
<tr>
<th>책소개</th><td><textarea rows="14" cols="36" id="e_introduce" name="e_introduce"></textarea></td>
</tr>
<tr>
<th>저자소개</th><td><textarea rows="14" cols="36" id="author_introduce" name="author_introduce"></textarea></td>
</tr>
<tr>
<th>목차</th><td><textarea rows="14" cols="36" id="contents" name="contents"></textarea></td>
</tr>
<tr>
<th>분류코드</th><td><input id="e_group" name="e_group"></td>
</tr>
<tr>
<th>이미지</th><td><input type="file" name="img" id="img"></td>
</tr>
<tr>
<th>파일</th><td><input type="file" name="file" id="book"></td>
<!-- <th>파일</th><td><input type="button" onclick="pdf()" value="PDF"></button></td> -->
</tr>
<tr>
<th colspan="2"><input type="submit" value="확인"><input type="reset" value="취소" id="no"></th>
</tr>
</table>
<input type="hidden" id="file_path" name="file_path" value="" />
</form>
</body>
</html>
