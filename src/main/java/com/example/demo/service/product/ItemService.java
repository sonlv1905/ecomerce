package com.example.demo.service.product;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.demo.entity.Item;
import com.example.demo.respositories.ItemResponsitory;

public interface ItemService {

	void deleteAll();

	void deleteAll(Iterable<? extends Item> entities);

	void delete(Item entity);

	void deleteById(Integer id);

	long count();

	List<Item> findAllById(Iterable<Integer> ids);

	List<Item> findAll();

	boolean existsById(Integer id);

	Optional<Item> findById(Integer id);

	List<Item> saveAll(List<Item> entities);

	Item save(Item entity);

}
