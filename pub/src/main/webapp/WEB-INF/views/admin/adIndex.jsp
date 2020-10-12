<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/adminHeader.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">관리자 메인 화면</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">main</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-purple">
              <div class="inner">
                <h3>${gongji_count}</h3>

                <p>공지사항</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="/admin/admin_bbs_list" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-pink">
              <div class="inner">
                <h3>${faq_count}</h3>

                <p>FAQ</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="/admin/admin_faq_list" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner" style="color:#fff;">
                <h3>${member_count}</h3>

                <p>이용 회원</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="/admin/admin_member_list" class="small-box-footer" style="color:#fff !important;">More info <i class="fas fa-arrow-circle-right" style="color:#fff;"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-orange">
              <div class="inner" style="color:#fff;">
                <h3>${ebook_count}</h3>

                <p>전자책</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <a href="/admin/admin_ebook_reg" class="small-box-footer" style="color:#fff !important;">More info <i class="fas fa-arrow-circle-right" style="color:#fff;"></i></a>
            </div>
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
        <!-- Main row -->
        <div class="row">
        
          <!-- Left col -->
          <section class="col-lg-7 connectedSortable">
          <!-- 공지사항 -->
          <div class="card">
          <div class="card-header">
          <h3 class="card-title">
                  <i class="ion ion-create-outline mr-1"></i>
                  	공지사항
                </h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                <table class="table table-striped projects">
					<thead>
						<tr>
							<th style="width: 5%">NO</th>
							<th style="width: 30%">제목</th>
							<th style="width: 20%">등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty glist}">
							<c:forEach var="g" items="${glist}">
								<tr>
									<td>${g.gongji_no}</td>
									<td><a> ${g.gongji_title} </a></td>
									<td>${g.gongji_date}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
                </div>
                <!-- /.card-body -->
              <div class="card-footer clearfix">
                <button type="button" class="btn btn-secondary float-right" onclick="location.href='/admin/admin_gongji_write';"><i class="fas fa-plus"></i> 공지사항 등록</button>
              </div>
          </div>
           <!-- /.card -->
          </section>
          
          <section class="col-lg-5 connectedSortable">
          <!-- FAQ -->
          <div class="card">
          <div class="card-header">
          <h3 class="card-title">
                  <i class="ion ion-create-outline mr-1"></i>
                  	faq
                </h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                <table class="table table-striped projects">
					<thead>
						<tr>
							<th style="width: 5%">NO</th>
							<th style="width: 30%">질문</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty flist}">
							<c:forEach var="f" items="${flist}">
								<tr>
									<td>${f.faqNo}</td>
									<td><a><c:if test="${fn:length(f.question)>16 }">${fn:substring(f.question,0,16)}...</c:if> 
									<c:if test="${fn:length(f.question)<16}">${f.question}</c:if>
									</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
                </div>
                <!-- /.card-body -->
              <div class="card-footer clearfix">
                <button type="button" class="btn btn-secondary float-right" onclick="location.href='/admin/admin_faq_write';"><i class="fas fa-plus"></i> faq 등록</button>
              </div>
          </div>
           <!-- /.card -->
          </section>
          <section class="col-lg-12 connectedSortable">
        <!-- 연락처 -->
        <div class="card">
        <div class="card-header">
          <h3 class="card-title">
                  <i class="ion ion-create-outline mr-1"></i>
                  	Contacts
                </h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                <div class="row d-flex align-items-stretch">
        		<div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
              <div class="card bg-light">
                <div class="card-header text-muted border-bottom-0">
                  PM
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead"><b>문영선</b></h2>
                      <p class="text-muted text-sm"><b>About: </b> Web Programmer </p>
                      <ul class="ml-4 mb-0 fa-ul text-muted">
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span> Address: 경기도 수원시 권선구</li>
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> Phone #: 010-3831-6811</li>
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                      <img src="<c:url value='/bootstrap/dist/img/user2-160x160.jpg' />" alt="user-avatar" class="img-circle img-fluid">
                    </div>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="text-right">
                    <a href="#" class="btn btn-sm btn-primary">
                      <i class="fas fa-user"></i> View Profile
                    </a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
              <div class="card bg-light">
                <div class="card-header text-muted border-bottom-0">
                  PL
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead"><b>박범석</b></h2>
                      <p class="text-muted text-sm"><b>About: </b> Web Programmer / UX / Graphic Artist </p>
                      <ul class="ml-4 mb-0 fa-ul text-muted">
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span> Address: 서울특별시 동작구 대방동</li>
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> Phone #: 010-8834-3952</li>
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                      <img src="<c:url value='/bootstrap/dist/img/user2-160x160.jpg' />" alt="user-avatar" class="img-circle img-fluid">
                    </div>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="text-right">
                    <a href="#" class="btn btn-sm btn-primary">
                      <i class="fas fa-user"></i> View Profile
                    </a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
              <div class="card bg-light">
                <div class="card-header text-muted border-bottom-0">
                  PE
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead"><b>유성근</b></h2>
                      <p class="text-muted text-sm"><b>About: </b> Web Programmer / UX / Graphic Artist / Coffee Lover </p>
                      <ul class="ml-4 mb-0 fa-ul text-muted">
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span> Address: 경기도 시흥시</li>
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> Phone #: 010-5804-4484</li>
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                      <img src="<c:url value='/bootstrap/dist/img/user2-160x160.jpg' />" alt="user-avatar" class="img-circle img-fluid">
                    </div>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="text-right">
                    <a href="#" class="btn btn-sm btn-primary">
                      <i class="fas fa-user"></i> View Profile
                    </a>
                  </div>
                </div>
              </div>
            </div>
            </div>
        		</div>
        		<!-- /.card-body -->
              <div class="card-footer clearfix">
                <button type="button" class="btn btn-secondary float-right" onclick="location.href='#';"><i class="fas fa-plus"></i>더보기</button>
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
<!-- jQuery UI 1.11.4 -->
<script src="<c:url value='/bootstrap/plugins/jquery-ui/jquery-ui.min.js' />"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="<c:url value='/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js' />"></script>
<!-- ChartJS -->
<script src="<c:url value='/bootstrap/plugins/chart.js/Chart.min.js' />"></script>
<!-- Sparkline -->
<script src="<c:url value='/bootstrap/plugins/sparklines/sparkline.js' />"></script>
<!-- JQVMap -->
<script src="<c:url value='/bootstrap/plugins/jqvmap/jquery.vmap.min.js' />"></script>
<script src="<c:url value='/bootstrap/plugins/jqvmap/maps/jquery.vmap.usa.js' />"></script>
<!-- jQuery Knob Chart -->
<script src="<c:url value='/bootstrap/plugins/jquery-knob/jquery.knob.min.js' />"></script>
<!-- daterangepicker -->
<script src="<c:url value='/bootstrap/plugins/moment/moment.min.js' />"></script>
<script src="<c:url value='/bootstrap/plugins/daterangepicker/daterangepicker.js' />"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="<c:url value='/bootstrap/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js' />"></script>
<!-- Summernote -->
<script src="<c:url value='/bootstrap/plugins/summernote/summernote-bs4.min.js' />"></script>
<!-- overlayScrollbars -->
<script src="<c:url value='/bootstrap/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js' />"></script>
<!-- AdminLTE App -->
<script src="<c:url value='/bootstrap/dist/js/adminlte.js' />"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value='/bootstrap/dist/js/demo.js' />"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<c:url value='/bootstrap/dist/js/pages/dashboard.js' />"></script>
</body>
</html>