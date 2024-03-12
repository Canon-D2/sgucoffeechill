package com.sgu.model;

import lombok.Data;

@Data
public class UserDto{
	private String id;
	private String login_Type;
	private String role;
	private String password;
	private String user_Name;
	private String avatar;
	private String email;
	private String phone_Number;
//	private List<Order> order;
//	private List<Cart> cart;
}
