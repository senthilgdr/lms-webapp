<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign Manage</title>

</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div id="msg"></div>
	<div class="container">

		<div class="row">
			<div class="col-md-4">

				<div class="portlet-title">
					<div class="page-header">
						<h4>Assign Manager</h4>
					</div>
				</div>
				<div class="portlet-body">
					<form id="addEmployeeHierarchyFrm" class="form-horizontal" role="form"
						method="GET" action="InsertEmployeeHierarchy">

						<div class="form-group">
							<label for="employeeName">EmployeeName:</label><input type="text"
								class="form-control" name="empId" required autofocus
								id="employeeName">
						</div>

						<div class="form-group">
							<label for="managerName">ManagerName:</label><input type="text"
								class="form-control" name="mgrId" required
								id="managerName">
						</div>


						<div class="form-group">
							<button type="submit" class="btn btn-success" id="addEmployeeHierarchyBtn">Submit</button>
						</div>

					</form>

				</div>

			</div>

		</div>
	</div>


</body>

</html>