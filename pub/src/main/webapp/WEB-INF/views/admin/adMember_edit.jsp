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
          <h3 class="card-title">회원정보 수정</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>
        <form role="form" method="post" name="m" action="admin_member_edit">
        <input type="hidden" name="id" value="${m.id}">
        <div class="card-body p-0">
          <table class="table table projects">
              <tbody>
              <tr>
              <th style="background-color:#F6F6F6;">회원 상태</th>
              <td><span>
              <c:if test="${m.state == 1}">가입회원</c:if>
              <c:if test="${m.state == 2}">탈퇴회원</c:if>
              </span></td>
              <c:if test="${m.state == 1}">
              <th style="background-color:#F6F6F6;">회원가입일</th>
              <td>${m.regdate}</td>
              </c:if>
              <c:if test="${m.state == 2}">
              <th style="background-color:#F6F6F6;">회원탈퇴일</th>
              <td>${m.deldate}</td>
              </c:if>
              </tr>
              <tr>
              <th style="background-color:#F6F6F6;">아이디</th>
              <td>${m.id}</td>
              <th style="background-color:#F6F6F6;">이름</th>
              <td><input type="text" name="name" class="form-control" id="name" value="${m.name}"></td>
              </tr>
              <tr>
              <th style="background-color:#F6F6F6;">생년월일</th>
              <td>${m.birth}</td>
              <th style="background-color:#F6F6F6;">성별</th>
              <td><input type="text" name="name" class="form-control" id="name" value="${m.gender}"></td>
              </tr>
              <tr>
              <th style="background-color:#F6F6F6;">이메일</th>
              <td colspan="3"><input type="email" name="email" class="form-control" id="inputEmail3" placeholder="Email" value="${m.email}"></td>
              </tr>
              </tbody>
          </table>
        </div>
        <div class="card-footer">
        <button type="submit" class="btn btn-primary float-right">저장</button>
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