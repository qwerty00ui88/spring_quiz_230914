package com.quiz.quiz06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.domain.Store;
import com.quiz.quiz06.bo.ReviewBO;
import com.quiz.quiz06.domain.Review;

@RequestMapping("/quiz06")
@Controller
public class Quiz06Controller {

	@Autowired
	private StoreBO storeBO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	// http://localhost/quiz06/store-list-view
	@GetMapping("/store-list-view")
	public String storeListView(Model model) {
		
		// select
		List<Store> storeList = storeBO.getStoreList();
		
		// model
		model.addAttribute("page", "store");
		model.addAttribute("title", "우리동네 가게");
		model.addAttribute("storeList", storeList);
		
		// view
		return "quiz06/template";
	}

	// http://localhost/quiz06/review-list-view?storeId=1&storeName=교촌치킨
	@GetMapping("/review-list-view")
	public String reviewListView(
			@RequestParam("storeId") int storeId
			, @RequestParam("storeName") String storeName
			, Model model) {
		
		// select
		List<Review> reviewList = reviewBO.getReviewListByStoreId(storeId);
		
		// model
		model.addAttribute("page", "review");
		model.addAttribute("title", storeName + " - 리뷰");
		model.addAttribute("reviewList", reviewList);
		
		// view
		return "quiz06/template";
	}

}
