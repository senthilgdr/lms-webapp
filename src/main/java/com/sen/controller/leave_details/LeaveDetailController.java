package com.sen.controller.leave_details;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.LeaveDetailDAO;
import model.Employee;
import model.LeaveDetail;
import model.LeaveStatus;
import model.LeaveType;
import service.EmployeeService;
import service.LeaveDetailService;
import service.LeaveStatusService;
import service.LeaveTypeService;

@Controller
public class LeaveDetailController {

	private LeaveDetailService leaveDetailService = new LeaveDetailService();

	private LeaveTypeService leaveTypeService = new LeaveTypeService();

	private EmployeeService employeeService = new EmployeeService();

	private LeaveStatusService leaveStatusService = new LeaveStatusService();

	LeaveStatus ls = new LeaveStatus();

	@GetMapping("/addLeaveDetail")
	public String create() {
		return "leave_details/add.jsp";
	}
	
	

	@GetMapping("/InsertLeaveDetail")
	public String save(@RequestParam("leaveType") Long leaveType, @RequestParam("fromDate") String fromDate,
			@RequestParam("toDate") String toDate, @RequestParam("noOfDays") String noOfDays, ModelMap modelMap,
			HttpSession session) throws Exception {

		try {

			// Step : Store in View
			LeaveDetail ld = new LeaveDetail();

			Employee emp = (Employee) session.getAttribute("LOGGED_IN_USER");
			ld.setEmployee(emp);
			LeaveType leaveTypeObj = leaveTypeService.findById(leaveType);
			ld.setLeaveType(leaveTypeObj);

			ld.setFromDate(LocalDate.parse(fromDate));
			ld.setToDate(LocalDate.parse(toDate));

			ld.setNoOfDays(Float.valueOf(noOfDays));

			LeaveStatus findById = leaveStatusService.findById(1L);// Default
																	// Status :
																	// 1 -
																	// Applied
			ld.setStatus(findById);

			System.out.println("Add Leave method:" + ld);
			// modelMap.addAttribute("INFO_MESSAGE", "Successfully Inserted");

			// Step : Invoke Dao
			leaveDetailService.save(ld);

			return "redirect:leave_details/add.jsp?INFO_MESSAGE=Successfully Leave Applied";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "leave_details/add.jsp";
		}

	}
	
		
}
