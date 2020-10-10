<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../include/adminHeader.jsp"></jsp:include>
<%@ page import="org.pub.util.*"%>
<script>
function AddBook(){
	$.ajax({
		url:'Load_UI',
		type:'post',
		success:function(result){
			if(result=='OK'){
				alert('전자책이 정상적으로 등록이됨.');
			}
		}
	});
};
function delBook(obj){
	$parent = $(obj).parents('.book_tr');
	var eno=$($parent.find('.e_no')).val();
	$.ajax({
		url:'delBook',
		type:'post',
		data:eno,
		success:function(result){
			if(result=='OK'){
				alert('전자책이 정삭적으로 삭제됨.');
			}
		}
	});
}
function read(eno){
	window.open("/read?e_no="+eno,"뷰어","width=1200px,height=800px"+
	 ",scrollbars=no");
}
</script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>전자책 등록</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">전자책 등록</li>
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
				<h3 class="card-title">전자책</h3>

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
			<div class="card-body">
				<div class="form-control-inline">
					<form role="form" class="form-inline-lg">
						<div class="input-group">
							<div class="input-group-prepend">
								<select name="searchCondition" class="form-control">
									<option value="title"
										<c:if test="${searchCondition=='title'}">${'selected'}</c:if>>제목</option>
									<option value="author"
										<c:if test="${searchCondition=='author'}">${'selected'}</c:if>>저자</option>
									<option value="publisher"
										<c:if test="${searchCondition=='publisher'}">${'selected'}</c:if>>출판사</option>
								</select>
							</div>
							<input class="form-control" type="text" aria-label="Search"
								name="searchKeyword" id="searchKeyword"
								placeholder="검색어를 입력해 주세요" value="${searchKeyword}">
							<div class="input-group-append">
								<input class="btn btn-block btn-outline-success" value="검색"
									type="submit">
							</div>
						</div>
					</form>
				</div>

				<br>
				<br>
				<button type="button" class="btn btn-secondary btn-sm float-right"
					onclick="AddBook()">전자책 등록</button>
				<table class="table table-striped projects">
					<thead>
						<tr>
							<th style="width: 1%">#</th>
							<th style="width: 30%">제목</th>
							<th style="width: 20%">저자</th>
							<th style="width: 13%">출판사</th>
							<th style="width: 10%">출판일</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty elist}">
							<c:forEach var="eb" items="${elist}">
								<tr class="book_tr">
									<td class="e_no">${eb.e_no}</td>
									<td><a><c:if test="${fn:length(eb.title)>16 }">${fn:substring(eb.title,0,16)}...</c:if> 
									<c:if test="${fn:length(eb.title)<16}">${eb.title}</c:if>
									<br />
									</a></td>
									<td><c:if test="${fn:length(eb.author)>12 }">${fn:substring(eb.author,0,12)}...</c:if> 
									<c:if test="${fn:length(eb.author)<12}">${eb.author}</c:if>
									</td>
									<td>${eb.publisher}</td>
									<td>${eb.publication_year}</td>
									<td class="project-actions text-right">
									<button type="button"
										class="btn btn-primary btn-sm" onclick="read(${eb.e_no});"> <i
											class="fas fa-folder"> </i> View
									</button> <a class="btn btn-info btn-sm" href="#"> <i
											class="fas fa-pencil-alt"> </i> Edit
									</a> <a class="btn btn-danger btn-sm"
										onclick="delBook(this)" style="color:#fff;"> <i class="fas fa-trash"> </i>
											Delete
									</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				<%--페이징 즉 쪽나누기 추가 --%>
  <div class="btn-group float-right">
    <%-- 검색전 페이징 --%>
<c:if test="${(empty searchCondition) && (empty searchKeyword)}">    
    <c:if test="${page<=1}">
    <button type="button" class="btn btn-default"><i class="fas fa-chevron-left"></i></button>
     
    </c:if>
    <c:if test="${page>1}">
     <a href="admin_ebook_reg?page=${page-1}"><button type="button" class="btn btn-default"><i class="fas fa-chevron-left"></i></button></a>
    </c:if>
    
    <%--현재 쪽번호 출력--%>
    <c:forEach var="a" begin="${startpage}" end="${endpage}"
    step="1">
     <c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%>
      <button type="button" class="btn btn-default">${a}</button>
     </c:if>
     <c:if test="${a != page}"><%--현재 페이지가 선택되지 않았
     다면 --%>
     <a href="admin_ebook_reg?page=${a}"><button type="button" class="btn btn-default">${a}</button></a>
     </c:if>
    </c:forEach>
    
    <c:if test="${page >= maxpage}">
    <button type="button" class="btn btn-default"><i class="fas fa-chevron-right"></i></button>
    </c:if>
    <c:if test="${page<maxpage}">
    <a href="admin_ebook_reg?page=${page+1}"><button type="button" class="btn btn-default"><i class="fas fa-chevron-right"></i></button></a>
    </c:if>
</c:if>

<%-- 검색후 페이징 --%>
 <c:if test="${(!empty searchCondition) || (!empty find_name)}">    
    <c:if test="${page<=1}">
     <button type="button" class="btn btn-default"><i class="fas fa-chevron-left"></i></button>
    </c:if>
    <c:if test="${page>1}">
     <a href="admin_ebook_reg?page=${page-1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"><button type="button" class="btn btn-default"><i class="fas fa-chevron-left"></i></button></a>&nbsp;
    </c:if>
    
    <%--현재 쪽번호 출력--%>
    <c:forEach var="a" begin="${startpage}" end="${endpage}"
    step="1">
     <c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%>
      <button type="button" class="btn btn-default">${a}</button>
     </c:if>
     <c:if test="${a != page}"><%--현재 페이지가 선택되지 않았
     다면 --%>
     <a href="admin_ebook_reg?page=${a}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"><button type="button" class="btn btn-default">${a}</button></a>
     </c:if>
    </c:forEach>
    
    <c:if test="${page >= maxpage}">
    <button type="button" class="btn btn-default"><i class="fas fa-chevron-right"></i></button>
    </c:if>
    <c:if test="${page<maxpage}">
    <a href="admin_ebook_reg?page=${page+1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"><button type="button" class="btn btn-default"><i class="fas fa-chevron-right"></i></button></a>
    </c:if>
</c:if>   
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