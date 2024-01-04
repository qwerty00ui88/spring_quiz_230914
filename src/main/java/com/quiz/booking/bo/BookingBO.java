package com.quiz.booking.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.booking.domain.Booking;
import com.quiz.booking.mapper.BookingMapper;

@Service
public class BookingBO {
	
	@Autowired
	private BookingMapper bookingMapper;
	
	public List<Booking> getBookingList() {
		return bookingMapper.selectBookingList();
	}
	
	public int deleteBookingById(int id) {
		return bookingMapper.deleteBookingById(id);
	}
	
	public void addBooking(String name, String date, int day, int headcount, String phoneNumber) {
		bookingMapper.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	public Booking getBookingByNamePhoneNumber(String name, String phoneNumber) {
		
		Date currentDate = new Date();
		Booking nearestBooking = null;
				
		for(Booking x : bookingMapper.selectBookingListByNamePhoneNumber(name, phoneNumber)) {
			if(currentDate.compareTo(x.getDate()) > 0) continue;
			else if(nearestBooking == null || nearestBooking.getDate().compareTo(x.getDate()) >= 0) nearestBooking = x;
		}
		
		return nearestBooking;
	}

}
