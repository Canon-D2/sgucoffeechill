package com.sgu.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sgu.entity.ProductImage;

public interface ProductImageRepository extends JpaRepository<ProductImage,Integer>{

	void deleteById(int id);

}
