package com.easywork.hengdong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.easywork.hengdong.pojo.Enterprise;
import com.easywork.hengdong.service.EnterpriseService;

@Controller
@RequestMapping("/enterprise")
public class EnterpriseController extends BaseController<Enterprise> {
	@Autowired
	private EnterpriseService enterpriseService;

}