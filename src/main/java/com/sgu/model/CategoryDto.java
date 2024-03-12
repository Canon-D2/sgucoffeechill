package com.sgu.model;

import lombok.Data;

import java.util.List;
@Data
public class CategoryDto{
	private int id;
	private String category_Name;
	private String category_Image;
	private List<ProductDto> product;
}