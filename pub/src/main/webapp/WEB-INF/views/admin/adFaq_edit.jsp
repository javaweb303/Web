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
            <h1>FAQ 상세정보 수정</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">FAQ 상세정보 수정</li>
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
          <h3 class="card-title">관리자 FAQ</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>
        <form role="form" method="post" name="f" action="admin_faq_edit_ok">
        <input type="hidden" name="faqNo" value="${f.faqNo}"/>
        <div class="card-body p-0">
          <table class="table table projects">
              <tbody>
              <tr>
              <th style="background-color:#F6F6F6;">글 번호</th>
              <td>${f.faqNo}</td>
              <th style="background-color:#F6F6F6;">카테고리</th>
              <td><c:if test="${f.CId==100}">홈페이지</c:if>
              <c:if test="${f.CId==200}">전자도서관</c:if>
              <c:if test="${f.CId==300}">도서관서비스</c:if>
              <c:if test="${f.CId==400}">열린공간</c:if></td>
              </tr>
              <tr>
              <th style="background-color:#F6F6F6;">자주 묻는 질문</th>
              <td colspan="3"><input type=text name="question" id="question" value="${f.question}" style="width:500px"/></td>
              </tr>
              <tr>
              <th style="background-color:#F6F6F6;" colspan="4">답변</th>
              </tr>
              
              <tr>
              <td colspan="4"><textarea name="answer" id="answer" rows="10" cols="100">${f.answer}</textarea></td>
              </tr>
              </tbody>
          </table>
        </div>
        <div class="card-footer">
        <input type="submit" class="btn btn-primary float-right">등록</button>
        </div>
        </form>
        <!-- /.card-body -->
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
<script src="<c:url value='/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js' />"></script>
<!-- AdminLTE App -->
<script src="<c:url value='/bootstrap/dist/js/adminlte.min.js' />"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value='/bootstrap/dist/js/demo.js' />"></script>
</body>
</html>