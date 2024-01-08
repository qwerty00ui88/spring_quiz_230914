package com.quiz.lesson07.bo;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson07.entiry.CompanyEntity;
import com.quiz.lesson07.repository.CompanyRepository;

@Service
public class CompanyBO {
	
	@Autowired
	private CompanyRepository companyRepository;
	
	public CompanyEntity addCompany(String name, String business, String scale, int headcount) {

		return companyRepository.save(CompanyEntity.builder()
									.name(name)
									.business(business)
									.scale(scale)
									.headcount(headcount)
									.build());
	}
	
	public CompanyEntity updateCompanyScaleHeadcountById(int id, String scale, int headcount) {
		// select
		CompanyEntity company = companyRepository.findById(id).orElse(null);
		
		if(company != null) {
			// select한 엔티티 변경
			company = company.toBuilder()
					.scale(scale)
					.headcount(headcount)
					.build();
			
			// 변경한 엔티티 보냄 -> return되는 엔티티로 다시 저장
			company = companyRepository.save(company);
		}
		
		return company;
	}
	
	public void deleteCompanyById(int id) {
		Optional<CompanyEntity> companyOptional = companyRepository.findById(id);
		companyOptional.ifPresent(c -> companyRepository.delete(c));
	}
	
}
