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
            <h1>이용자 상세정보</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">이용자 상세정보</li>
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
          <h3 class="card-title">회원정보</h3>

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
          <table class="table table projects">
              <tbody>
              <tr>
              <th style="background-color:#F6F6F6;">회원 상태</th>
              <td><span>
              <c:if test="${m.state == 1}">가입회원</c:if>
              <c:if test="${m.state == 2}">탈퇴회원</c:if>
              </span></td>
              <th style="background-color:#F6F6F6;">회원가입일</th>
              <td>${fn:substring(m.regdate,0,10)}</td>
              </tr>
              <tr>
              <th style="background-color:#F6F6F6;">아이디</th>
              <td>${m.id}</td>
              <th style="background-color:#F6F6F6;">이름</th>
              <td>${m.name}</td>
              </tr>
              <tr>
              <th style="background-color:#F6F6F6;">생년월일</th>
              <td>${m.birth}</td>
              <th style="background-color:#F6F6F6;">성별</th>
              <td>${m.gender}</td>
              </tr>
              <tr>
              <th style="background-color:#F6F6F6;">이메일</th>
              <td>${m.email}@${m.emailDomain}</td>
              <th style="background-color:#F6F6F6;">핸드폰 번호</th>
              <td>${m.mem_phone01}-${m.mem_phone02}-${m.mem_phone03}</td>
              </tr>
              <tr>
              <th style="background-color: #F6F6F6;">주소</th>
              <td colspan="3">[${m.zipNo}] &nbsp; ${m.roadAddrPart1} &nbsp; ${m.roadAddrPart2} ${m.addrDetail} </td>
              </tr>
              <!-- 
                  <tr>
                      <td>
                          #
                      </td>
                      <td>
                          <a>
                              AdminLTE v3
                          </a>
                          <br/>
                          <small>
                              Created 01.01.2019
                          </small>
                      </td>
                      <td>
                          <ul class="list-inline">
                              <li class="list-inline-item">
                                  <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar.png">
                              </li>
                              <li class="list-inline-item">
                                  <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar2.png">
                              </li>
                              <li class="list-inline-item">
                                  <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar3.png">
                              </li>
                              <li class="list-inline-item">
                                  <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar4.png">
                              </li>
                          </ul>
                      </td>
                      <td class="project_progress">
                          <div class="progress progress-sm">
                              <div class="progress-bar bg-green" role="progressbar" aria-valuenow="57" aria-valuemin="0" aria-valuemax="100" style="width: 57%">
                              </div>
                          </div>
                          <small>
                              57% Complete
                          </small>
                      </td>
                      <td class="project-state">
                          <span class="badge badge-success">Success</span>
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
                  </tr> -->
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