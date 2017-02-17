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
			 List<Employee> list = (List<Employee>) request.getAttribute("EMPLOYEE_LIST"); 
			
			
		%>

		<div class="row">
			<div class="col-md-14">
				<div class="portlet-title">
					<div class="page-header">
						<h4>Employees</h4>
					</div>
				</div>
				<div class="portlet-body">
					<div class="table-responsive">
						<table class="table table-bordered">

							<thead>
								<tr>
									<th>S.NO</th>
									<th>CODE</th>
									<th>NAME</th>
									<th>ROLE</th>
									<th>MAILID</th>
									<th>MOBILE NO</th>
									<th>CREATED DATE</th>
									<th>MODIFIED DATE</th>



								</tr>
							</thead>
							<tbody>
								<%
								 int i= 1;
									if (list != null) {
										for (Employee emp : list) {
											
								%>
								<tr>
									<td><%=i++%></td>
									<td><%=emp.getCode() %></td>
									<td><%=emp.getName() %></td>
									<td><%=emp.getRole().getName()%></td>
									<td><%=emp.getEmailId() %></td>
									<td><%=emp.getMobileNo() %></td>
									<td><%=emp.getCreatedDate() %></td>
									<td><%=emp.getModifiedDate() %></td>

									<td><a class='btn btn-danger'
										href="DeleteEmployee?id=<%=emp.getId()%>"><span
											class='icon-pencil'></span>Delete</a></td>

								</tr>
								<%}} %>
							</tbody>
						</table>

					</div>
				</div>

			</div>

		</div>
	</div>


</body>
</html>