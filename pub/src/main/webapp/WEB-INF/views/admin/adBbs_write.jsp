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
            <h1>공지사항 등록</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">공지사항 등록</li>
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
          <h3 class="card-title">관리자 공지사항 등록</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>
       <form role="form" method="post" name="g" action="admin_gongji_write_ok">
        <div class="card-body p-0">
          <table class="table table projects">
              <tbody>
              <tr>
              <th style="background-color:#F6F6F6;">작성자</th>
              <td><input type="text" class="form-control" name="gongji_name" id="gongji_name"/></td>
              <th style="background-color:#F6F6F6;">비밀번호</th>
              <td><input type="password" class="form-control" name="gongji_pwd" id="gongji_pwd"/></td>
              </tr>
              <tr>
              <th style="background-color:#F6F6F6;">제목</th>
              <td colspan="3"><input class="form-control" type=text name="gongji_title" id="gongji_title"/></td>
              </tr>
              <tr>
              <th style="background-color:#F6F6F6;" colspan="4">내용</th>
              </tr>
              
              <tr>
              <td colspan="4"><textarea class="form-control" name="gongji_cont" id="gongji_cont" rows="10" cols="100"></textarea></td>
              </tr>
              </tbody>
          </table>
        </div>
        <div class="card-footer">
        <button type="submit" class="btn btn-primary float-right">등록</button>
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