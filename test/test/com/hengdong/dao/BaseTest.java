package com.hengdong.dao;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easywork.hengdong.dao.PersonMapper;
import com.easywork.hengdong.pojo.Person;

/**
 * 测试mybatis和spring是否整合成功
 * @author 柳龙
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)// 添加spring测试方案  
@ContextConfiguration({"classpath:spring/spring-application.xml"})// 指定spring配置文件位置 
public class BaseTest {
	@Autowired
	PersonMapper personMapper;
	
	
	@Test
	public void test(){
		Person person = new Person();
		person.setBirthDate("111");
		int insert = personMapper.insert(person);
		System.out.println("BaseTest.test()");
		System.err.println(insert);
	}

}
