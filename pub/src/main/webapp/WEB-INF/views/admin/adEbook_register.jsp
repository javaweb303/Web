<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include/adminHeader.jsp"></jsp:include>
<%@ page import="org.pub.util.*" %>
<script>
function AddBook(){
	$.ajax({
		url:'Load_UI',
		type:'post',
		seccess:function(result){
			if(result=='OK'){
				
			}
		}
	});
};
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
						 <button type="button" class="btn btn-secondary btn-sm float-right" onclick="AddBook()">전자책 등록</button>		
						<table class="table table-striped projects">
              <thead>
                  <tr>
                      <th style="width: 1%">
                          #
                      </th>
                      <th style="width: 30%">
                          	제목
                      </th>
                      <th style="width: 20%">
                          	저자	
                      </th>
                      <th style="width: 13%">
                      
                          	출판사
                      </th>
                      <th style="width: 10%">
                          	출판일
                      </th>
                      <th>
                      </th>
                  </tr>
              </thead>
              <tbody>
              <c:if test="${!empty elist}">
              <c:forEach var="eb" items="${elist}">
              <tr>
              <td>
              	${eb.e_no}
              </td>
              <td>
              <a>
              ${eb.title}
              <br/>
              </a>
              </td>
              <td>
              ${eb.author}
              </td>
              <td>
              ${eb.publisher}
              </td>
              <td>
              ${eb.publication_year}
              </td>
              <td class="project-actions text-right">
                          <a class="btn btn-primary btn-sm" href="#">
                              <i class="fas fa-folder">
                              </i>
                              View
                          </a>
                          <a class="btn btn-info btn-sm" href="#">
                              <i class="fas fa-pencil-alt">
                              </i>
                              Edit
                          </a>
                          <a class="btn btn-danger btn-sm" href="#">
                              <i class="fas fa-trash">
                              </i>
                              Delete
                          </a>
                      </td>
              </tr>
              </c:forEach>
              </c:if>
              </tbody>
          </table>
						</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->


<jsp:include page="../include/adminFooter.jsp"></jsp:include>