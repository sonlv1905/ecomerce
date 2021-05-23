package com.example.demo.service.category;

import java.util.List;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Category;
import com.example.demo.respositories.*;
@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	CategoryRespository categoryRespository;

	@Override
	public Category save(Category entity) {
		return categoryRespository.save(entity);
	}

	@Override
	public List<Category> saveAll(List<Category> entities) {
		return (List<Category>)categoryRespository.saveAll(entities);
	}

	@Override
	public Optional<Category> findById(int id) {
		return categoryRespository.findById(id);
	}

	@Override
	public boolean existsById(int id) {
		return categoryRespository.existsById(id);
	}

	@Override
	public List<Category> findAll() {
		return (List<Category>)categoryRespository.findAll();
	}

	@Override
	public List<Category> findAllById(Iterable<Integer> ids) {
		return (List<Category>)categoryRespository.findAllById(ids);
	}

	@Override
	public long count() {
		return categoryRespository.count();
	}

	@Override
	public void deleteById(int id) {
		categoryRespository.deleteById(id);
	}

	@Override
	public void delete(Category entity) {
		categoryRespository.delete(entity);
	}

	@Override
	public void deleteAll(List<Category> entities) {
		categoryRespository.deleteAll(entities);
	}

	@Override
	public void deleteAll() {
		categoryRespository.deleteAll();
	}

	
		
	
	
	
}
