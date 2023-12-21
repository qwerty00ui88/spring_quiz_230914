package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.domain.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {

	@Autowired
	private SellerBO sellerBO;
	
	// http://localhost/lesson04/quiz01/add-seller-view
	@GetMapping("/add-seller-view")
	public String addSellerView() {
		return "lesson04/addSeller";
	}
	
	@PostMapping("/add-seller")
	public String addSeller(
			@RequestParam("nickname") String nickname, 
			@RequestParam(value = "profileImageUrl", required = false) String profileImageUrl, 
			@RequestParam(value = "temperature") double temperature) {
		
		// insert
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		// 모델 등록X - 뷰에 넘길 데이터 없음
		
		// 뷰 경로 반환
		return "lesson04/afterAddSeller";
	}
	
	// http://localhost/lesson04/quiz01/seller-info-view
	// http://localhost/lesson04/quiz01/seller-info-view?id=1
	@GetMapping("/seller-info-view")
	public String sellerInfoView(
			@RequestParam(value = "id", required = false) Integer id, 
			Model model) {
		
		// get
		Seller seller = null;
		if(id == null) {
			seller = sellerBO.getLatestSeller();
		} else {
			seller = sellerBO.getSellerById(id);
		}
		
		// 모델 등록
		model.addAttribute("seller", seller);
		model.addAttribute("title", "판매자 정보");
		
		// 뷰 경로 반환
		return "lesson04/sellerInfo";
	}
	
}
