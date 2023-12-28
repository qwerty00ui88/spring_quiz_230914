package com.quiz.quiz06.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.quiz06.domain.Review;

@Repository
public interface ReviewMapper {

	public List<Review> selectReviewListByStoreId(int storeId);
	
}
