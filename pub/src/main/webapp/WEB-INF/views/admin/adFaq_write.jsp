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
            <h1>FAQ 등록</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">FAQ 등록</li>
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
          <h3 class="card-title">관리자 FAQ 등록</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>
        <form role="form" method="post" name="f" action="admin_faq_write_ok">
        <div class="card-body p-0">
          <table class="table table projects">
              <tbody>
              <tr>
              <th style="background-color:#F6F6F6;">카테고리</th>
              <td colspan="3">
              <select class="form-control" name="cId" id="cId">
              <option value="100">홈페이지</option>
              <option value="200">전자도서관</option>
              <option value="300">도서관서비스</option>
              <option value="400">열린공간</option>
              </select></td>
              </tr>
              <tr>
              <th style="background-color:#F6F6F6;">자주 묻는 질문</th>
              <td colspan="3"><input type=text name="question" id="question" style="width:500px"/></td>
              </tr>
              <tr>
              <th style="background-color:#F6F6F6;" colspan="4">답변</th>
              </tr>
              
              <tr>
              <td colspan="4"><textarea name="answer" id="answer" rows="10" cols="100"></textarea></td>
              </tr>
              </tbody>
          </table>
        </div>
        <div class="card-footer">
        <input type="submit" class="btn btn-primary float-right">
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