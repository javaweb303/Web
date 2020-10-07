<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기 결과</title>
<link rel="stylesheet" type="text/css" 
href="./resources/css/member.css" />
</head>
<body>
 <div id="pOK_wrap">
  <h2 class="pOK_title">아이디검색 결과</h2>
  <table id="pOK_t">
   <tr>
    <th>아이디</th>
    <td>${id}</td>
   </tr>
 
  </table> 
  <div id="pOK_menu">
  <input type="button" value="닫기" onclick="self.close();"/>
  <%-- 자바스크립트에서 self.close();는 내자신 공지창을 닫는
  다. --%>  
  </div>
 </div>
</body>
</html>

























