package com.sgu.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.sgu.entity.User;

public interface UserService {
	
	List<User> getAllUser();

	User saveUser(User user);

	User updateUser(User user);

	void deleteUserById(String id);
	
	User GetUserByEmail(String email);

	User findByIdAndRole(String id, String role);

	List<User> findAll();    
	
	// ADD FUNCTION USER

	//void saveUser(User user);
	
	User getUserById(String id);

	Page<User> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection);
}
