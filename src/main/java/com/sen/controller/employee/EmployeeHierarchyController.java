package com.sen.controller.employee;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.EmployeeHierarchyDAO;
import model.Employee;
import model.EmployeeHierarchy;
import service.EmployeeHierarchyService;

@Controller
@RequestMapping("employeeHierarchy")
public class EmployeeHierarchyController {
	EmployeeHierarchyService employeeHierarchyService = new EmployeeHierarchyService();

	@GetMapping("/addEmployeeHierarchy")
	public String create() {
		return "../employeeHierarchy/add.jsp";
	}

	@GetMapping("/InsertEmployeeHierarchy")
	public String save(@RequestParam("empId") Integer empId, @RequestParam("mgrId") Integer mgrId, ModelMap modelMap,
			HttpSession session) throws Exception {

		try {
			EmployeeHierarchy employeeHierarchy = new EmployeeHierarchy();
			employeeHierarchy.setEmpId(empId);
			employeeHierarchy.setMgrId(mgrId);

			employeeHierarchyService.insert(employeeHierarchy);
			System.out.println(employeeHierarchy);

			return "redirect:SelectEmployeeHierarchy";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "../employeeHierarchy/add.jsp";
		}

	}

	@GetMapping("/SelectEmployeeHierarchy")
	public String list(ModelMap modelMap, HttpSession session) throws Exception {

		try {

			List<EmployeeHierarchy> list = employeeHierarchyService.list();
			System.out.println(list);
			modelMap.addAttribute("EMPLOYEE_HIERARCHY_LIST", list);

			return "../employeeHierarchy/list.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "/home.jsp";
		}
	}

	@GetMapping("/SelectMyTeamHierarchy")
	public String listMyTeam(ModelMap modelMap, HttpSession session) throws Exception {

		try {
			Employee employee = (Employee) session.getAttribute("LOGGED_IN_USER");
			List<EmployeeHierarchy> list = employeeHierarchyService.listMyTeam(employee.getId());
			System.out.println(list);
			modelMap.addAttribute("EMPLOYEE_HIERARCHY_LIST", list);

			return "../employeeHierarchy/list.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "/home.jsp";
		}
	}

	@GetMapping("/EditEmployeeHierarchy")
	public String edit(@RequestParam("id") Long id, ModelMap modelMap) throws Exception {

		try {

			EmployeeHierarchy ld = new EmployeeHierarchyDAO().findById(id);
			modelMap.addAttribute("EDIT_EMPLOYEE_HIERARCHY", ld);

			return "../employeeHierarchy/edit.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "../employeeHierarchy/list.jsp";
		}

	}

	@GetMapping("/UpdateEmployeeHierarchy")
	public String update(@RequestParam("id") Long id, @RequestParam("empId") Integer empId,
			@RequestParam("mgrId") Integer mgrId, ModelMap modelMap, HttpSession session) throws Exception {

		try {

			// Step : Store in View
			EmployeeHierarchy employeeHierarchy = employeeHierarchyService.findById(id);
			employeeHierarchy.setMgrId(mgrId);

			Employee emp = (Employee) session.getAttribute("LOGGED_IN_USER");
			employeeHierarchy.setEmpId(empId);

			employeeHierarchyService.update(employeeHierarchy);

			return "redirect:SelectEmployeeHierarchy?INFO_MESSAGE=Successfully EmployeeHierarchy Updated";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "EditEmployeeHierarchy";
		}

	}

	@GetMapping("/DeleteEmployeeHierarchy")
	public String delete(@RequestParam("id") Long id, ModelMap modelMap) throws Exception {

		try {
			employeeHierarchyService.delete(Long.valueOf(id));

			return "redirect:SelectEmployeeHierarchy";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "../employeeHierarchy/list.jsp";
		}
	}
}
