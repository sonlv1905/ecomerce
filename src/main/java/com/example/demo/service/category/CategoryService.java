package com.example.demo.service.category;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.demo.entity.Account;
import com.example.demo.entity.Category;
import com.example.demo.respositories.AccountRespository;
import com.example.demo.respositories.CategoryRespository;

public interface CategoryService {

	void deleteAll();

	void deleteAll(List<Category> entities);

	void delete(Category entity);

	void deleteById(int id);

	long count();

	List<Category> findAllById(Iterable<Integer> ids);

	List<Category> findAll();

	boolean existsById(int id);

	Optional<Category> findById(int id);

	List<Category> saveAll(List<Category> entities);

	Category save(Category entity);
	
}
