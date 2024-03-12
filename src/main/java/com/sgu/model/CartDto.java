package com.sgu.model;

import lombok.Data;
@Data
public class CartDto {
	private int id;
	private int count;
//	private UserDto user;
	private ProductDto product;
}
