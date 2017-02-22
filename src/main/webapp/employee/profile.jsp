<%@page import="model.EmployeeHierarchy"%>
<%@page import="model.Employee"%>
<%@page import="model.Holiday"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employees</title>
</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div class="container">
		<%
			Employee emp = (Employee) session.getAttribute("LOGGED_IN_USER");
		%>

		<div class="row">
			<div class="col-md-14">
				<div class="portlet-title">
					<div class="page-header">
						<h4>My Profile Details</h4>
					</div>
				</div>
				<div class="portlet-body">
					<div class="table-responsive">
						<table class="table table-bordered">
							<tbody>
								<%
									int i = 1;
									if (emp != null) {
								%>

								<tr>
									<th>CODE</th>
									<td><%=emp.getCode()%></td>
								</tr>
								<tr>
									<th>NAME</th>
									<td><%=emp.getName()%></td>
								</tr>
								<tr>
									<th>ROLE</th>
									<td><%=emp.getRole().getName()%></td>
								</tr>

								<tr>
									<th>MAILID</th>
									<td><%=emp.getEmailId()%></td>
								</tr>
								<tr>

									<th>MOBILE NO</th>
									<td><%=emp.getMobileNo()%></td>
								</tr>
								<tr>

								<td><a class='btn btn-danger'
									href="DeleteEmployee?id=<%=emp.getId()%>"><span
										class='icon-pencil'></span>Delete</a></td>

								</tr>
								<%
									}
								%>
							</tbody>
						</table>

					</div>
				</div>

			</div>

		</div>
	</div>


</body>
</html>