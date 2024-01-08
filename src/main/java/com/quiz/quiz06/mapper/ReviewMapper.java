package com.quiz.quiz06.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.quiz.quiz06.domain.Review;

@Mapper
public interface ReviewMapper {

	public List<Review> selectReviewListByStoreId(int storeId);
	
}
