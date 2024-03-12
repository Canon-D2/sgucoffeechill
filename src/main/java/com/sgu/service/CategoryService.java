package com.sgu.service;

import java.util.List;

import com.sgu.entity.Category;

public interface CategoryService {
	
	Category saveCategory(Category category);

	Category getCategoryById(int id);

	Category updateCategory(Category category);
	
	List<Category> findAll();

	void deleteCategoryId(int id);
}
