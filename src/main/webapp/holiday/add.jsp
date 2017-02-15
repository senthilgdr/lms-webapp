<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Holiday</title>

</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div id="msg"></div>
	<div class="container">

		<div class="row">
			<div class="col-md-2">

				<div class="portlet-title">
					<div class="page-header">
						<h4>Add Holiday</h4>
					</div>
				</div>
				<div class="portlet-body">
					<form id="addHoidaylFrm" class="form-horizontal" role="form"
						method="GET" action="InsertHolidayDetail">

						<div class="form-group">
							<label for="holidayDate">Holiday Date:</label><input type="date"
								class="form-control" name="holidayDate" required autofocus
								id="holidayDate">
						</div>

						<div class="form-group">
							<label for="reason">Reason:</label><input type="text"
								class="form-control" name="reason" required
								id="reason">
						</div>


						<div class="form-group">
							<button type="submit" class="btn btn-success" id="addHolidayBtn">Submit</button>
						</div>

					</form>

				</div>

			</div>

		</div>
	</div>


</body>

</html>