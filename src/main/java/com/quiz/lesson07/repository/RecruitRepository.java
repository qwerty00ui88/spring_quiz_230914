package com.quiz.lesson07.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.quiz.lesson07.entiry.RecruitEntity;

public interface RecruitRepository extends JpaRepository<RecruitEntity, Integer> {
	
	// JPQL => Entity에 조회
	public List<RecruitEntity> findByCompanyId(int companyId); // quiz02_2
	public List<RecruitEntity> findByPositionAndType(String position, String type); // quiz02_3
	public List<RecruitEntity> findByTypeOrSalaryGreaterThanEqual(String type, int salary); // quiz02_4
	public List<RecruitEntity> findTop3ByTypeOrderBySalaryDesc(String type); // quiz02_5
	public List<RecruitEntity> findByRegionAndSalaryBetween(String region, int salaryStart, int salaryEnd); // quiz02_6

	@Query(value = "select * from `recruit` "
			+ "where  `deadline` > :deadline "
			+ "and `salary` >= :salary "
			+ "and `type` = :type "
			+ "order by `salary` desc"
			, nativeQuery = true)
	public List<RecruitEntity> findDeadlineSalaryType(
			@Param("deadline") String deadline,
			@Param("salary") int salary, 
			@Param("type") String type);
}
