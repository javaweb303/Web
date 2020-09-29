<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
function ok(){
	window.close();
}
function close(){
	window.close();
}
</script>
</head>
<body>
<form action="" style="">
<table>
<tr>
	<th>현재 비밀번호</th><td><input type="password" id="pwd"></td>
</tr>
<tr>
	<th>새로운 비밀번호</th><td><input type="password" id="new_pwd"></td>
</tr>
<tr>
	<th>비밀번호 확인</th><td><input type="password" id="new_pwdchk"></td>
</tr>
<tr>
	<th colspan="2"><input type="button" value="확인" onclick="ok();"><input type="button" value="취소" onclick="close();"></th>
</tr>
</table>
</form>
</body>
</html>