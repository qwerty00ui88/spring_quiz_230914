package com.quiz.quiz06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.quiz06.domain.Review;
import com.quiz.quiz06.mapper.ReviewMapper;

@Service
public class ReviewBO {
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	public List<Review> getReviewListByStoreId(int storeId) {
		return reviewMapper.selectReviewListByStoreId(storeId);
	}
}
