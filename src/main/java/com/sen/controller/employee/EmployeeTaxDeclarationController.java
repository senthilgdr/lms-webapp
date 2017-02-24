package com.sen.controller.employee;

import java.util.List;

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
public class EmployeeTaxDeclarationController {

	EmployeeTaxService employeeTaxService = new EmployeeTaxService();

	@GetMapping("/addEmployeeTax")
	public String create() {
		return "../employeetax/taxdeclaration.jsp";
	}

	@GetMapping("/ApplyEmployeeTax")
	public String register(@RequestParam("name") String empName, @RequestParam("pan") String panNo,
			@RequestParam("houseRent") Integer houseRent, @RequestParam("houseOwnerName") String houseOwnerName,
			@RequestParam("medicalBills") Integer medicalBills,
			@RequestParam("epfContribution") Integer epfContribution, @RequestParam("ppf") Integer ppf,
			@RequestParam("scss") Integer scss, @RequestParam("nsc") Integer nsc,
			@RequestParam("taxSavingFixedDeposit") Integer taxSavingFixedDeposit,
			@RequestParam("taxSavingBonds") Integer taxSavingBonds,
			@RequestParam("taxSavingMutualFund") Integer taxSavingMutualFund,
			@RequestParam("lifeInsurancePremiums") Integer lifeInsurancePremiums,
			@RequestParam("pensionPlan") Integer pensionPlan, @RequestParam("centralGovtPlan") Integer centralGovtPlan,
			@RequestParam("housingLoan") Integer housingLoan,
			@RequestParam("sukanyaSamriddhiAccount") Integer sukanyaSamriddhiAccount,
			@RequestParam("stampDutyCharges") Integer stampDutyCharges,
			@RequestParam("tuitionFees") Integer tuitionFees,
			@RequestParam("additionalDeduction") Integer additionalDeduction,
			@RequestParam("deductionRgess") Integer deductionRgess,
			@RequestParam("medicalInsuranceSelf") Integer medicalInsuranceSelf,
			@RequestParam("medicalInsuranceParents") Integer medicalInsuranceParents,
			@RequestParam("educationLoan") Integer educationLoan,
			@RequestParam("medicalTreatment") Integer medicalTreatment,
			@RequestParam("expenditureMedicalTreatment") Integer expenditureMedicalTreatment,
			@RequestParam("donationApprovedFunds") Integer donationApprovedFunds,
			@RequestParam("physicallyDisabled") Integer physicallyDisabled,

			ModelMap modelMap, HttpSession session) throws Exception {

		try {
			TaxDeclaration td = new TaxDeclaration();

			Employee emp = new Employee();
			emp.setId(1L);

			td.setEmployee(emp);
			td.setPanNo(panNo);
			td.setHouseRent((houseRent));
			td.setHouseOwnerName(houseOwnerName);
			td.setMedicalBills((medicalBills));
			td.setEpfvpfContribution((epfContribution));
			td.setPpf((ppf));
			td.setScss((scss));
			td.setNsc((nsc));
			td.setTaxSavingFD((taxSavingFixedDeposit));
			td.setTaxSavingBonds((taxSavingBonds));
			td.setTaxSavingMutualFund((taxSavingMutualFund));
			td.setLifeInsurancePremiums((lifeInsurancePremiums));
			td.setPensionPlan((pensionPlan));
			td.setCentralGovtPlan((centralGovtPlan));
			td.setHousingLoan((housingLoan));
			td.setSukanyaSamriddhiAccount((sukanyaSamriddhiAccount));
			td.setStampDutyCharges((stampDutyCharges));
			td.setTuitionFees((tuitionFees));
			td.setAdditionalDeduction((additionalDeduction));
			td.setDeductionRgess((deductionRgess));
			td.setMedicalInsuranceSelf((medicalInsuranceSelf));
			td.setMedicalInsuranceParents((medicalInsuranceParents));
			td.setEducationLoan((educationLoan));
			td.setMedicalTreatment((medicalTreatment));
			td.setExpenditureMedicalTreatment((expenditureMedicalTreatment));
			td.setDonationApprovedFunds((donationApprovedFunds));
			td.setPhysicallyDisabled((physicallyDisabled));

			System.out.println("Add:" + td);

			EmployeeTaxDeclarationDAO dao = new EmployeeTaxDeclarationDAO();
			dao.applyTaxDeclaration(td);
			System.out.println("Insertd" + td);
			return "../employeetax/taxdeclaration.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "../employeetax/taxdeclaration.jsp";
		}

	}

	@GetMapping("/SelectEmployeeTax")
	public String list(ModelMap modelMap, HttpSession session) throws Exception {

		try {
			Employee emp = (Employee) session.getAttribute("LOGGED_IN_USER");

			List<TaxDeclaration> list = employeeTaxService.findAll();
			System.out.println(list);
			modelMap.addAttribute("EMPLOYEE_TAX_LIST", list);

			return "../employeetax/taxlist.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "/home.jsp";
		}
	}

	@GetMapping("/SelectMyTax")
	public String myTax(ModelMap modelMap, HttpSession session) throws Exception {

		try {
			Employee emp = (Employee) session.getAttribute("LOGGED_IN_USER");

			TaxDeclaration td = employeeTaxService.findByEmpId(emp.getId());
			System.out.println(td);
			modelMap.addAttribute("MY_TAX_LIST", td);

			return "../employeetax/mytaxlist.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "/home.jsp";
		}
	}
}
