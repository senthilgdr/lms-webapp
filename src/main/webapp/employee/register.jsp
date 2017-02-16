<%@page import="model.LeaveRole"%>
<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create New Account</title>

</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div id="msg"></div>
	<div class="container">
		
		<div class="row">
			<div class="col-md-4">

				<div class="portlet-title">
					<div class="page-header">
						<h4>Create a New Account</h4>
					</div>
				</div>
				<div class="portlet-body">
					<form id="addEmployeeFrm" class="form-horizontal" role="form"
						method="GET" action="../employee/RegisterEmployee">
					
						<div class="form-group">
							<label for="code">CODE:</label><input type="text"
								class="form-control" name="code" required autofocus
								id="code">
						</div>
						<div class="form-group">
							<label for="name">NAME:</label><input type="text"
								class="form-control" name="name" required autofocus
								id="name">
						</div>
						<input type="hidden" name="role" value="10" > <!-- 10 refers Employee Role -->
						
						<div class="form-group">
							<label for="emailId">E-MAILID:</label><input type="email"
								class="form-control" name="emailId" required autofocus
								id="emailId">
						</div>
						<div class="form-group">
							<label for="password">PASSWORD:</label><input type="password"
								class="form-control" name="password" required autofocus
								id="password">
						</div>
						<div class="form-group">
							<label for="mobileNo">MOBILE NO:</label><input type="text"
								class="form-control" name="mobileNo" required autofocus
								id="mobileNo">
						</div>



						<div class="form-group">
							<button type="submit" class="btn btn-success"
								id="addEmployeeBtn">Create Account</button>
						</div>

					</form>

				</div>
				
			</div>

		</div>
	</div>


</body>

</html>