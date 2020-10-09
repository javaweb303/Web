<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" 
            uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>

<script src="./resources/js/jquery.js"></script>


<script>
 //아이디 찾기
 function id_find(){
	 $url="id_find";//매핑주소
	 window.open($url,"아이디검색","width=400px,height=300px"+
			 ",scrollbars=yes");
	 //open(공지창경로,공지창이름,속성) 메서드로 폭이 300픽셀,
	 //높이가 300픽셀,스크롤바가 생성되는 새로운 공지창을 만든다.
 }
</script>



 <script>
 //비번찾기
 function pwd_find(){
	 $url="pwd_find";//매핑주소
	 window.open($url,"비번검색","width=450px,height=300px"+
			 ",scrollbars=yes");
	 //open(공지창경로,공지창이름,속성) 메서드로 폭이 300픽셀,
	 //높이가 300픽셀,스크롤바가 생성되는 새로운 공지창을 만든다.
 }
</script>


</head>
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
</style>
<div id="content">
   <div class="content_head"><h2>로그인</h2></div><!-- 이거 바꾸고 -->
   <div class="location"><!-- 이것도 이건 상단에 home>열린공간 >오시는길 이거 표시하는 부분? -->
   <ul class="">
   <li>로그인 </li>
   <li><a href="/">Home</a> > </li>
   </ul>
   </div>
   <div class="container" style="border: 1px solid gray; border-radius: 5px; margin: 15px;"><!-- 몸체 -->
      <div class="left_box" style="text-align: center; width: 48%; height:500px; display: inline-block; border-right: 1px solid gray; margin: 10px 0 10px 0; "><!--좌측-->
         <div class="loginbox" style="margin-top: 120px;">
         	<h2>로그인을 하세요.</h2><br><br><br>
					<form method="post" action="/login_ok" ><!-- 메인으로 나올라구씀 -->
						<div id="inputbox">
							<input type="text" name="id" class="input_row" placeholder="아이디">
							<br> <input type="password" name="pwd" class="input_row"
								placeholder="비밀번호"> <br> <input type="submit"
								value="로그인" class="submit input_row" />
								<br><br>
								
								<input type="button" value="아이디 찾기" onclick="id_find();"/> /
								<input type="button" value="비밀번호 찾기"  	
								onclick="pwd_find();" />
						</div>
					</form>
			</div>
		</div>
         <div class="right_box" style="width: 50%; float: right;"><!-- 우측공간 -->
         	<div style="height: 300px; text-align: center;border-bottom: 1px solid gray;">
         		<h3 style="margin-top: 50px; margin-bottom: 30px;">처음 방문이세요?</h3>
         		<p><img alt="" src="/resources/images/memberBg.png"></p><br>
         		<button style="height:50px; width: 150px;" onclick="location.href='/join';">회원가입</button>
         	</div>
         	<div style="">
         	<div style="margin-top: 75px; padding: 0 15px 0 15px;">
         	<p style="padding:0 0 0 27px; background: url(/resources/images/memberArrow.png) no-repeat 0 2px;">회원으로 가입하시면 전자도서관의 다양한 서비스를 편리하게 이용하실 수 있습니다.</p>
         	</div>
         	</div>
         </div><!-- 여기까지가 몸체우측 -->
      </div>
   </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>