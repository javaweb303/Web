<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%--<%@ page import="mail.*" %>--%>
<style>
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<script type="text/javascript" src="resources/js/member.js"></script>
<style>
/*헤더 색*/
#head{background-color: #171d33}/*색변경*/
/*테마 이름*/
#content .content_head{height: 200px; background-color: #2d5188;}/*색변경*/
#content .content_head h2{padding: 75px 0 70px; text-align: center; color:white;}
/*로컬주소*/
#content .location{margin: 0 auto 23px; width: 100%;}
#content .location ul li{float: right; list-style: none; right: 4%;}

#login {padding: 20px;margin-bottom: 20px;text-align: center;}
#form {	font-size: 1.3em;width: 100%;display: inline-block; /*content/text 크기만큼만 점유하고 동일 라인에 붙는 성질*/}
#inputbox {width: 100%;text-align:center;}
#inputbox .input_row{width: 300px; height: 40px; margin: 5px 15px; font-size: 20px; box-sizing: border-box;}
#inputbox .submit{background-color: #2d5188;}
#inputbox p{font-size: 15px;}
th{width: 30%;}

#joinbox label {font-weight: 700;}
#joinbox .box {width: 100%;}
#joinbox .box .inputbox {width: 100%;	height: 35px;}
#su_img {	margin: 0 auto;	width: 300px;	height: 150px;	background-image: url(resources/images/logo/logo.png);	background-repeat: no-repeat; background-position: center;	background-size: 100%;}
#joinbox .box .chk_email {	width: 100%;	height: 35px;}
#send{height: 35px;}
</style>
<div id="content">
   <div class="content_head"><h2>회원가입</h2></div><!-- 이거 바꾸고 -->
   <div class="location"><!-- 이것도 이건 상단에 home>열린공간 >오시는길 이거 표시하는 부분? -->
   <ul class="">
   <li>회원가입 </li>
   <li><a href="/">Home</a> > </li>
   </ul>
   </div>
   <div class="container" style="margin: 100px 0 100px 0;"><!-- 몸체 -->
      <div id="join" style="border: 1px solid gray; border-radius: 5px; width:500px; height: 350px; margin: 0 auto; padding: 25px 0;">
	<div id="join-warp" style="width: 450px; margin: 0 auto; margin-top: 10px;">
		<div id="join_box">
				<form name="form" id="form" method="post" action="/join_ok">
					<table>
						<tr>
						<th>아이디</th>
						<td><input type="text" id="id" name="id"></td>
						</tr>
						<tr>
						<th>비밀번호</th>
						<td><input type="password" id="pw" name="pw"></td>
						</tr>
						<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" id="" name=""></td>
						</tr>
						<tr>
						<th>이름</th>
						<td><input type="text" id="name" name="name"></td>
						</tr>
						<tr>
						<th>성별</th>
						<td><input type="radio" value="남성" name="gender" />남성<input type="radio" value="여성" name="gender" />여성</td>
						</tr>
						<tr>
						<tr>
						<th>생년월일</th>
						<td><input name="birth"></td>
						</tr>
						<tr>
						<tr>
						<th>휴대전화</th>
						<td>
						<select id="mem_phone1" name="mem_phone1">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="012">012</option>
						<option value="013">013</option>
						<option value="014">014</option>
						<option value="015">015</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
						</select> - 
						<input type="text" id="mem_phone2" name="mem_phone2" style="width: 50px"> - <input type="text" id="mem_phone3" name="mem_phone3" style="width: 50px">
						</td>
						</tr>
						<tr>
						<th>이메일</th>
							<td>
								<div id="email" class="box">
									<input type="text" name="email" id="email" style="width: 80px;"> @ 
									<input type="text" name="email_domain" id="email_domain" style="width: 100px;"> 
									<select name="select_box" id="select_box" style="" onchange="select_();">
										<option value="direct">직접입력</option>
										<option value="naver.com">네이버</option>
										<option value="daum.net">다음</option>
										<option value="google.com">구글</option>
										<option value="nate.com">네이트</option>
									</select> <br> 
								</div>
							</td>
						</tr>
						<tr>
						<th>이메일 확인</th>
						<td>
						<input type="text" size="6" name="chk_code" id="chk_code" class="inputbox">
						<input type="button" class="chk_email" value="인증코드 받기" id="chkBtn" />
									<!-- pass -->
						</td>
						</tr>
						<colgroup>
							<col style="width:20%"><col>
						</colgroup>
						<tbody>
							<tr>
								<th>우편번호</th>
								<td>
								    <input type="hidden" id="confmKey" name="confmKey" value=""  >
									<input type="text" id="zipNo" name="zipNo" readonly style="width:100px">
									<input type="button"  value="주소검색" onclick="goPopup();">
								</td>
							</tr>
							<tr>
								<th>도로명주소</th>
								<td><input type="text" id="roadAddrPart1" name="roadAddrPart1" style="width:85%"></td>
							</tr>
							<tr>
								<th>상세주소</th>
								<td>
									<input type="text" id="addrDetail" name="addrDetail" style="width:40%" value="">
									<input type="text" id="roadAddrPart2" name="roadAddrPart2" style="width:40%" value="">
								</td>
							</tr>
						</tbody>
					</table>
					<div style="text-align: center;">
					<br> <input type="submit" value="가입" class="box"> <input type="button" value="취소" class="box" onclick="location.href='/'" >
					</div>
					</form>
		</div>
	</div>
      </div>
      <!-- 공간 띄우기 위해 -->
      <div style="height: 20px;"></div>
   </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>