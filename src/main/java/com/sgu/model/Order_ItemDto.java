package com.sgu.model;

import lombok.Data;
@Data
public class Order_ItemDto{
	private int id;
	private int count;
	private ProductDto product;
//	private OrderDto order;
}
