<%@page import="model.LeaveDetail"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Leave Detail</title>
<script>
$(document).ready(function(){
	console.log("Jquery Loaded");	
	var todayDate= getCurrentDate();
	$("#fromDate").attr("min",todayDate);
	$("#toDate").attr("min",todayDate);
	
});

function fromDateSelected(){
	var fromDate = $("#fromDate").val();
	console.log("FromDateSelected:" + fromDate);
	$("#toDate").attr("min",fromDate);
}
</script>
</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div id="msg"></div>
	<div class="container">
		<%
			 LeaveDetail leaveList = (LeaveDetail) request.getAttribute("EDIT_LEAVE_DETAIL"); 
					
		%>
		<div class="row">
			<div class="col-md-2">

				<div class="portlet-title">
					<div class="page-header">
						<h4>Update Leave</h4>
					</div>
				</div>
				<div class="portlet-body">
					<form id="updateLeaveDetailFrm" class="form-horizontal" role="form"
						method="GET" action="UpdateAllLeaveDetail">

						<input type="hidden" name="id" value="<%=leaveList.getId() %>" />
						<div class="form-group">
							<label for="leaveType">LeaveType:</label> 
							
							<%
							Long leaveTypeId= leaveList.getLeaveType().getId();
							
							%>
							<select
								class="form-control" name="leaveType" required autofocus id="leaveType">
								<option value="1" <%= (leaveTypeId==1)? "selected": "" %> >Casual Leave</option>
								<option value="2" <%= (leaveTypeId==2)? "selected": "" %> >SickLeave</option>
								<option value="3" <%= (leaveTypeId==3)? "selected": "" %> >Paid Leave</option>

							</select>
						</div>
						<div class="form-group">
							<label for="fromDate">From Date:</label><input type="date"
								class="form-control" value="<%=leaveList.getFromDate()%>" name="fromDate" required
								id="fromDate" oninput="fromDateSelected()">
						</div>
						<div class="form-group">
							<label for="toDate">To Date</label><input type="date"
								class="form-control" value="<%=leaveList.getToDate()%>" name="toDate" required
								id="toDate">
						</div>
						<div class="form-group">
							<label for="noOfDays">No Of Days:</label><input type="text"
								class="form-control"  value="<%=leaveList.getNoOfDays()%>" name="noOfDays" required 
								id="noOfDays">
						</div>


						
						<div class="form-group">
							<button type="submit" class="btn btn-success"
								id="updateLeaveDetailBtn">Update</button>
						</div>

					</form>

				</div>
				
			</div>

		</div>
	</div>


</body>

</html>