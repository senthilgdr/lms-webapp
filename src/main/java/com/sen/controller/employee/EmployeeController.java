package com.sen.controller.employee;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.EmployeeDAO;
import dao.UserMailManager;
import model.Employee;
import model.Role;
import service.EmployeeService;

@Controller
@RequestMapping("employee")
public class EmployeeController {

	EmployeeService employeeService = new EmployeeService();

	@PostMapping("/login")
	public String login(@RequestParam("emailId") String emailId, @RequestParam("password") String password,
			ModelMap modelMap, HttpSession session) {
		System.out.println("EmployeeController->login");

		Employee employee = new EmployeeDAO().findByEmailIdAndPassword(emailId, password);
		if (employee != null) {
			session.setAttribute("LOGGED_IN_USER", employee);

			return "redirect:../home.jsp";
		} else {
			modelMap.addAttribute("ERROR_MESSAGE", "Invalid EmailID/Password");
			return "../index.jsp";
		}
	}

	@GetMapping("/Logout")
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:../index.jsp";
	}

	@GetMapping("/RegisterEmployee")
	public String register(@RequestParam("code") String code, @RequestParam("name") String name,
			@RequestParam("gender") String gender, @RequestParam("role") Long role,
			@RequestParam("emailId") String emailId, @RequestParam("password") String password,
			@RequestParam("mobileNo") Long mobileNo, ModelMap modelMap, HttpSession session) throws Exception {

		try {
			Employee emp = new Employee();
			emp.setCode(code);
			emp.setName(name);
			emp.setGender(gender);
			emp.setEmailId(emailId);
			emp.setPassword(password);
			emp.setMobileNo(mobileNo);

			Role r = new Role();
			r.setId(role); // employeee
			emp.setRole(r);
			System.out.println(emp);

			employeeService.register(emp);

			UserMailManager.sendNewRegistrationEmail(emp);
			return "redirect:../";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("ERROR_MESSAGE", e.getMessage());
			return "../employee/register.jsp";
		}

	}

	@GetMapping("/SelectEmployee")
	public String list(ModelMap modelMap, HttpSession session) throws Exception {

		try {

			List<Employee> list = employeeService.list();
			System.out.println(list);
			modelMap.addAttribute("EMPLOYEE_LIST", list);

			return "../employee/list.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("ERROR_MESSAGE", e.getMessage());
			return "/home.jsp";
		}
	}

	@GetMapping("/MyProfile")
	public String showMyprofile(ModelMap modelMap, HttpSession session) throws Exception {

		try {

			return "../employee/profile.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("ERROR_MESSAGE", e.getMessage());
			return "/home.jsp";
		}
	}

	@GetMapping("/EditEmployee")
	public String edit(@RequestParam("id") Long id, ModelMap modelMap, HttpSession session) throws Exception {

		try {

			Employee emp = (Employee) session.getAttribute("LOGGED_IN_USER");
			modelMap.addAttribute("EDIT_EMPLOYEE", emp);

			return "../employee/edit.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("ERROR_MESSAGE", e.getMessage());
			return "../employee/list.jsp";
		}

	}

	@GetMapping("/UpdateEmployee")
	public String update(@RequestParam("id") Long id, @RequestParam("code") String code,
			@RequestParam("name") String name, @RequestParam("role") Long role, @RequestParam("mailId") String mailId,
			@RequestParam("mobileNo") Long mobileNo, ModelMap modelMap, HttpSession session) throws Exception {

		try {
			Employee employee = employeeService.findById(id);
			employee.setCode(code);
			employee.setName(name);
			employee.setEmailId(mailId);
			employee.setMobileNo(mobileNo);

			Role r = new Role();
			r.setId(role);

			employee.setRole(r);
			employeeService.update(employee);

			Employee employeeNew = employeeService.findById(id);
			session.setAttribute("LOGGED_IN_USER", employeeNew);

			System.out.println("Updated" + employee);

			return "redirect:MyProfile?INFO_MESSAGE=Successfully Employee Updated";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("ERROR_MESSAGE", e.getMessage());
			return "EditEmployee";
		}

	}

	@GetMapping("/DeleteEmployee")
	public String delete(@RequestParam("id") Long id, ModelMap modelMap) throws Exception {

		try {
			employeeService.delete(Long.valueOf(id));

			return "redirect:SelectEmployee";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("ERROR_MESSAGE", e.getMessage());
			return "../employee/list.jsp";
		}
	}

	@GetMapping("/getForgotpassword")
	public String forgotpassword() {
		System.out.println("Employee->ForgotPassword");
		return "../employee/forgotpassword.jsp";
	}

	@PostMapping("/Forgotpassword")
	public String forgotPassword(@RequestParam("emailId") String emailId, ModelMap modelMap) throws Exception {

		try {

			employeeService.forgotPassword(emailId);

			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("ERROR_MESSAGE", e.getMessage());
			return "forgotpassword.jsp";
		}

	}

	@GetMapping("/changepassword")
	public String changepassword() {
		return "../employee/changepassword.jsp";
	}

	@PostMapping("/updatePassword")
	public String changePassword(@RequestParam("currentpassword") String currentpassword,
			@RequestParam("newpassword") String newpassword, ModelMap modelMap, HttpSession session) throws Exception {

		try {
			Employee emp = (Employee) session.getAttribute("LOGGED_IN_USER");
			System.out.println("UpdatePassword:" + emp);
			employeeService.changePassword(emp.getEmailId(), currentpassword, newpassword);
			session.invalidate();
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("ERROR_MESSAGE", e.getMessage());
			return "index.jsp";
		}

	}

}
