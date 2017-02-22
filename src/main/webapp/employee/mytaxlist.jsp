<%@page import="model.Employee"%>
<%@page import="model.TaxDeclaration"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employees Tax Details</title>
</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div class="container">
		<%
		
		TaxDeclaration td= (TaxDeclaration) request.getAttribute("MY_TAX_LIST"); 
			
			
		%>

		<div class="row">
			<div class="col-md-14">
				<div class="portlet-title">
					<div class="page-header">
						<h4>Employees Tax Details</h4>
					</div>
				</div>
				<div class="portlet-body">
					<div class="table-responsive">
						<table class="table table-bordered">

							<thead>
								<tr>
									<th>S.NO</th>
									<th>NAME</th>
									<th>PAN NUMBER</th>
									<th>HOUSERENT</th>
									<th>HOUSE OWNER NAME</th>
									<th>MEDICAL BILLS</th>
									<th>EPF VPF CONTRIBUTION</th>
									<th>PPF</th>
									
									<th>SCSS</th>								
									<th>N.S.C</th>
									<th>TAX SAVING FD</th>
									<th>TAX SAVING BONDS</th>
									<th>E.L.S.S</th>
									<th>LIFE INSURANCE</th>
									
									<th>PENSION PLAN</th>									
									<th>CENTRAL GOVT.PLAN</th>
									<th>HOUSING LOAN</th>
									<th>SUKANYA ACCOUNT</th>
									<th>STAMP CHARGES:</th>
									<th>TUITION FEES</th>
									<th>ADDITIONAL DEDUCTION</th>
									
									<th>DEDUCTION RGESS</th>
									<th>MEDICAL INSURANCE SELF</th>
									<th>MEDICAL INSURANCE PARENT</th>
									<th>EDUCATION LOAN</th>
									<th>MEDICAL TREATMENT</th>
									<th>EXPENDITURE MEDICAL TREATMENT</th>
									<th>DONATION APPROVED FUNDS</th>
									<th>PHYSICALLY DISABLED</th>


								</tr>
							</thead>
							<tbody>
								<%
								 int i= 1;
									if (td != null) {
										 {
											
								%>
								<tr>
									<td><%=i++%></td>
									
									<td><%=td.getEmployee().getId()%></td>									
									<td><%=td.getPanNo() %></td>
									<td><%=td.getHouseRent() %></td>
									<td><%=td.getHouseOwnerName() %></td>
									<td><%=td.getMedicalBills() %></td>
									
									<td><%=td.getEpfvpfContribution() %></td>
									<td><%=td.getPpf() %></td>
									<td><%=td.getScss() %></td>
									<td><%=td.getNsc() %></td>
									<td><%=td.getTaxSavingFD() %></td>
									<td><%=td.getTaxSavingBonds()%></td>
									
									<td><%=td.getTaxSavingMutualFund() %></td>
									<td><%=td.getLifeInsurancePremiums() %></td>
									<td><%=td.getPensionPlan() %></td>
									<td><%=td.getCentralGovtPlan() %></td>
									<td><%=td.getHousingLoan() %></td>
									<td><%=td.getSukanyaSamriddhiAccount() %></td>
									<td><%=td.getStampDutyCharges() %></td>
									<td><%=td.getTuitionFees() %></td>
									<td><%=td.getAdditionalDeduction() %></td>
									<td><%=td.getDeductionRgess() %></td>
									
									<td><%=td.getMedicalInsuranceSelf() %></td>
									<td><%=td.getMedicalInsuranceParents() %></td>
									<td><%=td.getEducationLoan() %></td>
									<td><%=td.getMedicalTreatment() %></td>
									<td><%=td.getExpenditureMedicalTreatment() %></td>
									<td><%=td.getDonationApprovedFunds() %></td>
									<td><%=td.getPhysicallyDisabled() %></td>
														
									
									

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