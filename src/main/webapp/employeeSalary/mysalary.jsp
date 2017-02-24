<%@page import="model.EmployeeSalaryDetails"%>
<%@page import="model.Employee"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Salary Details</title>
</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div class="container">
		<%
			EmployeeSalaryDetails mySalary = (EmployeeSalaryDetails) request.getAttribute("MY_SALARY_LIST");

		%>

		<div class="row">
			<div class="col-md-4">
				<div class="portlet-title">
					<div class="page-header">
						<h4>My Salary Details</h4>
					</div>
				</div>
				<div class="portlet-body">
					<div class="table-responsive">
						<table class="table table-bordered">

							<tbody>
								<%
									int i = 1;
									if (mySalary != null) {
										{
								%>
								<tr>
									<th>S.NO</th>
									<td><%=i++%></td>
								</tr>
								<tr>
									<th>EMPLOYEE NAME</th>
									<td><%=mySalary.getEmpId().getId()%></td>
								</tr>
								<tr>
									<th>BASIC PAY</th>
									<td><%=mySalary.getBasicPay()%></td>
								</tr>
								<tr>
									<th>HRA</th>
									<td><%=mySalary.getHra()%></td>
								</tr>
								<tr>
									<th>CONVEYANCE</th>
									<td><%=mySalary.getConveyance()%></td>
								</tr>
								<tr>
									<th>SPECIAL ALLOWANCE</th>
									<td><%=mySalary.getSpecialAllowance()%></td>
								</tr>
								<tr>
									<th>MEDICAL INSURANCE</th>
									<td><%=mySalary.getMedicalInsurance() %></td>
								</tr>
								<tr>
									<th>PROVIDENT FUND</th>
									<td><%=mySalary.getProvidentFund()%></td>
								</tr>
								<tr>
									<th>INCOME TAX</th>
									<td><%=mySalary.getIncomeTax()%></td>	
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