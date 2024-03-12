package com.sgu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgu.entity.ProductImage;
import com.sgu.repository.ProductImageRepository;
import com.sgu.service.ProductImageService;

@Service
public class ProductImageServiceImpl implements ProductImageService{
	@Autowired
	ProductImageRepository productImageRepository;

	@Override
	public void save(ProductImage productImage) {
		productImageRepository.save(productImage);
	}

	@Override
	public void deleteById(int id) {
		productImageRepository.deleteById(id);
	}
	
	
}
