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
	public String create1() {
		String name = "넥손";
		String business = "컨텐츠 게임";
		String scale = "대기업";
		int headcount = 3585;
		
		CompanyEntity company = companyBO.addCompany(name, business, scale, headcount);
		
		return "<div>회사명 : " + company.getName() + "</div>"
				+ "<div>사업내용 : " + company.getBusiness() + "</div>"
				+ "<div>규모 : " + company.getScale() + "</div>"
				+ "<div>사원수 : " + company.getHeadcount() + "명</div>";
	}
	
	// http://localhost/lesson07/quiz01/save2
	@GetMapping("/save2")
	public String create2() {
		String name = "버블팡";
		String business = "여신 금융업";
		String scale = "대기업";
		int headcount = 6834;
		
		CompanyEntity company = companyBO.addCompany(name, business, scale, headcount);
		
		return "<div>회사명 : " + company.getName() + "</div>"
				+ "<div>사업내용 : " + company.getBusiness() + "</div>"
				+ "<div>규모 : " + company.getScale() + "</div>"
				+ "<div>사원수 : " + company.getHeadcount() + "명</div>";
	}
	
}
