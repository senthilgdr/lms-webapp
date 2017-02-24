<%@page import="model.LeaveRole"%>
<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tax Declaration</title>

</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div id="msg"></div>
	<div class="container">

		<div class="row">
			<div class="col-md-8">

				<div class="portlet-title">
					<div class="page-header">
						<h3>
							<div class="bg-danger text-white">Tax Declaration:-</div>
						</h3>
					</div>
				</div>
				<div class="portlet-body">
					<form id="addTaxDeclarationFrm" class="form-horizontal" role="form"
						method="GET" action="../employeeTax/ApplyEmployeeTax">
						<div class="form-group">
							<label for="name">NAME:</label><input type="text"
								class="form-control" name="name" required autofocus id="name">
						</div>
						<div class="form-group">
							<label for="pan">PAN NUMBER:</label><input type="text"
								class="form-control" name="pan" required id="pan">
						</div>

						<div class="form-group">
							<label for="houseRent">HOUSE RENT(Annual):</label><input
								type="text" class="form-control" name="houseRent" required
								id="houseRent">
						</div>
						<div class="form-group">
							<label for="houseOwnerName">HOUSE OWNER NAME:</label><input
								type="text" class="form-control" name="houseOwnerName" required
								id="houseOwnerName">
						</div>
						<div class="form-group">
							<label for="medicalBills">MEDICAL BILLS(Max of 15,000 per
								annual):</label><input type="text" class="form-control"
								name="medicalBills" required id="medicalBills">
						</div>

						<div class="form-group">
							<h3>
								<div class="bg-success text-white">Less: Deduction under
									Sec 80C (Max:1,50,000):</div>
							</h3>
							<label for="epfContribution">A) EPF & VPF Contribution:</label><input
								type="text" class="form-control" name="epfContribution" required
								id="epfContribution">
						</div>
						<div class="form-group">
							<label for="ppf">B) PUBLIC PROVIDENT FUND(PPF):</label><input
								type="text" class="form-control" name="ppf" required id="ppf">
						</div>
						<div class="form-group">
							<label for="scss">C) SENIOR CITITIZEN'S SAVING SCHEME
								(SCSS):</label><input type="text" class="form-control" name="scss"
								required id="scss">
						</div>
						<div class="form-group">
							<label for="nsc">D) N.S.C(Investment + accrued Interest
								before Maturity Year):</label><input type="text" class="form-control"
								name="nsc" required id="nsc">
						</div>
						<div class="form-group">
							<label for="taxSavingFixedDeposit">E) TAX SAVING FIXED
								DEPOSIT (5 Years and above):</label><input type="text"
								class="form-control" name="taxSavingFixedDeposit" required
								id="taxSavingFixedDeposit">
						</div>
						<div class="form-group">
							<label for="taxSavingBonds">F) TAX SAVING BONDS:</label><input
								type="text" class="form-control" name="taxSavingBonds" required
								id="taxSavingBonds">
						</div>
						<div class="form-group">
							<label for="taxSavingMutualFund">G) E.L.S.S (Tax Saving
								Mutual Fund):</label><input type="text" class="form-control"
								name="taxSavingMutualFund" required id="taxSavingMutualFund">
						</div>
						<div class="form-group">
							<label for="lifeInsurancePremiums">H) LIFE INSURANCE
								PREMIUMS:</label><input type="text" class="form-control"
								name="lifeInsurancePremiums" required id="lifeInsurancePremiums">
						</div>
						<div class="form-group">
							<label for="pensionPlan">I) PENSION PLAN FROM INSURANCE
								COMPANIES/MUTUL FUNDS(u/s 80CCC):</label><input type="text"
								class="form-control" name="pensionPlan" required
								id="pensionPlan">
						</div>
						<div class="form-group">
							<label for="centralGovtPlan (u/s 80CCD)">J) CENTRAL
								GOVT.EMPLOYEES PENSION PLAN(u/s 80CCD):</label><input type="text"
								class="form-control" name="centralGovtPlan" required
								id="centralGovtPlan">
						</div>
						<div class="form-group">
							<label for="housingLoan">K) HOUSING LOAN (Principal
								Repayment):</label><input type="text" class="form-control"
								name="housingLoan" required id="housingLoan">
						</div>
						<div class="form-group">
							<label for="sukanyaSamriddhiAccount ">L) SUKANYA
								SAMRIDDHI ACCOUNT:</label><input type="text" class="form-control"
								name="sukanyaSamriddhiAccount" required
								id="sukanyaSamriddhiAccount">
						</div>
						<div class="form-group">
							<label for="stampDutyCharges">M) STAMP DUTY &
								REGISTRATION CHARGES:</label><input type="text" class="form-control"
								name="stampDutyCharges" required id="stampDutyCharges">
						</div>
						<div class="form-group">
							<label for=" tuitionFees">N) TUITION FEES FOR 2
								CHILDREN(u/s 80CCD):</label><input type="text" class="form-control"
								name="tuitionFees" required id="tuitionFees">
						</div>

						<div class="form-group">
							<h3>
								<div class="bg-success text-white">Less: Additional
									Deduction under Sec 80CCD(1B) NPS (Max:50,000/-)</div>
							</h3>
							<label for="additionalDeduction">ADDITIONAL DEDUCTION:</label><input
								type="text" class="form-control" name="additionalDeduction"
								required id="additionalDeduction">
						</div>

						<div class="form-group">
							<h3>
								<div class="bg-success text-white">Less: Deduction under
									RGESS Sec 80CCG (Max:50,000/-)</div>
							</h3>
							<label for="deductionRgess">DEDUCTION RGESS :</label><input
								type="text" class="form-control" name="deductionRgess" required
								id="deductionRgess">
						</div>

						<div class="form-group">
							<h3>
								<div class="bg-success text-white">Less: Deduction under
									chapter VI A</div>
							</h3>
							<label for="medicalInsuranceSelf">A) 80 D MEDICAL INSURANCE
								PREMIUMS(for Self, Spouse & Children):</label><input type="text"
								class="form-control" name="medicalInsuranceSelf" required
								id="medicalInsuranceSelf">
						</div>
						<div class="form-group">
							<label for="medicalInsuranceParents">B) 80 D MEDICAL
								INSURANCE PREMIUMS(for Parents):</label><input type="text"
								class="form-control" name="medicalInsuranceParents" required
								id="medicalInsuranceParents">
						</div>

						<div class="form-group">
							<label for="educationLoan">C) 80 E INT PAID ON EDUCATION
								LOAN:</label><input type="text" class="form-control"
								name="educationLoan" required id="educationLoan">
						</div>
						<div class="form-group">
							<label for="medicalTreatment">D) 80 DD MEDICAL TREATMENT
								OF HANDICAPPED DEPENDENT:</label><input type="text" class="form-control"
								name="medicalTreatment" required id="medicalTreatment">
						</div>
						<div class="form-group">
							<label for="expenditureMedicalTreatment">E) 80DDB
								EXPENDITURE ON SELECTED MEDICAL TREATMENT(for self/dependent):</label><input
								type="text" class="form-control"
								name="expenditureMedicalTreatment" required
								id="expenditureMedicalTreatment">
						</div>

						<div class="form-group">
							<label for="donationApprovedFunds">F) 80G, 80GGA, 80GGC
								DONATION TO APPROVED FUNDS:</label><input type="text"
								class="form-control" name="donationApprovedFunds" required
								id="donationApprovedFunds">
						</div>
						<div class="form-group">
							<label for="physicallyDisabled">G) 80U FOR PHYSICALLY
								DISABLED ASSESSE:</label><input type="text" class="form-control"
								name="physicallyDisabled" required id="physicallyDisabled">
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-success"
								id="addTaxDeclaration">Submit</button>
						</div>

					</form>

				</div>

			</div>

		</div>
	</div>


</body>

</html>