package com.easywork.hengdong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.easywork.hengdong.pojo.Person;
import com.easywork.hengdong.dao.PersonMapper;

@Transactional
@Service
public class PersonService {
	@Autowired
	private PersonMapper personMapper;

	public PersonMapper getPersonMapper() {
		return personMapper;
	}

}