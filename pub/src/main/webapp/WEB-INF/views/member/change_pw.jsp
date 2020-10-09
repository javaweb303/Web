<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style type="text/css">
table{border-bottom: 1px solid #e5e5e5; width: 100%; border-collapse: collapse;}
th,td{border-top: 1px solid #e5e5e5}
th{border-right: 1px solid #e5e5e5; text-align: left; padding: 12px 0 12px 30px; width: 150px;}
td{padding: 12px 0 12px 10px;}
</style>
</head>
<body>
<form action="/change_pw_ok" method="post">
<h2>비밀번호 변경</h2>
<table>
<tr><th>현재 비밀번호</th><td><input type="password" name="pw" size="16"></td></tr>
<tr><th>변경할 비밀번호</th><td><input type="password" name="changepw" size="16"></td></tr>
<tr><th>비밀번호 확인</th><td><input type="password" name="chpw" size="16"></td></tr>
<tr><td colspan="2" style="text-align: center;"><input type="submit" value="확인"><input type="button" value="취소" onclick="window.close();"></td></tr>
</table>
</form>
</body>
</html>