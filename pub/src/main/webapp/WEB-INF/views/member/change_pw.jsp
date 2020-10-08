<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/change_pw_ok" method="post">
<table>
<tr><th>현재 비밀번호</th><td><input type="password" name="pw" size="16"></td></tr>
<tr><th>변경할 비밀번호</th><td><input type="password" name="changepw" size="16"></td></tr>
<tr><th>비밀번호 확인</th><td><input type="password" name="chpw" size="16"></td></tr>
<tr><th colspan="2"><input type="submit" value="확인"><input type="button" value="취소" onclick="window.close();"></th></tr>
</table>
</form>
</body>
</html>