package com.quiz.lesson03.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.domain.RealEstate;

@Repository
public interface RealEstateMapper {

	public RealEstate selectRealEstateById(int id);
	
	public List<RealEstate> selectRealEstateListByRentPrice(int rentPrice);
	
	public List<RealEstate> selectRealEstateListByAreaPrice(
			// MyBatis 문법 상 파라미터는 단 1개만 xml로 보낼 수 있다.
			// 파라미터들을 하나의 맵에 담아서 보낸다.
			// 맵으로 만들어주는 어노테이션 @Param
			@Param("area") int area1111111, 
			@Param("price") int price1111111);
	
	public int insertRealEstate(RealEstate realEstate);
	
	public int insertRealEstateAsField(
			@Param("realtorId") int realtorId, 
			@Param("address") String address, 
			@Param("area") int area, 
			@Param("type") String type, 
			@Param("price") int price, 
			@Param("rentPrice") Integer rentPrice);
}
