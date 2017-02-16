<%@page import="model.Holiday"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Holiday</title>

</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div id="msg"></div>
	<div class="container">
<% Holiday holiday=(Holiday)request.getAttribute("EDIT_HOLIDAY"); %>
		<div class="row">
			<div class="col-md-2">

				<div class="portlet-title">
					<div class="page-header">
						<h4>Update Holiday</h4>
					</div>
				</div>
				<div class="portlet-body">
					<form id="updateHoidaylFrm" class="form-horizontal" role="form"
						method="GET" action="UpdateHolidayDetail">
						<div class="form-group">
							<label for="id">S.No:</label><input type="text"
								class="form-control" value=<%=holiday.getId() %> name="id" required autofocus readonly
								id="id">
						</div>

						<div class="form-group">
							<label for="holidayDate">Holiday Date:</label><input type="date"
								class="form-control" value=<%=holiday.getHolidayDate() %> name="holidayDate" required 
								id="holidayDate">
						</div>

						<div class="form-group">
							<label for="reason">Reason:</label><input type="text"
								class="form-control" value=<%=holiday.getStatus() %> name="reason" required
								id="reason">
						</div>


						<div class="form-group">
							<button type="submit" class="btn btn-success" id="updateHolidayBtn">Submit</button>
						</div>

					</form>

				</div>

			</div>

		</div>
	</div>


</body>

</html>