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
					<div class="card">
					<div class="card-header">
					<h3 class="card-title">대출/반납자 정보</h3>
					</div>
						<div class="card-body">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>로그인 ID</th>
										<td>${mem.id}</td>
									</tr>
									<tr>
										<th>이름</th>
										<td>${mem.name}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card">
					<div class="card-header">
					<h3 class="card-title">전자책 정보</h3>
					</div>
						<div class="card-body">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>ISBN</th>
										<td><c:if test="${!empty elist}">${ebook.isbn}</c:if></td>
									</tr>
									<tr>
										<th>자료명</th>
										<td><c:if test="${!empty elist}">${ebook.title}</c:if></td>
									</tr>
									<tr>
									<th>저자</th>
									<td><c:if test="${!empty elist}">${ebook.author}</c:if></td>
									</tr>
									<tr>
									<th>자료 상태</th>
									<td><c:if test="${!empty lolist}">대출중</c:if></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				</div>
				<div class="card">
				<div class="card-header">
					<h3 class="card-title">대출도서목록</h3>
					</div>
					<div class="card-body">
						<table class="table table-striped projects">
							<thead>
								<tr>
									<th style="width: 5%">NO</th>
									<th style="width: 20%">전자책 제목</th>
									<th style="width: 20%">출판사</th>
									<th style="width: 20%">대출일</th>
									<th style="width: 20%">반납예정일</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${lolist != null && elist != null}">
							<c:forEach var="e" items="${elist}" varStatus="status">
							<tr>
									<td>${e.e_no}</td>
									<td><a>${e.title}</a></td>
									<td>${e.publisher}</td>
									<td>${lolist[status.index].loan_date}</td>
									<td>${lolist[status.index].loan_date}</td>
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
			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.card -->

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<jsp:include page="../include/adminFooter.jsp"></jsp:include>