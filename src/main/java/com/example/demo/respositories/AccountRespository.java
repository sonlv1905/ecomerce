package com.example.demo.respositories;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.entity.*;
public interface AccountRespository extends CrudRepository<Account, String>{

}
