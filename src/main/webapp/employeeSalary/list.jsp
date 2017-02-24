<%@page import="model.EmployeeSalaryDetails"%>
<%@page import="model.EmployeeHierarchy"%>
<%@page import="model.Employee"%>
<%@page import="model.Holiday"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EmployeeSalary Details</title>
</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div class="container">
		<%
	  List<EmployeeSalaryDetails> list = (List<EmployeeSalaryDetails>) request.getAttribute("EMPLOYEE_SALARY_LIST"); 
			
		Employee employee = (Employee) session.getAttribute("LOGGED_IN_USER");
		%>

		<div class="row">
			<div class="col-md-14">
				<div class="portlet-title">
					<div class="page-header">
						<h4>EmployeeSalary Details</h4>
					</div>
				</div>
				<div class="portlet-body">
					<div class="table-responsive">
						<table class="table table-bordered">

							<thead>
								<tr>
									<th>S.NO</th>
									<th>EMPLOYEE NAME</th>
									<th>BASIC PAY</th>
									<th>HRA</th>
									<th>CONVEYANCE</th>
									<th>SPECIAL ALLOWANCE</th>
									<th>MEDICAL INSURANCE</th>
									<th>PROVIDENT FUND</th>
									<th>INCOME TAX</th>
																
									
								</tr>
							</thead>
							<tbody>
								<%
								 int i= 1;
									if (list != null) {
										for (EmployeeSalaryDetails empSalary : list) {
											
								%>
								<tr>
									<td><%=i++%></td>
									<td><%=empSalary.getEmpId().getId()%></td>
									<td><%=empSalary.getBasicPay() %></td>
									<td><%=empSalary.getHra() %></td>
									<td><%=empSalary.getConveyance() %></td>
									<td><%=empSalary.getSpecialAllowance()%></td>
									<td><%=empSalary.getMedicalInsurance() %></td>	
									<td><%=empSalary.getProvidentFund()%></td>
									<td><%=empSalary.getIncomeTax()%></td>								
									
												
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