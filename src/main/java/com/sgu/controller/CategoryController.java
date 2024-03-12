package com.sgu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sgu.entity.Category;
import com.sgu.service.CategoryService;

@RestController
public class CategoryController {
	@Autowired
	CategoryService categoryService;

	@GetMapping(path = "/category")
	public ResponseEntity<List<Category>> GetCategory(){
		List<Category> listcaCategories = categoryService.findAll();
		return new ResponseEntity<>(listcaCategories, HttpStatus.OK);
	}
	
}
