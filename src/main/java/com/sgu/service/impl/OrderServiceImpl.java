package com.sgu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.sgu.entity.Order;
import com.sgu.repository.OrderRepository;
import com.sgu.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderRepository orderRepository;
	@Override
	public Order saveOrder(Order order) {
		return orderRepository.save(order);
	}
	@Override
	public List<Order> getAllOrderByUser_Id(String id) {
		// TODO Auto-generated method stub
		return orderRepository.findAllByUser_id(id);
	}
	@Override
	public Order findById(int id) {
		return orderRepository.findById(id);
	}
	@Override
	public List<Order> findAll() {
		return orderRepository.findAll();
	}
	@Override
	public Page<Order> findAll(Pageable pageable) {
		return orderRepository.findAll(pageable);
	}
	@Override
	public void deleteById(int id) {
		orderRepository.deleteById(id);
	}
	@Override
	public List<Order> findAllByPayment_Method(String payment_Method, String user_id) {
		return orderRepository.findAllByPayment_Method(payment_Method, user_id);
	}
	
	@Override
	public List<Order> findAllByPayment_Method(String payment_Method) {
		return orderRepository.findAllByPayment_Method(payment_Method);
	}
}
