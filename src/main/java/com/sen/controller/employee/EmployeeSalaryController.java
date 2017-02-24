package com.sen.controller.employee;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.Employee;
import model.EmployeeSalaryDetails;
import service.EmployeeSalaryService;

@Controller
@RequestMapping("employeeSalary")
public class EmployeeSalaryController {
	EmployeeSalaryService employeeSalaryService = new EmployeeSalaryService();

	@GetMapping("/addEmployeeSalary")
	public String create() {
		return "../employeeSalary/add.jsp";
	}

	@GetMapping("/InsertEmployeeSalary")
	public String save(@RequestParam("empId") Long empId, @RequestParam("basicPay") Long basicPay,
			@RequestParam("hra") Long hra, @RequestParam("conveyance") Long conveyance,
			@RequestParam("specialAllowance") Long specialAllowance,
			@RequestParam("medicalInsurance") Long medicalInsurance, @RequestParam("providentFund") Long providentFund,
			@RequestParam("incomeTax") Long incomeTax, ModelMap modelMap, HttpSession session) throws Exception {

		try {
			EmployeeSalaryDetails emp = new EmployeeSalaryDetails();

			Employee employee = (Employee) session.getAttribute("LOGGED_IN_USER");
			employee.setId(empId);

			emp.setEmpId(employee);
			emp.setBasicPay(basicPay);
			emp.setHra(hra);
			emp.setConveyance(conveyance);
			emp.setSpecialAllowance(specialAllowance);
			emp.setMedicalInsurance(medicalInsurance);
			emp.setProvidentFund(providentFund);
			emp.setIncomeTax(incomeTax);

			employeeSalaryService.insert(emp);
			System.out.println("Inserted");

			return "redirect:SelectEmployeeSalary";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("ERROR_MESSAGE", e.getMessage());
			return "../employeeSalary/add.jsp";
		}

	}

	@GetMapping("/SelectEmployeeSalary")
	public String list(ModelMap modelMap, HttpSession session) throws Exception {

		try {
			List<EmployeeSalaryDetails> list = employeeSalaryService.list();
			System.out.println(list);
			modelMap.addAttribute("EMPLOYEE_SALARY_LIST", list);

			return "../employeeSalary/list.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("ERROR_MESSAGE", e.getMessage());
			return "/home.jsp";
		}
	}

	@GetMapping("/SelectMySalary")
	public String mySalary(ModelMap modelMap, HttpSession session) throws Exception {

		try {
			Employee employee = (Employee) session.getAttribute("LOGGED_IN_USER");

			EmployeeSalaryDetails mySalary = employeeSalaryService.listMySalary(employee.getId());
			System.out.println(mySalary);
			modelMap.addAttribute("MY_SALARY_LIST", mySalary);

			return "../employeeSalary/mysalary.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("ERROR_MESSAGE", e.getMessage());
			return "/home.jsp";
		}
	}

}
