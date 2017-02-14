<%@page import="model.Employee"%>
<%@page import="model.LeaveRole"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My LeaveRole</title>
</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div class="container">
	<%
	Employee employee = (Employee) session.getAttribute("LOGGED_IN_USER");
	boolean isLoggedIn = employee != null;
	
	String roleName = "";
	if ( employee != null ){
		roleName = employee.getRole().getName();
	}

			 LeaveRole lr = (LeaveRole) request.getAttribute("LEAVE_ROLE"); 
			
			
		%>

		<div class="row">
			<div class="col-md-14">
				<div class="portlet-title">
					<div class="page-header">
						<h4>My LeaveRole</h4>
					</div>
				</div>
				<div class="portlet-body">
					<div class="table-responsive">
						<table class="table table-bordered">

							<thead>
								<tr>
									<th>S.NO</th>
									<th>ROLE</th>
									<th>CASUAL LEAVE</th>
									<th>SICK LEAVE</th>
									<th>PAID LEAVE</th>
									<th>MATERNITY LEAVE</th>
									<th>PATERNITY LEAVE</th>
									<th>PRIVILEGED LEAVE</th>
									<th>CREATED DATE</th>
									<th>MODIFIED DATE</th>
									
									
								</tr>
							</thead>
							<tbody>
								<% int i=1; %>
								<tr>
									<td><%=i++%></td>
									<td><%=lr.getRole().getName() %>
									<td><%=lr.getCasual_leave()%></td>
									<td><%=lr.getSick_leave()%></td>
									<td><%=lr.getPaid_leave()%></td>
									<td><%=lr.getMaternity_leave()%></td>
									<td><%=lr.getPaternity_leave()%></td>
									<td><%=lr.getPrivileged_leave()%></td>
									<td><%=lr.getCreatedDate()%></td>
									<td><%=lr.getModifiedDate() %></td>							
								</tr>
							</tbody>
						</table>

					</div>
				</div>
				
			</div>

		</div>
	</div>


</body>
</html>