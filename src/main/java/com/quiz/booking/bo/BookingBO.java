package com.quiz.booking.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.booking.domain.Booking;
import com.quiz.booking.mapper.BookingMapper;

@Service
public class BookingBO {
	
	@Autowired
	private BookingMapper bookingMapper;
	
	public List<Booking> getBookingList() {
		return bookingMapper.selectBookingList();
	}
	
	public boolean deleteBookingById(int id) {
		int rowCount = bookingMapper.deleteBookingById(id);
		return rowCount > 0;
	}
	
	public boolean addBooking(String name, Date date, int day, int headcount, String phoneNumber) {
		int rowCount = bookingMapper.insertBooking(name, date, day, headcount, phoneNumber);
		return rowCount > 0;
	}

}
