package com.sgu.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.sgu.entity.Product;
import com.sgu.repository.ProductRepository;
import com.sgu.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductRepository productRepository;

	@Override
	public List<Product> getAllProduct() {
		return productRepository.findAll();
	}

	@Override
	public Product saveProduct(Product product) {
		return productRepository.save(product);
	}

//	@Override
//	public Product getProductById(int id) {
//		return productRepository.findById(id);
//	}

	@Override
	public Product updateProduct(Product product) {
		return productRepository.save(product);
	}

//	@Override
//	public void deleteProductById(int id) {
//		productRepository.deleteById((long) id);
//	}

	@Override
	public List<Product> findByProduct_NameContaining(String name) {
		return productRepository.findByProduct_NameContaining(name);
	}

	@Override
	public List<Product> findTop12ProductBestSellers() {
		return productRepository.findTop12ProductBestSellers();
	}

	@Override
	public List<Product> findTop12ProductNewArrivals() {
		return productRepository.findTop12ProductNewArrivals();
	}

	@Override
	public Page<Product> findAll(Pageable pageable) {
		return productRepository.findAll(pageable);
	}

	@Override
	public Page<Product> findByProduct_NameAndCategory_idContaining(String name, int category_id, Pageable pageable) {
		return productRepository.findByProduct_NameAndCategory_idContaining(name, category_id, pageable);
	}

	@Override
	public Page<Product> findByProduct_NameContaining(String name, Pageable pageable) {
		return productRepository.findByProduct_NameContaining(name, pageable);
	}

	@Override
	public List<Product> findTop4ProductByCategory_id(int id) {
		return productRepository.findTop4ProductByCategory_id(id);
	}
	
	// CRUD PRODUCT
	
//	@Autowired
//	private ProductRepository productRepository;

//	@Override
//	public void saveProduct(Product product) {
//		this.productRepository.save(product);
//	}

	@Override
	public Product getProductById(String id) {
		Optional<Product> optional = Optional.of(productRepository.findById(id));
		Product product = null;
		if (optional.isPresent()) {
			product = optional.get();
		} else {
			throw new RuntimeException(" Product not found for id :: " + id);
		}
		return product;
	}
	
	@Override
	public void deleteProductById(String id) {
		this.productRepository.deleteById(id);
	}

	@Override
	public Page<Product> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection) {
		Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).ascending() :
			Sort.by(sortField).descending();
		
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize, sort);
		return this.productRepository.findAll(pageable);
	}
	
}
