package com.sen.controller.holidays;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.Holiday;
import service.HolidayService;

@Controller
public class HolidayController {

	private HolidayService holidayService = new HolidayService();

	@GetMapping("/SelectHoliday")
	public String list(ModelMap modelMap, HttpSession session) throws Exception {

		try {

			List<Holiday> list = holidayService.list();
			System.out.println(list);
			modelMap.addAttribute("HOLIDAY_LIST", list);

			return "holiday/list.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "/home.jsp";
		}
	}

	@GetMapping("/addHolidayDetail")
	public String create() {
		return "holiday/add.jsp";
	}

	@GetMapping("/InsertHolidayDetail")
	public String save(@RequestParam("holidayDate") String holidayDate, @RequestParam("reason") String reason,
			ModelMap modelMap, HttpSession session) throws Exception {

		try {

			// Step : Store in View
			Holiday holiday = new Holiday();
			holiday.setHolidayDate(LocalDate.parse(holidayDate));
			holiday.setStatus(reason);

			holidayService.save(holiday);

			return "redirect:addHolidayDetail?INFO_MESSAGE=Successfully Added";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "addHolidayeDetail";
		}
	}

	@GetMapping("/DeleteHolidayDetail")
	public String delete(@RequestParam("id") Long id, ModelMap modelMap) throws Exception {

		try {
			holidayService.delete(Long.valueOf(id));

			return "redirect:SelectHoliday";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "holiday/list.jsp";
		}

	}

	@GetMapping("/EditHolidayDetail")
	public String edit(@RequestParam("id") Long id, ModelMap modelMap) throws Exception {

		try {

			Holiday ld = holidayService.findById(id);
			modelMap.addAttribute("EDIT_HOLIDAY", ld);

			return "holiday/edit.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "holiday/list.jsp";
		}

	}

	@GetMapping("/UpdateHolidayDetail")
	public String update(@RequestParam("id") Long id, @RequestParam("holidayDate") String holidayDate,
			@RequestParam("reason") String reason, ModelMap modelMap, HttpSession session) throws Exception {

		try {

			Holiday holiday = new Holiday();
			holiday.setId(id);
			holiday.setHolidayDate(LocalDate.parse(holidayDate));
			holiday.setStatus(reason);

			holidayService.update(holiday);

			return "redirect:/SelectHoliday?INFO_MESSAGE=Successfully Holidays Updated";
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("errorMessage", e.getMessage());
			return "EditHolidayDetail";
		}

	}

}
