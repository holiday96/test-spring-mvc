<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<c:url var="NewURL" value="/admin/news/edit" />
<!DOCTYPE html>
<html>
<head>

<title><dec:title default="Admin Home 🥰🥰" /></title>

<!-- Custom fonts for this template-->
<link
	href="<c:url value='/templates/admin/vendor/fontawesome-free/css/all.min.css' />"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link
	href="<c:url value='/templates/admin/vendor/datatables/dataTables.bootstrap4.css' />"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<c:url value='/templates/admin/css/sb-admin.css' />"
	rel="stylesheet">

</head>

<body id="page-top">

	<%@ include file="/commons/admin/header.jsp" %>
	
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active"><a class="nav-link"
				href="index.html"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>Pages</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Functions:</h6>
					<a class="dropdown-item" href="<c:url value='/admin/news'/>">Show News List</a>
					<a class="dropdown-item" href="${NewURL}?type=edit">Create</a>
				</div></li>
			<li class="nav-item"><a class="nav-link" href="charts.html">
					<i class="fas fa-fw fa-chart-area"></i> <span>Charts</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="tables.html">
					<i class="fas fa-fw fa-table"></i> <span>Tables</span>
			</a></li>
		</ul>

		<div id="content-wrapper">

			<dec:body />

			<%@ include file="/commons/admin/footer.jsp" %>

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href='<c:url value='/logout' />'>Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script
		src="<c:url value='/templates/admin/vendor/jquery/jquery.min.js' />"></script>
	<script
		src="<c:url value='/templates/admin/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<c:url value='/templates/admin/vendor/jquery-easing/jquery.easing.min.js' />"></script>

	<!-- Page level plugin JavaScript-->
	<script
		src="<c:url value='/templates/admin/vendor/chart.js/Chart.min.js' />"></script>

	<!-- Custom scripts for all pages-->
	<script src="<c:url value='/templates/admin/js/sb-admin.min.js' />"></script>

</body>
</html>