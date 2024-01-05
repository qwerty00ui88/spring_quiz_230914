package com.quiz.lesson07;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson07.bo.CompanyBO;

@RequestMapping("/lesson07")
@RestController
public class Lesson07Quiz01RestController {
	
	@Autowired 
	private CompanyBO companyBO;
	
}
