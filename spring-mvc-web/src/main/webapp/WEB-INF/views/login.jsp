<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>

<body>
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<c:if test="${param.incorrectAccount != null}">
				<div class="alert alert-danger alert-dismissible">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Username or Password incorrect</strong>
				</div>
			</c:if>
			<c:if test="${param.accessDenied != null}">
				<div class="alert alert-danger alert-dismissible">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Not Permission</strong>
				</div>
			</c:if>
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first">
				<img
					src="https://i.pinimg.com/564x/00/f5/b7/00f5b78fd6f153476510deb931641e74.jpg"
					id="icon" alt="User Icon" />
			</div>

			<!-- Login Form -->
			<form action="j_spring_security_check" id="formLogin" method="post">
				<input type="text" id="userName" class="fadeIn second" name="j_username" placeholder="Tên đăng nhập">
				<input type="text" id="password" class="fadeIn third" name="j_password" placeholder="Mật khẩu">
				<input type="submit" class="fadeIn fourth" value="Login">
			</form>

			<!-- Remind Passowrd -->
			<div id="formFooter">
				<a class="underlineHover" href="#">Forgot Password?</a>
			</div>

		</div>
	</div>
</body>

</html>