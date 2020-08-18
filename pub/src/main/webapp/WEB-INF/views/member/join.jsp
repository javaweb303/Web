<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%--<%@ page import="mail.*" %>--%>
<style>
#join {
	width: 350px;
	margin: 0 auto;
}

#joinbox {
	width: 300px;
	height: 550px;
	margin: 0 auto;
}

#joinbox label {
	font-weight: 700;
}

#joinbox .box {
	width: 100%;
}

#joinbox .box .inputbox {
	width: 100%;
	height: 35px;
}

#su_img {
	margin: 0 auto;
	width: 300px;
	height: 150px;
	background-image: url(resources/images/logo/logo.png);
	background-repeat: no-repeat;
	background-position: center;
	background-size: 100%;
}

#joinbox .box .chk_email {
	width: 100%;
	height: 35px;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
function goPage() { location.href="/"; }
	$(function() {
		$('#chk_code').hide();
		$('#send').attr("disabled",true);
		$msg = '<font color="red" size="0.6"><b>필수 입력 값입니다.</b></font>';
		$('#id').blur(function() {
			if ($.trim($(this).val()) == "") {
				$('#iderrbox').text('');
				$('#iderrbox').append($msg);
			} else {
				$('#iderrbox').text('');
			}
		});
		$('#pw').blur(function() {
			if ($.trim($(this).val()) == "") {
				$('#pwderrbox').text('');
				$('#pwderrbox').append($msg);
			} else {
				$('#pwderrbox').text('');
			}
		});
		$('#pwdCheck').blur(function() {
			if ($.trim($(this).val()) == "") {
				$('#pwdchkerrbox').text('');
				$('#pwdchkerrbox').append($msg);
			} else {
				$pwd=$('#pw').val();
				$pwdchk=$('#pwdCheck').val();
				$pwdmsg='<font color="red" size="0.6"><b>입력하신 비밀번호 값이 다릅니다.</b></font>';
				if($pwd == $pwdchk){
					$('#pwdchkerrbox').text('');
				}else{
					$('#pwdchkerrbox').text('');
					$('#pwdchkerrbox').append($pwdmsg);
				}
			}
		});

		$('#name').blur(function() {
			if ($.trim($(this).val()) == "") {
				$('#nameerrbox').text('');
				$('#nameerrbox').append($msg);
			} else {
				$('#nameerrbox').text('');
			}
		});
		$('#chkBtn').on("click", function() {
			var email = $('#emailbox').val();
			var obj = {"email":email};
			$.ajax({
				type : "post",
				url : "/sendmail",
				dataType : "text",
				contentType : "application/json",
				data : JSON.stringify(obj),
				success : function(data) {
					if(data=='SUCCESS'){
						$('#chk_code').css("display","block");
					}
				},
				error : function(errorThrown) {
					alert(errorThrown.statusText);
				}
			});
		});
		$('#chk_code').blur(function() {
			var email = $.trim($('#emailbox').val());
			var code = $.trim($('#chk_code').val());
			var obj = {"email":email,"code":code};
			var code;
			if(code != ""){
				$.ajax({
					type:"post",
					url:"/chk",
					dataType:"text",
					contentType : "application/json",
					data : JSON.stringify(obj),
					success : function(data) {
						if(data=='SUCCESS'){
							$('#send').attr("disabled",false);
						}
						if(data=='FAIL'){
							alert('인증코드가 다르다.');
							$('#chk_code').val("").focus();
						}
					},
					error : function(errorThrown) {
						alert(errorThrown.statusText);
					}
				});
			}
		});
	});
</script>
<div id="join">
	<div id="su_img" onclick="goPage();"></div>
	<form id="joinbox" method="post" action="join_ok"
		onsubmit="return check();">
		<label>아이디</label>
		<div id="idBox" class="box">
			<input type="text" id="id" name="id" class="inputbox"> <span
				id="iderrbox"></span>
		</div>

		<label>비밀번호</label>
		<div id="pwdBox" class="box">
			<input type="password" id="pw" name="pw" class="inputbox"> <span
				id="pwderrbox"></span>
		</div>

		<label for="pwdCheck">비밀번호 재확인</label>
		<div id="pwdCheckBox" class="box">
			<input type="password" id="pwdCheck" class="inputbox"> <span
				id="pwdchkerrbox"></span>
		</div>

		<label>이름</label>
		<div id="nameBox" class="box">
			<input type="text" id="name" name="name" class="inputbox"> <span
				id="nameerrbox"></span>
		</div>

		<label>생년월일</label>
		<div id="birth_box" class="box">
			<input type="date" name="birth" placeholder="년(4자)"
				class="inputbox">
		</div>

		<label>성별</label>
		<div id="gender_box" class="box">
			<select name="gender" class="box">
				<option>성별</option>
				<option>여성</option>
				<option>남성</option>
			</select>
		</div>

		<label>본인 확인 이메일</label>
		<div id="email" class="box">
			<input type="email" name="email" placeholder="선택입력" class="inputbox"
				id="emailbox"> <br> <input type="button"
				class="chk_email" value="인증코드 받기" id="chkBtn" />
			<!-- pass -->
			<input type="text" size="6" name="chk_code" id="chk_code"
				class="inputbox">
		</div>
		<br> <input type="submit" id="send" value="가입하기" class="box">
	</form>
</div>