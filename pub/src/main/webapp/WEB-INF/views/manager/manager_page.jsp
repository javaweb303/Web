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
		var e_title=$('#e_title').val();
		var e_author=$('#e_author').val();
		var e_publisher=$('#e_publisher').val();
		var e_publication_year=$('#e_publication_year').val();
		
		var e_group=$('#e_group').val();
		var e_bookimg=$('#e_bookimg').val();
		var e_file=$('#e_file').val();
		var obj={"e_title":e_title,"e_author":e_author,"e_publisher":e_publisher,"e_publication_year":e_publication_year,
				"e_group":e_group,"e_bookimg":e_bookimg,"e_file":e_file};
		alert(JSON.stringify(obj));
		
	});
});
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
<th>분류코드</th><td><input id="e_group" name="e_group"></td>
</tr>
<tr>
<th>이미지</th><td><input type="file" name="e_bookimg" id="e_bookimg"></td>
</tr>
<tr>
<th>파일</th><td><input type="file" name="e_bookfile" id="e_bookfile"></td>
</tr>
<tr>
<th colspan="2"><input type="submit" value="확인"><input type="reset" value="취소" id="no"></th>
</tr>
</table>
</form>
</body>
</html>
