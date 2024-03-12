package com.sgu.model;

import lombok.Data;
import java.sql.Date;
import java.util.List;


@Data
public class OrderDto {
	private int id;
	private int total;
	private Date booking_Date;
	private String payment_Method;
	private String status;
	private String fullname;
	private String country;
	private String address;
	private String phone;
	private String email;
	private String note;
	private List<Order_ItemDto> order_Item;
	private UserDto user;
}
