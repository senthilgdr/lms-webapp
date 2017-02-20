package com.sen.controller.employee;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.EmployeeTaxDeclarationDAO;
import model.Employee;
import model.TaxDeclaration;
import service.EmployeeTaxService;

@Controller
@RequestMapping("employeeTax")
public class EmployeeTaxDecalrationController {
	
	EmployeeTaxService employeeTaxService=new EmployeeTaxService();

	@GetMapping("/addEmployeeTax")
	public String create() {
		return "../employee/taxdeclaration.jsp";
	}
	
	@GetMapping("/ApplyEmployeeTax")
	public String register(@RequestParam("name") String empName, @RequestParam("pan") String panNo,
			@RequestParam("houseRent") Float houseRent, @RequestParam("houseOwnerName") String houseOwnerName,
			@RequestParam("medicalBills") Float medicalBills,
			@RequestParam("epfContribution") Float epfContribution,
			@RequestParam("ppf") Float ppf,
			@RequestParam("scss") Float scss,
			@RequestParam("nsc") Float nsc,
			@RequestParam("taxSavingFixedDeposit") Float taxSavingFixedDeposit,
			@RequestParam("taxSavingBonds") Float taxSavingBonds,
			@RequestParam("taxSavingMutualFund") Float taxSavingMutualFund,
			@RequestParam("lifeInsurancePremiums") Float lifeInsurancePremiums,
			@RequestParam("pensionPlan") Float pensionPlan,
			@RequestParam("centralGovtPlan") Float centralGovtPlan,
			@RequestParam("housingLoan") Float housingLoan,
			@RequestParam("sukanyaSamriddhiAccount") Float sukanyaSamriddhiAccount,
			@RequestParam("stampDutyCharges") Float stampDutyCharges,
			@RequestParam("tuitionFees") Float tuitionFees,
			@RequestParam("additionalDeduction") Float additionalDeduction,
			@RequestParam("deductionRgess") Float deductionRgess,
			@RequestParam("medicalInsuranceSelf") Float medicalInsuranceSelf,
			@RequestParam("medicalInsuranceParents") Float medicalInsuranceParents,
			@RequestParam("educationLoan") Float educationLoan,
			@RequestParam("medicalTreatment") Float medicalTreatment,
			@RequestParam("expenditureMedicalTreatment") Float expenditureMedicalTreatment,
			@RequestParam("donationApprovedFunds") Float donationApprovedFunds,
			@RequestParam("physicallyDisabled") Float physicallyDisabled,
			
			ModelMap modelMap,
			HttpSession session) throws Exception {

		try {
			TaxDeclaration td = new TaxDeclaration();

			Employee emp = new Employee();
			emp.setId(1L);

			td.setEmployee(emp);
			td.setPanNo(panNo);
			td.setHouseRent(Float.valueOf(houseRent));
			td.setHouseOwnerName(houseOwnerName);
			td.setMedicalBills(Float.valueOf(medicalBills));
			td.setEpfvpfContribution(Float.valueOf(epfContribution));
			td.setPpf(Float.valueOf(ppf));
			td.setScss(Float.valueOf(scss));
			td.setNsc(Float.valueOf(nsc));
			td.setTaxSavingFD(Float.valueOf(taxSavingFixedDeposit));
			td.setTaxSavingBonds(Float.valueOf(taxSavingBonds));
			td.setTaxSavingMutualFund(Float.valueOf(taxSavingMutualFund));
			td.setLifeInsurancePremiums(Float.valueOf(lifeInsurancePremiums));
			td.setPensionPlan(Float.valueOf(pensionPlan));
			td.setCentralGovtPlan(Float.valueOf(centralGovtPlan));
			td.setHousingLoan(Float.valueOf(housingLoan));
			td.setSukanyaSamriddhiAccount(Float.valueOf(sukanyaSamriddhiAccount));
			td.setStampDutyCharges(Float.valueOf(stampDutyCharges));
			td.setTuitionFees(Float.valueOf(tuitionFees));
			td.setAdditionalDeduction(Float.valueOf(additionalDeduction));
			td.setDeductionRgess(Float.valueOf(deductionRgess));
			td.setMedicalInsuranceSelf(Float.valueOf(medicalInsuranceSelf));
			td.setMedicalInsuranceParents(Float.valueOf(medicalInsuranceParents));
			td.setEducationLoan(Float.valueOf(educationLoan));
			td.setMedicalTreatment(Float.valueOf(medicalTreatment));
			td.setExpenditureMedicalTreatment(Float.valueOf(expenditureMedicalTreatment));
			td.setDonationApprovedFunds(Float.valueOf(donationApprovedFunds));
			td.setPhysicallyDisabled(Float.valueOf(physicallyDisabled));
		

			EmployeeTaxDeclarationDAO dao = new EmployeeTaxDeclarationDAO();
			dao.applyTaxDeclaration(td);
			System.out.println("Insertd"+td);
			return "../employee/taxdeclaration.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "../employee/taxdeclaration.jsp";
		}

	}
	
	
}
