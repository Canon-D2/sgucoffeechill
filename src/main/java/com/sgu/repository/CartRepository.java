package com.sgu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sgu.entity.Cart;

public interface CartRepository extends JpaRepository<Cart,Integer>{

//	@Query(value="DELETE FROM `cart` e WHERE e.id= ?1",nativeQuery = true)
//	void deleteById(int id);

	List<Cart> findAllByUser_id(String user_id);
	
	
	@Query(value="select product_id from sgucoffee.cart where id = ?",nativeQuery = true)
	int findProductByCart_id(int cart_id);
}
