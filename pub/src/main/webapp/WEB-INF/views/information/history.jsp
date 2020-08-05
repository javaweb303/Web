<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
/*헤더 색*/
#head{background-color: #8f2e41}/*색변경*/
#gnb li ul{border-top: 7px solid #d34451;}/*색변경*/
/*내용*/
#content{ height: 100%;}
#content .container{margin: 0 40px;height: 100%; padding-bottom: 80px;}

/*테마 이름*/
#content .content_head{height: 200px; background-color: #c23f59;}/*색변경*/
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

/*연혁*/
#yearlist{}
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
			<li><a href="/controller">Home</a> ></li>
		</ul>
	</div>
	<div class="container">
		
		<!-- body -->
		<div class="cont_wrap">
			
			<!-- body 좌측-->
			<div class="cont_lnb">
				<h2>도서관안내</h2>
				<ul class="cont_lnb_sub">
					<li><a href="/controller/history">도서관 소개</a></li>
					<li><a href="/controller/guide">도서관 이용</a></li>
					<li><a href="/controller/status">도서관 현황</a></li>
					<li><a href="/controller/location">오시는 길</a></li>
				</ul>
			</div>
			<!-- body 좌측 끝-->
			
			<!-- body 우측 -->
			<div class="cont_box">	
				<h2>도서관 소개</h2>
				<div>
					<h3 class="title">문아공간 도서관은?</h3><br>
					<p class="mt20">도서관은 누구나 자유롭게 이용할 수 있고, 필요한 지식과 정보를 얻을 수 있도록 도와줍니다.
						시민들은 도서관에서 습득한 새로운 지식과 기술을 활용하여 궁금증과 과제를 해결합니다. 또 좋은 책을 통해 마음을
						풍요롭게 가꾸고 미래의 꿈을 향해 한걸음씩 나아가 갑니다. 
					</p><br>	
					<p class="">문아공간은 지역사회에서 공공도서관의 기능과 가치를 중요하게 생각하고 지속적으로 도서관 확충과 새로운 도서관
						서비스 지원을 위해 노력해 오고 있습니다. 문아공간은 도서관 서비스 증진을 지원하고 책 읽는 문화를 확산시켜 나가기
						위해 만든 도서관입니다. 도서관간 협력을 기반으로 디지털 정보기술을 활용하여 보다 편리하게 도서관 소장 자료를 이용할
						수 있도록 지원하고, 관련한 지식 정보 자원을 수집하여 보존하고 있습니다.
					</p><br>
					<p>도서관에서 활용할 수 있는 독서 교육 프로그램을 만들어 보급하고 도서관 사서들의 역량을 증진시키기 도서관을
						통해 행복한 미래의 꿈을 키워나갈 수 있도록 응원하는 문아공간이 되기 위해 노력하겠습니다.
					</p>
				</div>
				<br><br>
				<!-- 연혁 -->
				<div class="historyList">
				<h2>연혁</h2>
				<ul id="yearlist">
				<h4>2020년</h4>
				<li><strong>6월 10일</strong>&nbsp;조원 프로젝트 아이디어 회의 시작</li>
				<li><strong>6월 15일</strong>&nbsp;프로젝트 주제 도서관 최종 결정</li>
				<li><strong>6월 17일</strong>&nbsp;프로젝트 UI 기획 회의 시작</li>
				<li><strong>6월 24일</strong>&nbsp;로고 및 도서관 이름 “문아 공간” 결정</li>
				<li><strong>6월 27일</strong>&nbsp;사용자 행위 순서 흐름도 설정</li>
				<li><strong>7월 30일</strong>&nbsp;각 페이지 기능 구조화 설정</li>
				<li><strong>7월 05일</strong>&nbsp;로고 및 도서관 이름 “PuB”으로 명칭 변경 및 최종결정</li>
				<li><strong>7월 09일</strong>&nbsp;발표 ppt 제작 및 대본 설정</li>
				<li><strong>7월 16일</strong>&nbsp;각 조별 프로젝트 UI구상 발표</li>
				<li><strong>7월 20일</strong>&nbsp;기획 UI 토대로 UI작업 시작</li>
				<li><strong>7월 25일</strong>&nbsp;UI작업 중간검토 및 회의</li>
				<li><strong>7월 29일</strong>&nbsp;UI 수정 및 검토</li>
				<li><strong>8월 08일</strong>&nbsp;UI 발표 ppt 제작 및 대본 설정 </li>
				<li><strong>8월 16일</strong>&nbsp;각 조별 프로젝트 UI 발표 </li>
				</ul>
				</div>
				<!-- 연혁 끝 -->

			</div>
			<!-- body 우측 끝 -->
			
		</div>
		<!-- body 끝 -->
		
	</div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>