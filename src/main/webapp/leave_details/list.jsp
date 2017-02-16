<%@page import="model.Employee"%>
<%@page import="model.LeaveDetail"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leave Details</title>
</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div class="container">
		<%
			 List<LeaveDetail> leaveList = (List<LeaveDetail>) request.getAttribute("LEAVE_DETAILS_LIST"); 
					
		%>

		<div class="row">
			<div class="col-md-14">
				<div class="portlet-title">
					<div class="page-header">
						<h4>My Leave Details</h4>
					</div>
				</div>
				<div class="portlet-body">
					<div class="table-responsive">
						<table class="table table-bordered">

							<thead>
								<tr>
									<th>Sno</th>
									<th>LeaveType</th>
									<th>FromDate</th>
									<th>ToDate</th>
									<th>NoOfDays</th>
									<th>Status</th>
									<th>AppliedDate</th>
									<th>ModifiedBy</th>
									<th>ModifiedDate</th>
								</tr>
							</thead>
							<tbody>
								<%
								 int i= 1;
									if (leaveList != null) {
										for (LeaveDetail ld : leaveList) {
											String status = ld.getStatus().getStatus();
								%>
								<tr>
									<td><%=i++%></td>
									<td><%=ld.getLeaveType().getType()%></td>
									<td><%=ld.getFromDate()%></td>
									<td><%=ld.getToDate()%></td>
									<td><%=ld.getNoOfDays()%></td>
									<td><%=status%></td>
									<td><%=ld.getAppliedDate()%></td>
									<td><%=ld.getModifiedBy().getName()%></td>
									<td><%=ld.getModifiedDate()%></td>			
							
									<% if ("APPLIED".equals(status) ){ %>
									<td>
									<a class='btn btn-danger btn-sm'
										href="UpdateLeaveDetail?id=<%=ld.getId()%>&status=4">Cancel Leave</a>											
											</td>
											<%} %>
									
									
									<td><a class='btn btn-success'
										href="EditLeaveDetail?id=<%=ld.getId()%>"><span
											class='icon-pencil'></span>Edit</a></td>
												
								</tr>
								<%
									}
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