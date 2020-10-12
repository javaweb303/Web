<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../include/adminHeader.jsp"></jsp:include>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>대출반납</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">대출 반납</li>
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
				<h3 class="card-title">대출 반납</h3>

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
			<div class="card-body p-0">
			
				<br>
				<div class="col-md-12 form-control-inline">
					<form role="form" class="form-inline">
						<div class="input-group has-feedback">
							<span class="fa fa-edit col-md-3 form-control-feedback left">&nbsp;입력</span>
							<input class="form-control" type="text" name="id"
								id="id" placeholder="회원 검색" value="${mem.id}"> <span
								class="input-group-btn right"><input
								class="btn btn-block btn-outline-success" value="검색"
								type="submit"></span>
						</div>

					</form>
				</div>
				<br> <br>
				<div class="row">
				<div class="col-md-6">
					<div class="card-purple">
					<div class="card-header">
					<h3 class="card-title">대출/반납자 정보</h3>
					</div>
						<div class="card-body" style="border:1px solid #6f42c1;">
							<table class="table" style="border:1px solid transparent;">
								<tbody>
									<tr>
										<td style="background-color: #AD90E1; width: 30%;">로그인 ID</td>
										<td style="border:1px solid transparent; color:#50269E;">${mem.id}</td>
									</tr>
									<tr>
										<td style="background-color: #AD90E1;">이름</td>
										<td style="border:1px solid transparent;color:#50269E;">${mem.name}</td>
									</tr>
									<tr>
									<td style="background-color: #AD90E1;">회원 상태</td>
									<td style="border:1px solid transparent;color:#50269E;"><c:if test="${mem.state==1}">가입회원</c:if>
									<c:if test="${mem.state==2}">탈퇴회원</c:if>
									<c:if test="${mem.state==5}">관리자</c:if>
									</td>
									</tr>
									<tr>
									<td style="background-color: #AD90E1;">이메일</td>
									<td style="border:1px solid transparent;color:#50269E;">${mem.email}@${mem.email_domain}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card-pink">
					<div class="card-header">
					<h3 class="card-title">전자책 정보</h3>
					</div>
						<div class="card-body" style="border:1px solid #e83e8c;">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td style="background-color: #EE88B7; width: 30%;">ISBN</td>
										<td style="border:1px solid transparent;color:#DE3182;"><c:if test="${!empty elist}">${ebook.isbn}</c:if></td>
									</tr>
									<tr>
										<td style="background-color: #EE88B7;">자료명</td>
										<td style="border:1px solid transparent;color:#DE3182;"><c:if test="${!empty elist}">
										<c:if test="${fn:length(ebook.title)>20}">${fn:substring(ebook.title,0,20)}...</c:if> 
									<c:if test="${fn:length(ebook.title)<20}">${ebook.title}</c:if>
										</c:if></td>
									</tr>
									<tr>
									<td style="background-color: #EE88B7;">저자</td>
									<td style="border:1px solid transparent;color:#DE3182;"><c:if test="${!empty elist}">${ebook.author}</c:if></td>
									</tr>
									<tr>
									<td style="background-color: #EE88B7;">출판사</td>
									<td style="border:1px solid transparent;color:#DE3182;"><c:if test="${!empty elist}">${ebook.publisher}</c:if></td>
									</tr>
									<!--  <tr>
									<td style="background-color: #EE88B7;">자료 상태</td>
									<td style="border:1px solid transparent;color:#DE3182;"><c:if test="${!empty lolist}">대출중</c:if></td>
									</tr>-->
								</tbody>
							</table>
						</div>
					</div>
				</div>
				</div>
				<br><br>
				<div class="card-info">
				<div class="card-header">
					<h3 class="card-title">대출도서목록</h3>
					</div>
					<div class="card-body" style="border: 1px solid #17A2B8;">
						<table class="table table-striped projects">
							<thead>
								<tr>
									<th style="width: 5%; color:#1495A8;">NO</th>
									<th style="width: 25%; color:#1495A8;">전자책 제목</th>
									<th style="width: 20%; color:#1495A8;">출판사</th>
									<th style="width: 20%; color:#1495A8;">대출일</th>
									<th style="width: 20%; color:#1495A8;">반납예정일</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${lolist != null && elist != null}">
							<c:forEach var="e" items="${elist}" varStatus="status">
							<tr>
									<td>${e.e_no}</td>
									<td><a><c:if test="${fn:length(e.title)>12 }">${fn:substring(e.title,0,12)}...</c:if> 
									<c:if test="${fn:length(e.title)<12}">${e.title}</c:if>
									</a></td>
									<td><c:if test="${fn:length(e.publisher)>12 }">${fn:substring(e.publisher,0,12)}...</c:if> 
									<c:if test="${fn:length(e.publisher)<12}">${e.publisher}</c:if>
									</td>
									<td>${fn:substring(lolist[status.index].loan_date,0,10)}</td>
									<td>${fn:substring(lolist[status.index].return_date,0,10)}</td>
									<td class="project-actions text-right"><a
										class="btn btn-primary btn-sm"
										onclick="if(confirm('정말로 반납할까요?')==true){
                        	  location='/admin/admin_return?e_no=${e.e_no}&id=${mem.id}';
                          }else{return ;}" style="color:#fff;"> <i
											class="fas fa-folder"> </i> 반납
									</a>
									</tr>
							</c:forEach>
							</c:if>
							</tbody>
						</table>
					</div>
					</div>
					<br><br>
					<div class="card-info">
				<div class="card-header">
					<h3 class="card-title">반납도서목록</h3>
					</div>
					<div class="card-body" style="border: 1px solid #17A2B8;">
						<table class="table table-striped projects">
							<thead>
								<tr>
									<th style="width: 5%; color:#1495A8;">NO</th>
									<th style="width: 25%; color:#1495A8;">전자책 제목</th>
									<th style="width: 20%; color:#1495A8;">출판사</th>
									<th style="width: 20%; color:#1495A8;">반납예정일</th>
									<th style="width: 20%; color:#1495A8;">반납일</th>
									<th style="width:10%; color:#1495A8;">상태</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${lolist != null && relist != null}">
							<c:forEach var="re" items="${relist}" varStatus="status">
							<tr>
									<td>${re.e_no}</td>
									<td><a><c:if test="${fn:length(re.title)>12 }">${fn:substring(re.title,0,12)}...</c:if> 
									<c:if test="${fn:length(re.title)<12}">${re.title}</c:if>
									</a></td>
									<td>${re.publisher}</td>
									<td>${fn:substring(lolist[status.index].return_date,0,10)}</td>
									<td>${fn:substring(lolist[status.index].return_date_ok,0,10)}</td>
									<td><c:if test="${lolist[status.index].state == 2}">정상 반납</c:if>
									<c:if test="${lolist[status.index].state == 3}">연체 반납</c:if>
									</td>
									</tr>
							</c:forEach>
							</c:if>
							</tbody>
						</table>
					</div>
				</div>
				</div>
			<!-- /.card-body -->
		</div>
		<!-- /.card -->

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<jsp:include page="../include/adminFooter.jsp"></jsp:include>