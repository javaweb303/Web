<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" type="text/css"
href="./resources/css/member.css" />
<script src="./resources/js/member.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


</head>
<body>
 <div id="mDel_wrap">
  <form method="post" action="member_del_ok"
  onsubmit="return del_check();">
   <table id="mDel_t">
    <tr>
     <th>회원아이디</th>
     <td>${id}</td>
    </tr>
    <tr>
     <th>회원이름</th> <td>${m.name}</td>    
    </tr>
    <tr>
     <th>비밀번호</th>
     <td><input type="password" name="del_pwd" id="del_pwd"
     size="34" /></td>    
    </tr>
    <tr>
     <th>탈퇴사유</th>
     <td><textarea name="del_cont" id="del_cont"
     rows="9" cols="36"></textarea></td>    
    </tr>
   </table>  
   <div id="mDel_menu" style="text-align: center;">
   <input type="submit" value="탈퇴" />
   <input type="reset" value="취소" 
   onclick="window.close();" />
   </div>
  </form>
 </div>
</body>
</html>





















