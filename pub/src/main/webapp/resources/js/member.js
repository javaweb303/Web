/**
 * member.js
 */
	$(function() {
		$msg = '<font color="red" size="0.6"><b>필수 입력 값입니다.</b></font>';
		$('#id').blur(function() {
			if ($.trim($(this).val()) == "") {
				$('#iderrbox').text('');
				$('#iderrbox').append($msg);
			} else {
				$('#iderrbox').text('');
				var obj = {"id":$.trim($(this).val())};
				$.ajax({
					type : "post",
					url : "/idcheck",
					dataType : "text",
					contentType : "application/json",
					data : JSON.stringify(obj),
					success : function(data) {
						if(data=='SUCCESS'){
							$('#iderrbox').append('<font color="blue" size="0.6"><b>사용가능한 아이디입니다.</b></font>');
						}
						if(data=='FAIL'){
							$('#iderrbox').append('<font color="red" size="0.6"><b>중복되는 아이디입니다.</b></font>');
						}
					},
					error : function(errorThrown) {
						alert(errorThrown.statusText);
					}
				});
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
			$('#chk_code').css("display","block");
			$.ajax({
				type : "post",
				url : "/sendmail",
				dataType : "text",
				contentType : "application/json",
				data : JSON.stringify(obj),
				success : function(data) {
					if(data=='SUCCESS'){
						alert('인증메일이 발송되었습니다.');
					}
				},
				error : function(errorThrown) {
					alert(errorThrown.statusText);
				}
			});
		});
	});
	function codecheck(){
		var id=$.trim($('#id').val());
		var pwd=$.trim($('#pw').val());
		var name=$.trim($('#name').val());
		var gender=$.trim($('#gender').val());
		var birth=$.trim($('#birth').val());
		var email = $.trim($('#emailbox').val());
		var code = $.trim($('#chk_code').val());
		var obj = {"email":email,"code":code};
		if(code != "" && id != "" && pwd != "" && name != "" && gender != "" && birth != ""){
			$.ajax({
				type:"post",
				url:"/chk",
				dataType:"text",
				contentType : "application/json",
				data : JSON.stringify(obj),
				success : function(data) {
					if(data=='SUCCESS'){
					}
					if(data=='FAIL'){
						alert('인증코드가 다르다.');
						$('#chk_code').val("").focus();
						return false;
					}
				},
				error : function(errorThrown) {
					alert(errorThrown.statusText);
				}
			});
		}else{
			alert('빈칸이 있다.');
			return false;
		}
	}
function select_(){
	var select_val=document.getElementById('select_box').value;
	if(select_val=='direct'){
		document.getElementById('at_sign').value="";
	}else{
		document.getElementById('at_sign').value=select_val;
	}
	alert(select_val);
}



//opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
  var pop = window.open("resources/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
  
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
  //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.roadAddrPart2.value = roadAddrPart2;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
}
