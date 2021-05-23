package com.example.demo.service.product;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Item;
import com.example.demo.respositories.ItemResponsitory;
@Service
public class ItemServiceImpl implements ItemService{

	@Autowired
	ItemResponsitory itemResponsitory;
	
	@Override
	public Item save(Item entity) {
		return itemResponsitory.save(entity);
	}

	@Override
	public List<Item> saveAll(List<Item> entities) {
		return (List<Item>)itemResponsitory.saveAll(entities);
	}

	@Override
	public Optional<Item> findById(Integer id) {
		return itemResponsitory.findById(id);
	}

	@Override
	public boolean existsById(Integer id) {
		return itemResponsitory.existsById(id);
	}

	@Override
	public List<Item> findAll() {
		return (List<Item>)itemResponsitory.findAll();
	}

	@Override
	public List<Item> findAllById(Iterable<Integer> ids) {
		return (List<Item>)itemResponsitory.findAllById(ids);
	}

	@Override
	public long count() {
		return itemResponsitory.count();
	}

	@Override
	public void deleteById(Integer id) {
		itemResponsitory.deleteById(id);
	}

	@Override
	public void delete(Item entity) {
		itemResponsitory.delete(entity);
	}

	@Override
	public void deleteAll(Iterable<? extends Item> entities) {
		itemResponsitory.deleteAll(entities);
	}

	@Override
	public void deleteAll() {
		itemResponsitory.deleteAll();
	}
	
}
