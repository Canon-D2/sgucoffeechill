package com.sgu.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sgu.entity.Category;

public interface CategoryRepository extends JpaRepository<Category,Long> {
	
	Category getById(int id);

}
