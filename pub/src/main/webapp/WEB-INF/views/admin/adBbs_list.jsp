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
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">공지사항</h3>

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
          <table class="table table-striped projects">
              <thead>
                  <tr>
                      <th style="width: 5%">
                          NO
                      </th>
                      <th style="width: 30%">
                          	제목
                      </th>
                      <th style="width: 10%">
                          	작성자	
                      </th>
                      <th style="width: 20%">
                      
                          	등록일
                      </th>
                      <th style="width: 10%">
                          	조회
                      </th>
                      <th>
                      </th>
                  </tr>
              </thead>
              <tbody>
              <c:if test="${!empty glist}">
              <c:forEach var="g" items="${glist}">
              <tr>
              <td>
              	${g.gongji_no}
              </td>
              <td>
              <a>
              ${g.gongji_title}
              </a>
              </td>
              <td>
              ${g.gongji_name}
              </td>
              <td>
              ${g.gongji_date}
              </td>
              <td>
              ${g.gongji_hit}
              </td>
              <td class="project-actions text-right">
                          <a class="btn btn-primary btn-sm" href="/admin_gongji_cont?no=${g.gongji_no}&state=cont">
                              <i class="fas fa-folder">
                              </i>
                              View
                          </a>
                          <a class="btn btn-info btn-sm" href="/admin_gongji_cont?no=${g.gongji_no}&state=edit">
                              <i class="fas fa-pencil-alt">
                              </i>
                              Edit
                          </a>
                          <a class="btn btn-danger btn-sm" onclick="if(confirm('정말로 삭제하시겠습니까?')==true){
                        	  location='admin_gongji_del?no=${g.gongji_no}';
                        	  }else {return ;}">
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
        
        <div class="card-footer">
        <button type="button" class="btn btn-secondary btn-sm float-right" onclick="location='admin_gongji_write';">글쓰기</button>
        </div>
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