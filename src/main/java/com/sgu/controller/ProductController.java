package com.sgu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sgu.entity.Product;
import com.sgu.service.CartService;
import com.sgu.service.ProductService;

@RestController
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	CartService cartService;
	
	@GetMapping(path = "/newproduct")
	public ResponseEntity<List<Product>> newProduct(){
		List<Product> newProducts = productService.findTop12ProductNewArrivals();
		return new ResponseEntity<>(newProducts, HttpStatus.OK);
	}
	
	@GetMapping(path = "/bestsellers")
	public ResponseEntity<List<Product>> bestSellers(){
		List<Product> bestSellers = productService.findTop12ProductBestSellers();
		return new ResponseEntity<>(bestSellers, HttpStatus.OK);
	}
	
	@GetMapping(path = "/search")
	public ResponseEntity<List<Product>> Search(String searchContent){
		List<Product> products = productService.findByProduct_NameContaining(searchContent);
		return new ResponseEntity<>(products, HttpStatus.OK);
	}
	
}
