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
            <h1>FAQ 관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">FAQ 관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">FAQ</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
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
								<option value="Question"
									<c:if test="${find_field=='Question'}">${'selected'}</c:if>>질문</option>
								<option value="Answer"
									<c:if test="${find_field=='Answer'}">${'selected'}</c:if>>답변</option>
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
                      <th style="width: 5%">
                          NO
                      </th>
                      <th style="width: 50%">
                          	질문
                      </th>
                      <th style="width: 20%">
                      
                          	카테고리
                      </th>
                      <th>
                      </th>
                  </tr>
              </thead>
              <tbody>
              <c:if test="${!empty flist}">
              <c:forEach var="f" items="${flist}">
              <tr>
              <td>
              	${f.faqNo}
              </td>
              <td>
              <a>
              ${f.question}
              </a>
              </td>
              <td>
              <c:if test="${f.CId==100}">홈페이지</c:if>
              <c:if test="${f.CId==200}">전자도서관</c:if>
              <c:if test="${f.CId==300}">도서관서비스</c:if>
              <c:if test="${f.CId==400}">열린공간</c:if>
              </td>
              <td class="project-actions text-right">
                          <a class="btn btn-primary btn-sm" href="/admin/admin_faq_cont?no=${f.faqNo}&state=cont">
                              <i class="fas fa-folder">
                              </i>
                              View
                          </a>
                          <a class="btn btn-info btn-sm" href="/admin/admin_faq_cont?no=${f.faqNo}&state=edit">
                              <i class="fas fa-pencil-alt">
                              </i>
                              Edit
                          </a>
                          <a class="btn btn-danger btn-sm" onclick="if(confirm('정말로 삭제하시겠습니까?')==true){
                        	  location='/admin/admin_faq_del?no=${f.faqNo}&page=${page}';
                        	  }else {return ;}" style="color:#fff;">
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
          <%--페이징 즉 쪽나누기 추가 --%>
  <div class="btn-group float-right">
    <%-- 검색전 페이징 --%>
<c:if test="${(empty find_field) && (empty find_name)}">    
    <c:if test="${page<=1}">
    <button type="button" class="btn btn-default"><i class="fas fa-chevron-left"></i></button>
     
    </c:if>
    <c:if test="${page>1}">
     <a href="admin_faq_list?page=${page-1}"><button type="button" class="btn btn-default"><i class="fas fa-chevron-left"></i></button></a>
    </c:if>
    
    <%--현재 쪽번호 출력--%>
    <c:forEach var="a" begin="${startpage}" end="${endpage}"
    step="1">
     <c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%>
      <button type="button" class="btn btn-default">${a}</button>
     </c:if>
     <c:if test="${a != page}"><%--현재 페이지가 선택되지 않았
     다면 --%>
     <a href="admin_faq_list?page=${a}"><button type="button" class="btn btn-default">${a}</button></a>
     </c:if>
    </c:forEach>
    
    <c:if test="${page >= maxpage}">
    <button type="button" class="btn btn-default"><i class="fas fa-chevron-right"></i></button>
    </c:if>
    <c:if test="${page<maxpage}">
    <a href="admin_faq_list?page=${page+1}"><button type="button" class="btn btn-default"><i class="fas fa-chevron-right"></i></button></a>
    </c:if>
</c:if>

<%-- 검색후 페이징 --%>
 <c:if test="${(!empty find_field) || (!empty find_name)}">    
    <c:if test="${page<=1}">
     <button type="button" class="btn btn-default"><i class="fas fa-chevron-left"></i></button>
    </c:if>
    <c:if test="${page>1}">
     <a href="admin_faq_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}"><button type="button" class="btn btn-default"><i class="fas fa-chevron-left"></i></button></a>&nbsp;
    </c:if>
    
    <%--현재 쪽번호 출력--%>
    <c:forEach var="a" begin="${startpage}" end="${endpage}"
    step="1">
     <c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%>
      <button type="button" class="btn btn-default">${a}</button>
     </c:if>
     <c:if test="${a != page}"><%--현재 페이지가 선택되지 않았
     다면 --%>
     <a href="admin_faq_list?page=${a}&find_field=${find_field}&find_name=${find_name}"><button type="button" class="btn btn-default">${a}</button></a>
     </c:if>
    </c:forEach>
    
    <c:if test="${page >= maxpage}">
    <button type="button" class="btn btn-default"><i class="fas fa-chevron-right"></i></button>
    </c:if>
    <c:if test="${page<maxpage}">
    <a href="admin_faq_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}"><button type="button" class="btn btn-default"><i class="fas fa-chevron-right"></i></button></a>
    </c:if>
</c:if>   
  </div>
        </div>
        <!-- /.card-body -->
        
        <div class="card-footer">
        <button type="button" class="btn btn-secondary btn-sm float-right" onclick="location='admin_faq_write';">글쓰기</button>
        </div>
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <jsp:include page="../include/adminFooter.jsp"></jsp:include>