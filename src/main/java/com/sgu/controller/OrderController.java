package com.sgu.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sgu.entity.Cart;
import com.sgu.entity.Order;
import com.sgu.entity.Order_Item;
import com.sgu.entity.User;
import com.sgu.model.OrderDto;
import com.sgu.service.CartService;
import com.sgu.service.OrderService;
import com.sgu.service.Order_ItemService;
import com.sgu.service.ProductService;
import com.sgu.service.UserService;

@RestController
public class OrderController {
	@Autowired 
	OrderService orderService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	Order_ItemService order_ItemService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
    private ModelMapper modelMapper;
	
	@PostMapping(path = "/placeorder", consumes = "application/x-www-form-urlencoded")
	public ResponseEntity<Order> placeOrder(String user_id, String fullname, String phoneNumber, String address, String paymentMethod){
		List<Cart> listCart = cartService.GetAllCartByUser_id(user_id);
		Order newOrder = new Order();
		User user = userService.findByIdAndRole(user_id, "user");
		long millis = System.currentTimeMillis();
		Date booking_date = new java.sql.Date(millis);
		int total=0;
		for(Cart y: listCart) {
			total += y.getProduct().getPrice() * y.getCount();
		}
		newOrder.setUser(user);
		newOrder.setFullname(fullname);
		newOrder.setBooking_Date(booking_date);
		newOrder.setCountry("Việt Nam");
		newOrder.setEmail(user.getEmail());
		newOrder.setPayment_Method(paymentMethod);
		newOrder.setAddress(address);
		newOrder.setNote(null);
		newOrder.setPhone(phoneNumber);
		newOrder.setStatus("Pending");
		newOrder.setTotal(total);
		
		newOrder = orderService.saveOrder(newOrder);
		
		for(Cart y:listCart) {
			if(y.getCount()>y.getProduct().getQuantity()) {
				orderService.deleteById(newOrder.getId());
				return new ResponseEntity<>(null, HttpStatus.OK);
			}
			y.getProduct().setQuantity(y.getProduct().getQuantity()-y.getCount());
			y.getProduct().setSold(y.getProduct().getSold()+y.getCount());
			productService.saveProduct(y.getProduct());
			Order_Item newOrder_Item = new Order_Item();
			newOrder_Item.setCount(y.getCount());
			newOrder_Item.setOrder(newOrder);
			newOrder_Item.setProduct(y.getProduct());
			newOrder_Item = order_ItemService.saveOrder_Item(newOrder_Item);
			cartService.deleteById(y.getId());
		}
		newOrder = orderService.findById(newOrder.getId());
		return new ResponseEntity<>(newOrder, HttpStatus.OK);
	}
	
	@GetMapping(path = "/order")
	public ResponseEntity<List<OrderDto>> getOrder(String user_id){
		System.out.println(user_id);
		List<Order> listOrder = orderService.getAllOrderByUser_Id(user_id);
		List<OrderDto> listOrderDto = new ArrayList<>();
		for(Order o: listOrder) {
			OrderDto orderDto = modelMapper.map(o, OrderDto.class);
			System.out.println(orderDto.getId());
			listOrderDto.add(orderDto);
		}
		return new ResponseEntity<>(listOrderDto, HttpStatus.OK);
	}
	
	@GetMapping(path = "/ordermethod")
	public ResponseEntity<List<OrderDto>> getOrderByPaymentMethod(String user_id, String method){
		System.out.println(user_id);
		List<Order> listOrder = orderService.findAllByPayment_Method(method, user_id);
		List<OrderDto> listOrderDto = new ArrayList<>();
		for(Order o: listOrder) {
			OrderDto orderDto = modelMapper.map(o, OrderDto.class);
			
			listOrderDto.add(orderDto);
		}
		for(Order o: listOrder) {
		System.out.println(o.getId());
		}
		return new ResponseEntity<>(listOrderDto, HttpStatus.OK);
	}
}
