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
					<h1>공지사항관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">공지사항관리</li>
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
				<h3 class="card-title">공지사항</h3>

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
			<div class="form-control-inline">
				<form role="form" class="form-inline-lg">
					<div class="input-group">
					<div class="input-group-prepend">
					<select name="find_field" class="form-control">
								<option value="gongji_title"
									<c:if test="${find_field=='gongji_title'}">${'selected'}</c:if>>제목</option>
								<option value="gongji_cont"
									<c:if test="${find_field=='gongji_cont'}">${'selected'}</c:if>>내용</option>
							</select>
						</div>
						<input class="form-control" type="text" aria-label="Search" name="find_name"
								id="find_name" placeholder="검색어를 입력해 주세요" value="${find_name}">
						<div class="input-group-append">
							<input class="btn btn-block btn-outline-success" value="검색" type="submit">
						</div>
					</div>
				</form>
				</div>
				<br><br>
				<table class="table table-striped projects">
					<thead>
						<tr>
							<th style="width: 5%">NO</th>
							<th style="width: 30%">제목</th>
							<th style="width: 10%">작성자</th>
							<th style="width: 20%">등록일</th>
							<th style="width: 10%">조회</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty glist}">
							<c:forEach var="g" items="${glist}">
								<tr>
									<td>${g.gongji_no}</td>
									<td><a> ${g.gongji_title} </a></td>
									<td>${g.gongji_name}</td>
									<td>${g.gongji_date}</td>
									<td>${g.gongji_hit}</td>
									<td class="project-actions text-right"><a
										class="btn btn-primary btn-sm"
										href="/admin/admin_gongji_cont?no=${g.gongji_no}&state=cont"> <i
											class="fas fa-folder"> </i> View
									</a> <a class="btn btn-info btn-sm"
										href="/admin/admin_gongji_cont?no=${g.gongji_no}&state=edit"> <i
											class="fas fa-pencil-alt"> </i> Edit
									</a> <a class="btn btn-danger btn-sm"
										onclick="if(confirm('정말로 삭제하시겠습니까?')==true){
                        	  location='/admin/admin_gongji_del?no=${g.gongji_no}&page=${page}';
                        	  }else {return ;}" style="color:#fff;">
											<i class="fas fa-trash"> </i> Delete
									</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				
				<%--페이징 즉 쪽나누기 추가 --%>
  <div class="btn-group float-right">
    <%-- 검색전 페이징 --%>
<c:if test="${(empty find_field) && (empty find_name)}">    
    <c:if test="${page<=1}">
    <button type="button" class="btn btn-default"><i class="fas fa-chevron-left"></i></button>
     
    </c:if>
    <c:if test="${page>1}">
     <a href="admin_bbs_list?page=${page-1}"><button type="button" class="btn btn-default"><i class="fas fa-chevron-left"></i></button></a>
    </c:if>
    
    <%--현재 쪽번호 출력--%>
    <c:forEach var="a" begin="${startpage}" end="${endpage}"
    step="1">
     <c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%>
      <button type="button" class="btn btn-default">${a}</button>
     </c:if>
     <c:if test="${a != page}"><%--현재 페이지가 선택되지 않았
     다면 --%>
     <a href="admin_bbs_list?page=${a}"><button type="button" class="btn btn-default">${a}</button></a>
     </c:if>
    </c:forEach>
    
    <c:if test="${page >= maxpage}">
    <button type="button" class="btn btn-default"><i class="fas fa-chevron-right"></i></button>
    </c:if>
    <c:if test="${page<maxpage}">
    <a href="admin_bbs_list?page=${page+1}"><button type="button" class="btn btn-default"><i class="fas fa-chevron-right"></i></button></a>
    </c:if>
</c:if>

<%-- 검색후 페이징 --%>
 <c:if test="${(!empty find_field) || (!empty find_name)}">    
    <c:if test="${page<=1}">
     <button type="button" class="btn btn-default"><i class="fas fa-chevron-left"></i></button>
    </c:if>
    <c:if test="${page>1}">
     <a href="admin_bbs_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}"><button type="button" class="btn btn-default"><i class="fas fa-chevron-left"></i></button></a>&nbsp;
    </c:if>
    
    <%--현재 쪽번호 출력--%>
    <c:forEach var="a" begin="${startpage}" end="${endpage}"
    step="1">
     <c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%>
      <button type="button" class="btn btn-default">${a}</button>
     </c:if>
     <c:if test="${a != page}"><%--현재 페이지가 선택되지 않았
     다면 --%>
     <a href="admin_bbs_list?page=${a}&find_field=${find_field}&find_name=${find_name}"><button type="button" class="btn btn-default">${a}</button></a>
     </c:if>
    </c:forEach>
    
    <c:if test="${page >= maxpage}">
    <button type="button" class="btn btn-default"><i class="fas fa-chevron-right"></i></button>
    </c:if>
    <c:if test="${page<maxpage}">
    <a href="admin_bbs_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}"><button type="button" class="btn btn-default"><i class="fas fa-chevron-right"></i></button></a>
    </c:if>
</c:if>   
  </div>
			</div>
			<!-- /.card-body -->

			<div class="card-footer">
				<button type="button" class="btn btn-secondary btn-sm float-right"
					onclick="location='admin_gongji_write';">글쓰기</button>
			</div>
		</div>
		<!-- /.card -->

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<jsp:include page="../include/adminFooter.jsp"></jsp:include>