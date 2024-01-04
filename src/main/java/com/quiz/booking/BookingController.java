package com.quiz.booking;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.booking.bo.BookingBO;
import com.quiz.booking.domain.Booking;

@RequestMapping("/booking")
@Controller
public class BookingController {

	@Autowired
	private BookingBO bookingBO;
	
	// http://localhost/booking/check-booking-view
	@GetMapping("/check-booking-view")
	public String checkBookingView() {
		return "booking/checkBooking";
	}
	
	// http://localhost/booking/booking-list-view
	@GetMapping("/booking-list-view")
	public String bookingListView(Model model) {
		// select
		List<Booking> bookingList = bookingBO.getBookingList();
		// model
		model.addAttribute("bookingList", bookingList);
		// view
		return "booking/bookingList";
	}
	
	@DeleteMapping("/delete-booking")
	@ResponseBody
	public Map<String, Object> deleteBooking(@RequestParam("id") int id) {
		// delete
		boolean isDeleted = bookingBO.deleteBookingById(id);
		
		// result
		Map<String, Object> result = new HashMap<>();
		if(isDeleted) {
			result.put("code", 200);
			result.put("result", "삭제 성공");
		} else {
			result.put("code", 500);
			result.put("error_message", "해당 id가 존재하지 않습니다.");
		}
		
		//return
		return result;
	}
	
	// http://localhost/booking/make-booking-view
	@GetMapping("/make-booking-view")
	public String makeBookingView() {
		return "booking/makeBooking";
	}
	
	@PostMapping("/make-booking")
	@ResponseBody
	public Map<String, Object> makeBooking(
			@RequestParam("name") String name, 
			@RequestParam("date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber) {
		// insert
		boolean isSuccess = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		// result
		Map<String, Object> result = new HashMap<>();
		if(isSuccess) {
			result.put("code", 200);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("error_message", "예약에 실패했습니다.");
		}
		
		// return
		return result;
	}
	
}
