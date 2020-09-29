<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include/adminHeader.jsp"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>이용자등록</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">이용자등록</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">

				<!-- Default box -->
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">이용자</h3>

						<div class="card-tools">
							<button type="button" class="btn btn-tool"
								data-card-widget="collapse" title="Collapse">
								<i class="fas fa-minus"></i>
							</button>
							<button type="button" class="btn btn-tool"
								data-card-widget="remove" title="Remove">
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
					<form role="form" name="form" id="form" method="post" action="/admin_member_reg_ok">
						<div class="card-body">
						
						<div class="form-group row">
						<label for="id" class="col-sm-2 col-form-label">아이디</label>
						<div class="col-sm-10">
						<input type="text" class="form-control" id="id" name="id" placeholder="id">
						<!-- <div class="input-group">
						<span class="input-group-append">
                    <input type="button" class="form-control" value="아이디 중복체크" onclick="goPopup();">
                  </span>
						</div> -->
						</div>
						</div>
						
						<div class="form-group row">
						<label for="pw" class="col-sm-2 col-form-label">비밀번호</label>
						<div class="col-sm-10">
						<input type="password" class="form-control" id="pw" name="pw" placeholder="password">
						</div>
						</div>
						
						<div class="form-group row">
						<label for="name" class="col-sm-2 col-form-label">이름</label>
						<div class="col-sm-10">
						<input type="text" class="form-control" name="name" id="name" placeholder="name">
						</div>
						</div>
						
						<div class="form-group row">
						<label for="gender" class="col-sm-2 col-form-label">성별</label>
						<div class="col-sm-10">
						<div class="icheck-primary d-inline">
                          <input type="radio" id="male" name="gender" value="남">
                          
                          <label for="male">남성</label>
                        </div>
                        &nbsp;
                        <div class="icheck-primary d-inline">
                          <input type="radio" id="female" name="gender" value="여">
                          <label for="female">여성</label>
                        </div>
						</div>
						</div>
						
						<div class="form-group row">
						<label for="birth" class="col-sm-2 col-form-label">생년월일</label>
						<div class="col-sm-10">
						<input type="text" class="form-control" name="birth" id="birth" placeholder="ex)970101">
						</div>
						</div>
						
						<div class="form-group row">
						<label for="phone" class="col-sm-2 col-form-label">휴대전화</label>
						<div class="form-inline col-sm-10">
						<select class="form-control" id="mem_phone01" name="mem_phone01">
                        <option value="010">010</option>
						<option value="011">011</option>
						<option value="012">012</option>
						<option value="013">013</option>
						<option value="014">014</option>
						<option value="015">015</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
                        </select>
                		&nbsp;-&nbsp;
                		<input class="form-control col-1" type="text" id="mem_phone02" name="mem_phone02" style="width: 50px"> &nbsp;-&nbsp; 
                		<input class="form-control col-1" type="text" id="mem_phone03" name="mem_phone03" style="width: 50px">
                        
						</div>
						</div>
						
						<div class="form-group row">
                    <label for="email" class="col-sm-2 col-form-label">이메일</label>
                    <div class="form-inline col-sm-10">
                      <input type="text" class="form-control" name="email" id="email" placeholder="Email"> @ 
					  <input type="text" class="form-control" name="emailDomain" id="emailDomain" >&nbsp;
                      <select class="form-control" name="select_box" id="select_box" style="" onchange="select_();">
										<option value="direct">직접입력</option>
										<option value="naver.com">네이버</option>
										<option value="daum.net">다음</option>
										<option value="google.com">구글</option>
										<option value="nate.com">네이트</option>
									</select>
                    </div>
                  </div>
                  
				<div class="form-group row">
				<label for="zipNo" class="col-sm-2 col-form-label">우편번호</label>
				<input type="hidden" id="confmKey" name="confmKey" value=""  >
				<div class="col-sm-10">
				<div class="input-group ">
                  <input type="text" id="zipNo" name="zipNo" readonly class="form-control">
                  <span class="input-group-append">
                    <input type="button" class="form-control" value="주소검색" onclick="goPopup();">
                  </span>
                </div>
				</div>
				</div>
                
                <div class="form-group row">
                <label for="roadAddrPart1" class="col-sm-2 col-form-label">도로명 주소</label>
                <div class="col-sm-10">
                <input type="text" class="form-control" id="roadAddrPart1" name="roadAddrPart1">
                </div>
                </div>  
				
				<div class="form-group row">
                <label for="roadAddrPart2" class="col-sm-2 col-form-label">상세 주소</label>
                <div class="form-inline col-sm-10">
                <input type="text" class="form-control col-sm-5" id="addrDetail" name="addrDetail" value=""> &nbsp;&nbsp;
                <input type="text" class="form-control col-sm-5" id="roadAddrPart2" name="roadAddrPart2" value="">
                </div>
                </div> 		
						</div>
					<!-- /.card-body -->
					<div class="card-footer">
						<button type="submit" class="btn btn-secondary btn-sm float-right">등록</button>
					</div>
					</form>
				</div>
				<!-- /.card -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="../include/adminFooter.jsp"></jsp:include>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="<c:url value='/bootstrap/plugins/jquery/jquery.min.js' />"></script>
	<!-- Bootstrap 4 -->
	<script
		src="<c:url value='/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<!-- AdminLTE App -->
	<script src="<c:url value='/bootstrap/dist/js/adminlte.min.js' />"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<c:url value='/bootstrap/dist/js/demo.js' />"></script>
</body>
</html>