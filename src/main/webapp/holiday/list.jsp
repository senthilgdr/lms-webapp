<%@page import="model.Employee"%>
<%@page import="model.Holiday"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Holidays</title>
</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div class="container">
		<%
			 List<Holiday> list = (List<Holiday>) request.getAttribute("HOLIDAY_LIST"); 
			
			
		%>

		<div class="row">
			<div class="col-md-14">
				<div class="portlet-title">
					<div class="page-header">
						<h4>Holidays</h4>
					</div>
				</div>
				<div class="portlet-body">
					<div class="table-responsive">
						<table class="table table-bordered">

							<thead>
								<tr>
									<th>S.NO</th>
									<th>HOLIDAY_DATE</th>
									<th>REASON</th>
																
									
								</tr>
							</thead>
							<tbody>
								<%
								 int i= 1;
									if (list != null) {
										for (Holiday holiday : list) {
											
								%>
								<tr>
									<td><%=i++%></td>
									<td><%=holiday.getHolidayDate() %></td>
									<td><%=holiday.getStatus() %></td>
												
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