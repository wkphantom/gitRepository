package com.easywork.hengdong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.easywork.hengdong.pojo.Enterprise;
import com.easywork.hengdong.dao.EnterpriseMapper;

@Transactional
@Service
public class EnterpriseService {
	@Autowired
	private EnterpriseMapper enterpriseMapper;

	public EnterpriseMapper getEnterpriseMapper() {
		return enterpriseMapper;
	}
	

}