package com.easywork.hengdong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.easywork.hengdong.pojo.Person;
import com.easywork.hengdong.service.PersonService;

@Controller
@RequestMapping("/person")
public class PersonController extends BaseController<Person> {
	@Autowired
	private PersonService personService;

}