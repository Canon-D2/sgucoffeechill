package com.sgu.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.sgu.entity.Order;

public interface OrderService {

	public Order saveOrder(Order order);
	
	List<Order> getAllOrderByUser_Id(String id);

	Order findById(int id);

	List<Order> findAll();

	Page<Order> findAll(Pageable pageable);

	void deleteById(int id);

	List<Order> findAllByPayment_Method(String payment_Method, String user_id);

	List<Order> findAllByPayment_Method(String payment_Method);
}
