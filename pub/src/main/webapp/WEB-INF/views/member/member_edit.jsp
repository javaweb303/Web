<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정 폼</title>
<link rel="stylesheet" type="text/css"  />
<script src="/resources/js/member.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
table{border-bottom: 1px solid #e5e5e5; width: 100%; border-collapse: collapse;}
th,td{border-top: 1px solid #e5e5e5}
th{border-right: 1px solid #e5e5e5; text-align: left; padding: 12px 0 12px 30px; width: 150px;}
td{padding: 12px 0 12px 10px;}
</style>
</head>
<body>
 <div id="mJoin_wrap">
  <h2 class="mJoin_title">회원수정</h2>
  <form name="form" method="post" action="edit_ok" 
  onsubmit="return edit_check();">
   <table id="mJoin_t">
    <tr>
     <th>회원아이디</th>
     <td>${id}</td>
    </tr>
    <tr>
     <th>회원이름</th>
     <td>
     <input name="name" id="name" size="14" 
     class="input_box" value="${m.name}"/> 
     
	  </td>
    </tr>
     <tr>
     <th>e-mail</th>
     <td>
     <input name="email" id="email" size="14" 
     class="input_box" value="${m.email}" />
     @ <input type="text" name="email_domain" id="email_domain" style="width: 100px;" readonly>  
     <select name="mail_list" id="mail_list" style="" onchange="domain_list();">
      <option value="direct">직접입력</option>
      <option value="naver.com">네이버</option>
      <option value="daum.net">다음</option>
      <option value="google.com">구글</option>
	  <option value="nate.com">네이트</option>
	  </select>
     <tr>
     <th>성별</th>
     <td>${m.gender}</td>
    </tr>
    
     <tr>
     <th>생년월일</th>
     <td>${m.birth}</td>
    </tr>
	<colgroup>
		<col style="width:20%"><col>
	</colgroup>
	<tbody>
	<tr>
	<th>우편번호</th>
	<td>
	<input type="hidden" id="confmKey" name="confmKey" value=""  >
	<input type="text" id="zipNo" name="zipNo" readonly style="width:100px" value="${m.zipNo}">
	<input type="button"  value="주소검색" onclick="goPopup();">
	</td>
	</tr>
	<tr>
	<th>도로명주소</th>
	<td><input type="text" id="roadAddrPart1" name="roadAddrPart1" style="width:85%" value="${m.roadAddrPart1}"></td>
	</tr>
	<tr>
	<th>상세주소</th>
	<td>
	<input type="text" id="addrDetail" name="addrDetail" style="width:40%" value="${m.addrDetail}">
	<input type="text" id="roadAddrPart2" name="roadAddrPart2" style="width:40%" value="${m.roadAddrPart2}">
	</td>
	</tr>
	<tr><td colspan="2"><div id="mJoin_menu" style="text-align: center;">
   <input type="submit" value="수정" class="input_b" />
   <input type="reset" value="취소" class="input_b"
   onclick="window.close();" /></td></tr>
	</tbody>
   
   </table>
   
   <%-- $('#mem_pwd').focus()는 취소를 클릭했을때 비번 입력박스로 포커스 이동 --%>
   </div>
  </form>
 </div>
</body>
</html>



