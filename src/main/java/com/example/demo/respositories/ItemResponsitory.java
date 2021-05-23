package com.example.demo.respositories;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.entity.Item;
public interface ItemResponsitory extends CrudRepository<Item,Integer> {

}
