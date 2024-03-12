package com.sgu.service;

import java.util.List;

import com.sgu.entity.Order_Item;

public interface Order_ItemService {

	List<Order_Item> getAllByOrder_Id(int id);
	public Order_Item saveOrder_Item(Order_Item order_Item);
	void deleteById(int id);
}
