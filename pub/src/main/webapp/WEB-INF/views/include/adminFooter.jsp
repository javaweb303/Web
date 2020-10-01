<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<footer class="main-footer">
    <div class=" d-none d-sm-inline-block">
      <strong>Copyright &copy; Library, Inc.</strong>
    All rights reserved.
    </div>
  </footer>
  
  
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