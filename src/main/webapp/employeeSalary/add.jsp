<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EmployeeSalary</title>

</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div id="msg"></div>
	<div class="container">
<%
List<Employee> list =(List<Employee>)request.getAttribute("EMPLOYEE_LIST");
%>
		<div class="row">
			<div class="col-md-4">

				<div class="portlet-title">
					<div class="page-header">
						<h4>EmployeeSalary</h4>
					</div>
				</div>
				<div class="portlet-body">
					<form id="addEmployeeSalaryFrm" class="form-horizontal" role="form"
						method="GET" action="InsertEmployeeSalary">

						<div class="form-group">
							<label for="empId">NAME:</label><input type="text"
								class="form-control" name="empId" required autofocus
								id="empId">
						</div>
						<%-- <div class="form-group">
							<label for="empId">NAME:</label>
							
							<select name="empId">
							<% 
							for(Employee emp:list){ %>
							<option value="<%=emp.getId() %>" <%=emp.getName() %>></option>
														
							<%}
								%>
							</select>
						</div> --%>

						<div class="form-group">
							<label for="basicPay">BASIC PAY:</label><input type="text"
								class="form-control" name="basicPay" required
								id="basicPay">
						</div>
                        <div class="form-group">
							<label for="hra">HRA:</label><input type="text"
								class="form-control" name="hra" required
								id="hra">
						</div>
						<div class="form-group">
							<label for="conveyance">CONVEYANCE:</label><input type="text"
								class="form-control" name="conveyance" required
								id="conveyance">
						</div>
						<div class="form-group">
							<label for="specialAllowance">SPECIAL ALLOWANCE:</label><input type="text"
								class="form-control" name="specialAllowance" required
								id="specialAllowance">
						</div>
						<div class="form-group">
							<label for="medicalInsurance">MEDICAL INSURANCE:</label><input type="text"
								class="form-control" name="medicalInsurance" required
								id="medicalInsurance">
						</div>
						<div class="form-group">
							<label for="providentFund">PROVIDENT FUND:</label><input type="text"
								class="form-control" name="providentFund" required
								id="providentFund">
						</div>
						<div class="form-group">
							<label for="incomeTax">INCOME TAX:</label><input type="text"
								class="form-control" name="incomeTax" required
								id="incomeTax">
						</div>

						<div class="form-group">
							<button type="submit" class="btn btn-success" id="addEmployeeSalaryBtn">Submit</button>
						</div>

					</form>

				</div>

			</div>

		</div>
	</div>


</body>

</html>