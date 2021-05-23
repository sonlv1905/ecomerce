package com.example.demo.service.account;

import java.util.List;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Account;
import com.example.demo.respositories.*;
@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountRespository accountRespository;

	@Override
	public Account save(Account entity) {
		return accountRespository.save(entity);
	}


	@Override
	public List<Account>  saveAll(List<Account> entities) {
		return (List<Account>)accountRespository.saveAll(entities);
	}


	@Override
	public Optional<Account> findById(String id) {
		return accountRespository.findById(id);
	}

	@Override
	public boolean existsById(String id) {
		return accountRespository.existsById(id);
	}


	@Override
	public List<Account> findAll() {
		return (List<Account>)accountRespository.findAll();
	}

	@Override
	public List<Account> findAllById(List<String> ids) {
		return (List<Account>)accountRespository.findAllById(ids);
	}

	@Override
	public long count() {
		return accountRespository.count();
	}

	@Override
	public void deleteById(String id) {
		accountRespository.deleteById(id);
	}

	@Override
	public void delete(Account entity) {
		accountRespository.delete(entity);
	}

	@Override
	public void deleteAll(List<Account> entities) {
		accountRespository.deleteAll(entities);
	}

	@Override
	public void deleteAll() {
		accountRespository.deleteAll();
	}

	
	public boolean checkLogin(String username, String password) {
		Optional<Account> optional = findById(username);
		if(optional.isPresent() && optional.get().getPassword().equals(password)) {
			return true;
		}
		return false;
	}
	
	
	
	
}
