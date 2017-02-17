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
import model.EmployeeHierarchy;
import model.LeaveRole;
import model.Role;
import service.EmployeeService;

@Controller
@RequestMapping("employee")
public class EmployeeController {
	
	EmployeeService employeeSevice=new EmployeeService();

	@PostMapping("/login")
	public String login(@RequestParam("emailId") String emailId ,@RequestParam("password") String password, ModelMap modelMap, HttpSession session) {
		System.out.println("EmployeeController->login");
		
		Employee employee = new EmployeeDAO().findByEmailId(emailId,password);
		if ( employee != null ) {
		session.setAttribute("LOGGED_IN_USER", employee);
		
		return "redirect:../home.jsp";
		}
		else
		{
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
			@RequestParam("role") Long role, @RequestParam("emailId") String emailId,@RequestParam("password") String password, 
			@RequestParam("mobileNo") Long mobileNo,
			ModelMap modelMap,
			HttpSession session) throws Exception {

		try {
			Employee emp=new Employee();
			emp.setCode(code);
			emp.setName(name);
			emp.setEmailId(emailId);
			emp.setPassword(password);
			emp.setMobileNo(mobileNo);
			
			Role r=new Role();
			r.setId(role); //employeee
			emp.setRole(r);
			System.out.println(emp);
			
			EmployeeDAO dao=new EmployeeDAO();
			dao.registerEmployee(emp);
	
			//UserMailManager.sendNewRegistrationEmail(emp);
			return "redirect:../";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "../employee/register.jsp";
		}

	}
	
	@GetMapping("/SelectEmployee")
	public String list(ModelMap modelMap, HttpSession session) throws Exception {

		try {
			
			List<Employee> list = employeeSevice.list();
			System.out.println(list);
			modelMap.addAttribute("EMPLOYEE_LIST", list);

			return "../employee/list.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "/home.jsp";
		}
	}
	@GetMapping("/DeleteEmployee")
	public String delete( @RequestParam("id") Long id,
		ModelMap modelMap) throws Exception {

		try {
			employeeSevice.delete(Long.valueOf(id));

			return "redirect:SelectEmployee";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return  "../employee/list.jsp";
		}
	}
}
