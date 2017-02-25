<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Leave Detail</title>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/dateutil.js"></script>
<script>
	$(document).ready(function() {
		console.log("Jquery Loaded");
		var todayDate = getCurrentDate();
		$("#fromDate").attr("min", todayDate);
		$("#toDate").attr("min", todayDate);

	});
	
	function dayType() {
		var dayType = $("#daytype").val();
	
		if ("FULL_DAY" == dayType){
			$("#toDate").removeAttr("max");
		}
		else if ("HALF_DAY" == dayType) {
			var fromDate = $("#fromDate").val();
			$("#toDate").attr("value", fromDate);
		}
		
		
	}

	function fromDateSelected() {
		var fromDate = $("#fromDate").val();
		console.log("FromDateSelected:" + fromDate);
		$("#toDate").attr("min", fromDate);
		
		var dayType = $("#daytype").val();
		
		if("HALF_DAY" == dayType) {
			//alert("From Date and toDate should be same");
			$("#toDate").attr("value", fromDate);
			$("#toDate").attr("max", fromDate);
		}
		else
		{
			
		}
	}
	
	
<%Employee employee = (Employee) session.getAttribute("LOGGED_IN_USER");
			boolean isLoggedIn = employee != null;

			String gender = "";
			if (employee != null) {
				gender = employee.getGender();
			}%>
	
</script>

</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div id="msg"></div>
	<div class="container">

		<div class="row">
			<div class="col-md-2">

				<div class="portlet-title">
					<div class="page-header">
						<h4>Apply Leave</h4>
					</div>
				</div>
				<div class="portlet-body">
					<form id="addLeaveDetailFrm" class="form-horizontal" role="form"
						method="GET" action="InsertLeaveDetail">

						<div class="form-group">
							<label for="leaveType">LeaveType:</label> <select
								class="form-control" name="leaveType" required id="leaveType">
								<option value="1">Casual Leave</option>
								<option value="2">SickLeave</option>
								<option value="3">Paid Leave</option>
								<%
									if ("F".equals(gender)) {
								%>
								<option value="4">Maternity Leave</option>

								<%
									} else {
								%>
								<option value="5">Paternity Leave</option>
								<%
									}
								%>
								<option value="5">Privileged Leave</option>

							</select>
						</div>
							<div class="form-group">
							<label for="daytype">Day Type:</label>
							<select class="form-control" name="daytype" required id="daytype" onchange="dayType()"> 
						<option value="FULL_DAY" selected>Full Day</option>
						<option value="HALF_DAY">Half Day</option>
						</select>
						</div>
						<div class="form-group">
							<label for="fromDate">From Date:</label><input type="date"
								class="form-control" id="fromDate" name="fromDate" required
								autofocus id="fromDate" oninput="fromDateSelected()">
						</div>
						<div class="form-group">
							<label for="toDate">To Date</label><input type="date"
								class="form-control" id="toDate" name="toDate" required
								autofocus id="toDate">
						</div>
					
						<div class="form-group">
							<button type="submit" class="btn btn-success"
								id="addLeaveDetailBtn">Submit</button>
						</div>

					</form>

				</div>

			</div>

		</div>
	</div>


</body>

</html>