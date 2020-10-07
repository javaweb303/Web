function join_check(){
	if($.trim($("#id").val())==""){
		alert("회원아이디를 입력하세요!");
		$("#id").val("").focus();
		return false;
	}
	$mem_pwd=$.trim($("#pw").val());
	$mem_pwd2=$.trim($("#mem_pwd2").val());
	if($mem_pwd == ""){
		alert("비번을 입력하세요!");
		$("#pw").val("").focus();
		return false;
	}
	if($mem_pwd2 == ""){
		alert("비번확인을 입력하세요!");
		$("#mem_pwd2").val("").focus();
		return false;
	}
	if($mem_pwd != $mem_pwd2){
		alert("비번이 다릅니다!");
		$("#pw").val("");//비번 입력박스를 초기화
		$("#mem_pwd2").val("");
		$("#pw").focus();
		return false;
	}
	if($.trim($("#name").val())==""){
		alert("회원이름을 입력하세요!");
		$("#name").val("").focus();
		return false;
	}
	
	if($.trim($("#birth").val())==""){
		alert("생년월일을 입력하세요!");	
		$("#birth").val("").focus();	
		return false;
	}
	
	
	
	if($.trim($("#zipNo").val())==""){
		alert("우편번호를 입력하세요!");		
		return false;
	}

	if($.trim($("#mem_phone2").val())==""){
		alert("핸드폰 번호를 확인하세요!");
		$("#mem_phone2").val("").focus();
		return false;
	}
	if($.trim($("#mem_phone3").val())==""){
		alert("핸드폰 번호를 확인하세요!");
		$("#mem_phone03").val("").focus();
		return false;
	}
	if($.trim($("#email").val())==""){
		alert("메일을 입력하세요!");
		$("#email").val("").focus();
		return false;
	}
	if($.trim($("#email_domain").val())==""){
		alert("메이일을 입력하세요!");		
		return false;
	}
	
	if(!($('input:radio[name=gender]').is(':checked'))){
		alert("성별을 선택해주세요!");		
		return false;
	}
	
	if($.trim($("#chk_code").val()) =="") {
		alert("인증코드를 입력하세요!");
		return false;
	}
}

//관리자 회원 가입
function adjoin_check(){
	if($.trim($("#id").val())==""){
		alert("회원아이디를 입력하세요!");
		$("#id").val("").focus();
		return false;
	}
	$mem_pwd=$.trim($("#pw").val());
	$mem_pwd2=$.trim($("#mem_pwd2").val());
	if($mem_pwd == ""){
		alert("비번을 입력하세요!");
		$("#pw").val("").focus();
		return false;
	}
	if($mem_pwd2 == ""){
		alert("비번확인을 입력하세요!");
		$("#mem_pwd2").val("").focus();
		return false;
	}
	if($mem_pwd != $mem_pwd2){
		alert("비번이 다릅니다!");
		$("#pw").val("");//비번 입력박스를 초기화
		$("#mem_pwd2").val("");
		$("#pw").focus();
		return false;
	}
	if($.trim($("#name").val())==""){
		alert("회원이름을 입력하세요!");
		$("#name").val("").focus();
		return false;
	}
	
	if($.trim($("#birth").val())==""){
		alert("생년월일을 입력하세요!");	
		$("#birth").val("").focus();	
		return false;
	}
	
	
	
	if($.trim($("#zipNo").val())==""){
		alert("우편번호를 입력하세요!");		
		return false;
	}

	if($.trim($("#mem_phone2").val())==""){
		alert("핸드폰 번호를 확인하세요!");
		$("#mem_phone2").val("").focus();
		return false;
	}
	if($.trim($("#mem_phone3").val())==""){
		alert("핸드폰 번호를 확인하세요!");
		$("#mem_phone3").val("").focus();
		return false;
	}
	if($.trim($("#email").val())==""){
		alert("메일을 입력하세요!");
		$("#email").val("").focus();
		return false;
	}
	if($.trim($("#email_domain").val())==""){
		alert("메이일을 입력하세요!");		
		return false;
	}
	
	if(!($('input:radio[name=gender]').is(':checked'))){
		alert("성별을 선택해주세요!");		
		return false;
	}
}

//중복아이디 검색
function id_check(){
 /* copy begin */
	$("#idcheck").hide();
	//아이디 영역을 숨김
	$mem_id=$.trim($("#id").val());
	//1.입력글자 길이 체크
	if($mem_id.length < 4){
		$newtext='<font color="red" size="3"><b>아이디는 4글자 이상이어야 합니다.</b></font>';
		$("#idcheck").text('');
		
			  
		//idcheck 아이디 영역 문자열을 초기화
		$("#idcheck").show();
		//idcheck 아이디 영역을 보이게 함.
		$("#idcheck").append($newtext);
		//idcheck영역에 문자열을 추가
		$("#id").val('').focus();//아이디 입력박스를 초기화 하고 포커스이동
		return false;//이벤트 종료
	};
	if($mem_id.length > 12){
		$newtext='<font color="red" size="3"><b>아이디는12자 이하이어야 합니다.</b></font>';
		$("#idcheck").text('');
		//idcheck 아이디 영역 문자열을 초기화
		$("#idcheck").show();
		//idcheck 아이디 영역을 보이게 함.
		$("#idcheck").append($newtext);
		//idcheck영역에 문자열을 추가
		$("#id").val('').focus();
		return false;
	};
	//2.입력글자 확인
	if(!(validate_userid($mem_id))){
		$newtext='<font color="red" size="3"><b>아이디는 영문소문자,숫자,_조합만 가능합니다.</b></font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append($newtext);
		$("#id").val('').focus();
		return false;
	};
	//아이디 중복확인
    $.ajax({//$는 jQuery란 뜻. $.ajax 뜻은 jQuery 내의 아작스 실행
        type:"POST",//데이터를 서버로 보내는 방법
       //url:"./member/member_idcheck.jsp",    
        url:"member_idcheck", //아작스 서버 주소 파일명
        data: {"id":$mem_id},  //좌측 id 피라미터 이름에 우측 $mem_id변수값을 저장
        datatype:"int",//받아오는 자료형 타입
        success: function (data) {//success는 아작스로 받아오는것이 성공했을경우 호출되는 콜백함수
        	//. 받아온 데이터를 data 매개변수에 저장
      	  if(data==1){//중복 아이디가 있다면
      		$newtext='<font color="red" size="3"><b>중복 아이디입니다.</b></font>';
      		$("#idcheck").text('');
        	$("#idcheck").show();
        	$("#idcheck").append($newtext);          		
          	$("#id").val('').focus();
          	return false;
	     
      	  }else{//중복 아이디가 아니면
      		$newtext='<font color="blue" size="3"><b>사용가능한 아이디입니다.</b></font>';
      		$("#idcheck").text('');
      		$("#idcheck").show();
      		$("#idcheck").append($newtext);
      		$("#pw").focus();
      	  }  	    	  
        },
    	  error:function(){//비동기식 아작스로 서버디비 데이터를
    		  //못가져와서 에러가 발생했을 때 호출되는 콜백함수이다.
    		  alert("data error");
    	  }
      });//$.ajax
 /* end */	
}

//정규표현식
function validate_userid($mem_id)
{
  var pattern= new RegExp(/^[a-z0-9_]+$/);//아이디를 영문소문
  //자와 숫자 와 _조합으로 처리
  return pattern.test($mem_id);//test()메서드로 정규표현식 검사
};



//메일 주소 선택과 직접입력
function domain_list(){
  var num=form.mail_list.selectedIndex;//선택한 목록 항목 번호. m은 폼네임속성명. mail_list는 sele
  //ct태그 네임속성명. 첫번째 항목번호는 0
  if(num == -1){//목록이 선택되지 않았을때 실행
	  return true;//함수 종료
  }
  if(form.mail_list.value =="direct"){
	  form.email_domain.value = " ";//이메일의 멜주소 입력박스를 빈공백으로 초기화
	  form.email_domain.readOnly=false;//쓰기 가능
	  form.email_domain.focus();//입력박스로 포커스 이동
  }else{//목록에서 멜주소를 선택한 경우
	 form.email_domain.value=form.mail_list.options[num].value;
	 //목록 옵션 value값이 멜도메인 입력박스로 입력
	 form.email_domain.readOnly=true;//읽기만 가능
  }
}//domain_list()










//member_edt.jsp

function edit_check(){
	
	
	$pw=$.trim($("#pw").val());
	$mem_pwd2=$.trim($("#mem_pwd2").val());
	if(pw == ""){
		alert("비번을 입력하세요!");
		$("#pw").val("").focus();
		return false;
	}
	if($mem_pwd2 == ""){
		alert("비번확인을 입력하세요!");
		$("#mem_pwd2").val("").focus();
		return false;
	}
	if($pw != $mem_pwd2){
		alert("비번이 다릅니다!");
		$("#pw").val("");//비번 입력박스를 초기화
		$("#mem_pwd2").val("");
		$("#pw").focus();
		return false;
	}
}//edit_check()


 function del_check(){
	 if($.trim($("#del_pwd").val())==""){
		 alert("탈퇴 비번을 입력하세요!");
		 $("#del_pwd").val("").focus();
		 return false;
	 }
	 if($.trim($("#del_cont").val())==""){
		 alert("탈퇴 사유를 입력하세요!");
		 $("#del_cont").val("").focus();
		 return false;
	 }
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


//메일인증
function sendmail(){
	var mail=$('#email').val();
	var domain=$('#email_domain').val();
	var btn_text=$('#chkBtn').val();
	if(btn_text=='인증코드 받기'){
	$('#chkBtn').val('인증번호 확인');
	$.ajax({
		url:'/sendmail?email='+mail+'&domain='+domain+'&type=join',
		type:'get' ,
		success:function(date){
			if (date == 'SUCCESS'){
				alert("인증번호가 발송 되었습니다.");
				
			}
		}
		
	});
	}
	if(btn_text=='인증번호 확인'){
		var code = $('#chk_code').val();
		$.ajax({
			url:'/sendmail?email='+mail+'&domain='+domain+'&type=check&code='+code,
			type:'get' ,
			success:function(date){
				if (date == 'SUCCESS'){
					alert("인증번호가 확인되었습니다");
					$('#submit_btn').attr('disabled',false);
				}
				if(date=='FAIL'){
					alert("인증번호를 확인헤주세요");
				}
			}
			
		});
	}
}


//비밀번호 제약조건