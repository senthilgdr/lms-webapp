package com.sen.controller.Holidays;


import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import model.Holiday;
import service.HolidayService;


@Controller
public class HolidayController {

	private HolidayService HolidayService = new HolidayService();

	
	@GetMapping("/SelectHoliday")
	public String list(ModelMap modelMap,HttpSession session) throws Exception {

		try {
				
			List<Holiday> list = HolidayService.list();
			System.out.println(list);
			modelMap.addAttribute("HOLIDAY_LIST", list);

			return "holiday/list.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "/home.jsp";
		}
	}
			
}
