package com.quiz.lesson07.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.quiz.lesson07.entiry.CompanyEntity;

public interface CompanyRepository extends JpaRepository<CompanyEntity, Integer> {
	// Spring Data JPA
	
	// 엔티티객체 save(엔티티객체);
	// Optional<엔티티객체> findById(id);
	// void delete(엔티티객체);
}
