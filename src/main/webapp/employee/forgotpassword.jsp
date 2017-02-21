
<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>

</head>
<body>
<jsp:include page="/layout/header.jsp"></jsp:include>
	<div class="container">
		<%
		Employee employee = (Employee) session.getAttribute("LOGGED_IN_USER");
		%>

		<div class="row">
			<div class="col-md-2">
				<div class="portlet-title">
					<div class="page-header">
						<h4>Forgot Password</h4>
					</div>
				</div>
				<div class="portlet-body">

					<form class="form-horizontal" role="form" method="POST"
						action="../employee/Forgotpassword" id="registerFrm">
						

						<div class="form-group">
							<label for="name">E-mail:</label><input type="email"
								name="emailId" class="form-control" id="email"
								required="required" autofocus>
						</div>
											

						<div class="form-group">
							<button type="submit" class="btn btn-success" id="registerBtn">Submit</button>
						</div>

					</form>

				</div>

			</div>
		</div>
	</div>
</body>

</html>