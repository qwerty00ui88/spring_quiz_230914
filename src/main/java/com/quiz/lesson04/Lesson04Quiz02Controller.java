package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.domain.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02Controller {

	@Autowired
	private RealtorBO realtorBO;
	
	// http://localhost/lesson04/quiz02/add-realtor-view
	@GetMapping("/add-realtor-view")
	public String addRealtorView() {
		return "lesson04/addRealtor";
	}
	
	@PostMapping("/add-realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor, 
			Model model) {
		// insert => 방금 추가된 pk 받아옴 => realtor에 세팅
		realtorBO.addRealtor(realtor);
		
		// realtor에 세팅된 id로 객체 다시 조회(방금 추가됨)
		Realtor latestRealtor = realtorBO.getRealtorById(realtor.getId());
		
		// model
		model.addAttribute("realtor", latestRealtor);
		
		// view
		return "lesson04/afterAddRealtor";
	}
	
}
