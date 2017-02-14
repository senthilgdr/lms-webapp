package com.sen.controller.leave_role;


import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import model.Employee;
import model.LeaveRole;
import service.LeaveRoleService;


@Controller
public class LeaveRoleController {

	private LeaveRoleService leaveRoleService = new LeaveRoleService();

	
	@GetMapping("/SelectLeaveRole")
	public String list(ModelMap modelMap,HttpSession session) throws Exception {

		try {
				
			List<LeaveRole> list = leaveRoleService.list();
			System.out.println(list);
			modelMap.addAttribute("LEAVE_ROLE_LIST", list);

			return "leave_role/list.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "/home.jsp";
		}
	}
	
	@GetMapping("/SelectMyLeaveRole")
	public String myLeaveRole(ModelMap modelMap,HttpSession session) throws Exception {

		try {
			Employee employee = (Employee) session.getAttribute("LOGGED_IN_USER");
			System.out.println("Leave Detail Listed");
			
			LeaveRole leaveRole = leaveRoleService.findByRoleId(employee.getRole().getId());
			System.out.println(leaveRole);
			modelMap.addAttribute("LEAVE_ROLE", leaveRole);

			return "leave_role/myLeaveRoleList.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "/home.jsp";
		}
	}
			
}
