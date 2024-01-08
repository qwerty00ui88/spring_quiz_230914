package com.quiz.lesson07;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson07.bo.CompanyBO;
import com.quiz.lesson07.entiry.CompanyEntity;

@RequestMapping("/lesson07/quiz01")
@RestController
public class Lesson07Quiz01RestController {
	
	@Autowired 
	private CompanyBO companyBO;
	
	// http://localhost/lesson07/quiz01/save1
	@GetMapping("/save1")
	public CompanyEntity save1() {
		return companyBO.addCompany("넥손", "컨텐츠 게임", "대기업", 3585);
	}
	
	// http://localhost/lesson07/quiz01/save2
	@GetMapping("/save2")
	public CompanyEntity save2() {		
		return companyBO.addCompany("버블팡", "여신 금융업", "대기업", 6834);
	}
	
	// http://localhost/lesson07/quiz01/update
	@GetMapping("/update")
	public CompanyEntity update() {
		return companyBO.updateCompanyScaleHeadcountById(22, "중소기업", 34);
	}
	
	// http://localhost/lesson07/quiz01/delete
	@GetMapping("/delete")
	public String delete() {
		companyBO.deleteCompanyById(22);
		return "삭제 완료";
	}
}
