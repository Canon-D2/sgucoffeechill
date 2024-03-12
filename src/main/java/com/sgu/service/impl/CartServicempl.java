package com.sgu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgu.entity.Cart;
import com.sgu.repository.CartRepository;
import com.sgu.service.CartService;

@Service
public class CartServicempl implements CartService{

	@Autowired
	CartRepository cartRepository;

	@Override
	public void deleteById(int id) {
		cartRepository.deleteById(id);
	}
	@Override
	public List<Cart> GetAllCartByUser_id(String user_id) {
		return cartRepository.findAllByUser_id(user_id);
	}
	@Override
	public Cart saveCart(Cart cart) {
		return cartRepository.save(cart);
	}
	@Override
	public int getProductByCartId(int cart_id) {
		return cartRepository.findProductByCart_id(cart_id);
	}
}
