<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="resources/css/login.css" />
<script>
function goPage() { location.href="/"; }
</script>
<div class="loginbox">
	<div id="su_img" onclick="goPage();"></div>
	<div id="login">
		<div id="form">
			<form method="post" action="/controller"><!-- 메인으로 나올라구씀 -->
				<div id="inputbox">
					<input type="text" name="id" class="input_row" placeholder="아이디">
					<br> <input type="password" name="pwd" class="input_row"
						placeholder="비밀번호"> <br> <input type="submit"
						value="로그인" class="submit input_row" />
						<p> 아이디가 없습니까? <a href="/controller/join"> 회원가입 </a></p>
				</div>
			</form>
		</div>
	</div>
	<div id="footer">
		<p align="center">&copy; 문아공간</p>
	</div>
</div>