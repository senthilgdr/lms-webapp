<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change New Password</title>
<jsp:include page="/layout/header.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<%
		Employee employee = (Employee) session.getAttribute("LOGGED_IN_USER");
		%>

		<div class="row">
			<div class="col-md-2">
				<div class="portlet-title">
					<div class="page-header">
						<h4>Change Password</h4>
					</div>
				</div>
				<div class="portlet-body">

					<form class="form-horizontal" role="form" method="POST"
						action="../employee/updatePassword" id="registerFrm">
						
												
						<div class="form-group">
							<label for="name">CurrentPassword:</label><input type="password"
								name="currentpassword" class="form-control" id="currentPassword"
								required="required" autofocus="autofocus">
						</div>
						<div class="form-group">
							<label for="name">NewPassword:</label><input type="password"
								name="newpassword" class="form-control" id="newPassword"
								required="required">
						</div>
							

						<div class="form-group">
							<button type="submit" class="btn btn-success" id="registerBtn">Update</button>
						</div>

					</form>

				</div>

			</div>
		</div>
	</div>
</body>

</html>