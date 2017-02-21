<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to LMS Login</title>
</head>
<body>

	<%
		Employee employee = (Employee) session.getAttribute("LOGGED_IN_USER");
		if (employee != null) {
			response.sendRedirect("home.jsp");
		}
	%>

	<jsp:include page="layout/header.jsp"></jsp:include>
	<div class="container">

		<div class="row">
			<div class="col-md-4">

				<div class="portlet-title">
					<div class="page-header">
						<h3>Login</h3>
					</div>
				</div>
				<div class="portlet-body">
					<form action="<%=request.getContextPath()%>/employee/login"
						method="POST">
						<div class="form-group">
							<label for="userName">EmailId :</label> <input type="email"
								class="form-control" name="emailId" placeholder="Enter emailId"
								autofocus="autofocus" required="required" id="emailId" value="senthil.gdr@gmail.com">
						</div>


						<div class="form-group">
							<label for="password">Password :</label> <input type="password"
								class="form-control" name="password"
								placeholder="Enter Password" required="required" id="password" value="pass123">
						</div>
						<div class="form-group">
							<button type="submit" name="add" class="btn btn-success"
								id="addLoginBtn">SIGN IN</button>
						</div>
						<div class="row">
							<a href="employee/getForgotpassword" class="btn btn-link">Forgot Your
								Password?</a>
						</div>
						<hr />
						<div class="form-group">
							Don't have an account? &nbsp;&nbsp; <a
								href="employee/register.jsp" class='btn btn-primary'>Create
								New Account</a>
						</div>
					</form>


				</div>
			</div>
		</div>
	</div>

</body>

</html>