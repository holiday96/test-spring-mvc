<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title><dec:title default="Trang chủ" /></title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/templates/web/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value='/templates/web/css/shop-homepage.css' />" rel="stylesheet">

</head>

<body>
	<%@ include file="/commons/web/header.jsp" %>

	<dec:body />

	<%@ include file="/commons/web/footer.jsp" %>
	
    <!-- Bootstrap core JavaScript -->
    <script src="<c:url value='/templates/web/jquery/jquery.min.js' />"></script>
    <script src="<c:url value='/templates/web/bootstrap/js/bootstrap.bundle.min.js' />"></script>

</body>
</html>