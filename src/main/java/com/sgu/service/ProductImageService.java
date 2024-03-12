package com.sgu.service;

import com.sgu.entity.ProductImage;

public interface ProductImageService {

	void save(ProductImage productImage);

	void deleteById(int id);

}
