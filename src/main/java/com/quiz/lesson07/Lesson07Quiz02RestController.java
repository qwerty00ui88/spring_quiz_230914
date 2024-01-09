package com.quiz.lesson07;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson07.entiry.RecruitEntity;
import com.quiz.lesson07.repository.RecruitRepository;

@RequestMapping("/lesson07/quiz02")
@RestController
public class Lesson07Quiz02RestController {

	@Autowired
	private RecruitRepository recruitRepository;

	// http://localhost/lesson07/quiz02/1
	@GetMapping("/1")
	public RecruitEntity getRecruitById() {
		return recruitRepository.findById(8).orElse(null);
	}

	// http://localhost/lesson07/quiz02/2?companyId=1
	@GetMapping("/2")
	public List<RecruitEntity> getRecruitListByCompanyId(@RequestParam("companyId") int companyId) {
		return recruitRepository.findByCompanyId(companyId);
	}

	// http://localhost/lesson07/quiz02/3
	@GetMapping("/3")
	public List<RecruitEntity> getRecruitListByPositionType() {
		return recruitRepository.findByPositionAndType("웹 back-end 개발자", "정규직");
	}

	// http://localhost/lesson07/quiz02/4
	@GetMapping("/4")
	public List<RecruitEntity> getRecruitListByTypeSalary() {
		return recruitRepository.findByTypeOrSalaryGreaterThanEqual("정규직", 9000);
	}

	// http://localhost/lesson07/quiz02/5
	@GetMapping("/5")
	public List<RecruitEntity> getRecruitListByType() {
		return recruitRepository.findTop3ByTypeOrderBySalaryDesc("계약직");
	}

	// http://localhost/lesson07/quiz02/6
	@GetMapping("/6")
	public List<RecruitEntity> getRecruitListByRegionSalary() {
		return recruitRepository.findByRegionAndSalaryBetween("성남시 분당구", 7000, 8500);
	}
}
