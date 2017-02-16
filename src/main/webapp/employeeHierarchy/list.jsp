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
<title>EmployeeHierarchy</title>
</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div class="container">
		<%
			 List<EmployeeHierarchy> list = (List<EmployeeHierarchy>) request.getAttribute("EMPLOYEE_HIERARCHY_LIST"); 
			
			
		%>

		<div class="row">
			<div class="col-md-14">
				<div class="portlet-title">
					<div class="page-header">
						<h4>EmployeeHierarchy</h4>
					</div>
				</div>
				<div class="portlet-body">
					<div class="table-responsive">
						<table class="table table-bordered">

							<thead>
								<tr>
									<th>S.NO</th>
									<th>EMPLOYEE NAME</th>
									<th>MANAGER NAME</th>
																
									
								</tr>
							</thead>
							<tbody>
								<%
								 int i= 1;
									if (list != null) {
										for (EmployeeHierarchy emp : list) {
											
								%>
								<tr>
									<td><%=i++%></td>
									<td><%=emp.getEmpId() %></td>
									<td><%=emp.getMgrId() %></td>
									
									<td><a class='btn btn-success'
										href="EditEmployeeHierarchy?id=<%=emp.getId()%>"><span
											class='icon-pencil'></span>Edit</a></td>
									<td><a class='btn btn-danger'
										href="DeleteEmployeeHierarchy?id=<%=emp.getId()%>"><span
											class='icon-pencil'></span>Delete</a></td>
												
								</tr>
								<%}} %>
							</tbody>
						</table>

					</div>
				</div>
				<div class="row">
					<a class='btn btn-success' href="addEmployeeHierarchy">Add</a>
				</div>
				
			</div>

		</div>
	</div>


</body>
</html>