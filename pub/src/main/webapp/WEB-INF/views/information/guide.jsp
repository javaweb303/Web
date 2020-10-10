<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
/*헤더 색*/
#head{background-color: #D4AF4A}/*색변경*/
#gnb li ul{border-top: 7px solid #d34451;}/*색변경*/
/*내용*/
#content{ height: 100%;}
#content .container{margin: 0 40px;height: 100%; padding-bottom: 80px;}

/*테마 이름*/
#content .content_head{height: 200px; background-color: #EDC453;}/*색변경*/
#content .content_head h2{padding: 75px 0 70px; text-align: center; color:white;}
/*로컬주소*/
#content .location{margin: 0 auto 23px; width: 100%;}
#content .location ul li{float: right; list-style: none; right: 4%;}
/*카테고리*/
#content .cont_wrap{position: relative;}
#content .container .cont_lnb {position:absolute; width: 250px; height:100%; background-color:#fcfcfc; padding: 0 10px; padding-bottom: 30px;}
#content .container .cont_lnb h2{padding: 35px 10px 20px; border-bottom: 1px solid gray;}
#content .container .cont_lnb .cont_lnb_sub li{padding: 15px 0; border-bottom: 1px solid #e6e6e6;}
#content .container .cont_lnb .cont_lnb_sub a{color:#2f2f2f; font-weight: 500;}

/*메인 내용*/
#content .container .cont_box{margin-left:300px;width:auto;}
#content .container .cont_box h2{padding: 35px 10px 20px; border-bottom: 1px solid gray; margin-bottom: 30px;}
.cont_box th, .cont_box td {padding: 10px 9px;border-bottom: 1px solid #d5d5d5;border-left: 1px solid #d5d5d5;}
.cont_box table{border-top: 2px solid #666;border-spacing: 0; width:100%;}
.cont_box .tablehead{background-color: #f8f8f8}
</style>

<div id="content">
	<div class="content_head">
		<h2>도서관안내</h2>
	</div>
	<!-- 이거 바꾸고 -->
	<div class="location">
		<!-- 이것도 이건 상단에 home>열린공간 >오시는길 이거 표시하는 부분? -->
		<ul class="">
			<li>도서관 소개</li>
			<li>도서관안내 ></li>
			<li><a href="/">Home</a> ></li>
		</ul>
	</div>
	<div class="container">
		
		<!-- body -->
		<div class="cont_wrap">
			
			<!-- body 좌측-->
			<div class="cont_lnb">
				<h2>도서관안내</h2>
				<ul class="cont_lnb_sub">
					<li><a href="/history">도서관 소개</a></li>
					<li><a href="/guide">도서관 이용</a></li>
					<li><a href="/location">오시는 길</a></li>
				</ul>
			</div>
			<!-- body 좌측 끝-->
			
			<!-- body 우측 -->
			<div class="cont_box">	
				<h2>도서관 이용</h2>
				<ul>
				<li style="margin: 20px 0 20px 10px;"><h3>전자 도서관 이용</h3></li>
				<table>
				<tr class="tablehead">
				<th>구분</th>
				<th>내용</th>
				</tr>
				<tr>
				<th>대상</th>
				<td><ul><li>회원</li></ul></td>
				</tr>
				<tr>
				<th>대출방법</th>
				<td><ul><li>전자도서관에서 자료검색후 원하는 책을 클릭후 대출버튼을 눌르면 대출가능.</li></ul></td>
				</tr>
				<tr>
				<th>권수/기간</th>
				<td><ul><li>한 사람당 5권/2주(14일)</li></ul></td>
				</tr>
				<tr>
				<th>반납 방법</th>
				<td><ul><li>로그인 후 내 서재로 이동후 반납을 원하는 책에 있는 반납 버튼을 눌르면 반납가능</li></ul></td>
				</tr>
				<tr>
				<th>대출 제한</th>
				<td><ul><li>반납기한을 넘겨서 반납할 경우, 반납일 당일 및 연체 일수만큼 대출중지 됩니다.</li></ul></td>
				</tr>
				<tr>
				<th>유의 사항</th>
				<td><ul>
				<li>불법 복제 하면 안됩니다.</li>
				<li>저작권은 해당 출판사와 글쓴이에게 있습니다.</li>
				<li>쏼라 쏼라................................</li>
				</ul></td>
				</tr>
				</table>
				<li style="margin: 20px 0 20px 10px;"><h3>반납 연장 안내</h3></li>
				<table>
				<tr class="tablehead">
				<th>구분</th>
				<th>내용</th>
				</tr>
				<tr>
				<th>횟수 및 기간</th>
				<td><ul><li>1회 반납예정일로부터 7일 연기 가능</li></ul></td>
				</tr>
				<tr>
				<th>방법</th>
				<td><ul><li>홈페이지 내서재 > 연장하기 버튼 클릭시 반납기간 연장 가능</li></ul></td>
				</tr>
				<tr>
				<th>제한 사항</th>
				<td><ul><li>반납일이 경과했거나 반납일이 경과한 다른 연체도서가 있는 경우</li></ul></td>
				</tr>
				</table>
				<li style="margin: 20px 0 20px 10px;"><h3>연체 안내</h3>
				</li>
				<p>반납기한을 넘겨서 반납할 경우, 반납일 당일 및 연체 일수만큼 대출중지.</p>
				</ul>

			</div>
			<!-- body 우측 끝 -->
			
		</div>
		<!-- body 끝 -->
		
	</div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>