<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<link rel="stylesheet" type="text/css" 
href="./resources/css/member.css" />
<script src="./resources/js/jquery.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
 function id_check(){
	
     if($.trim($("#name").val())==""){
    	 alert("회원이름을 입력하세요!");
    	 $("#name").val("").focus();
    	 return false;
     }	 
     if($.trim($("#email").val())==""){
    	 alert("회원이메일을 입력하세요!");
    	 $("#email").val("").focus();
    	 return false;
 }
     
 }
   
</script>
</head>
<body>
<form method="post" action="id_find_ok" onsubmit="return id_check();" name="form">
<div class="row">
<div class="col-md-10 inputbb">
<div class="form-group">
<div class="input-group mb-2 mr-sm-2 mb-sm-0">
<input type="text" name="name" id ="name" placeholder="이름" required autofocus>
</div>
</div>
</div>
</div>

<div class ="row">
<div class="col-md-10 inputbb">
<div class="form-group">
<div class="input-group mb-2 mr-sm-2-mb-sm-0">
<input type="text" name="email"  id="email" placeholder="메일" > @ <input type="text" name="email_domain" id="email_domain" >
</div>
</div>
</div>

</div>



<div class = "row">
<div class= "col-mid-10 inputbb ">

  <input type="submit" value="찾기" />
   <input type="reset" value="취소" 
   onclick="window.close();" />


</div>
</div>

</form>

</body>
</html>