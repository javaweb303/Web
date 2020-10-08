<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비번검색</title>
<link rel="stylesheet" type="text/css" 
href="./resources/css/member.css" />
<script src="./resources/js/jquery.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
 function pwd_check(){
	 if($.trim($("#pwd_id").val()) == ""){
		 alert("회원아이디를 입력하세요!");
		 $("#pwd_id").val("").focus();
		 return false;
	 }
     if($.trim($("#pwd_name").val())==""){
    	 alert("회원이름을 입력하세요!");
    	 $("#pwd_name").val("").focus();
    	 return false;
     }	 
     if($.trim($("#pwd_email").val())==""){
    	 alert("회원이메일을 입력하세요!");
    	 $("#pwd_email").val("").focus();
    	 return false;
 }
     if($.trim($("#email_domain").val())==""){
    	 alert("모든 이메일 주소를 입력해주세요!");
    	 $("#email_domain").val("").focus();
    	 return false;
     }
 }
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
</script>
</head>
<body>
 <div id="pFind_wrap">
  <h2 class="pFind_title">비번찾기</h2>
  <form method="post" action="pwd_find_ok"
  onsubmit="return pwd_check();" name = "form">
   <table id="pFind_t">
    <tr>
     <th>회원아이디</th>
     <td>
      <input name="pwd_id" id="pwd_id" size="14" />
     </td>
    </tr>    
    <tr>
      <th>회원이름</th>
      <td>
      <input name="pwd_name" id="pwd_name" size="14" />
      </td>    
    </tr>
    
      <tr>
      <th>회원이메일</th>
      <td>
      <input name="pwd_email" id="pwd_email" size="14" /> @ <input type="text" name="email_domain" id="email_domain" style="width: 100px;"  readonly > 
									<select name="mail_list" id="mail_list" style="" onchange="domain_list();">
										<option value="direct">직접입력</option>
										<option value="naver.com">네이버</option>
										<option value="daum.net">다음</option>
										<option value="google.com">구글</option>
										<option value="nate.com">네이트</option>
             </select>
      </td>    
    </tr>
    
    
   
    
   </table>
   <div id="pFind_menu">
   <input type="submit" value="찾기" />
   <input type="reset" value="취소" 
   onclick="window.close();"/>
   </div>
  </form>
 </div>
</body>
</html>




























