package com.easywork.hengdong.pojo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.jy.controller.base.BaseController;

@Controller
@RequestMapping("/demo")
public class DemoController extends BaseController {

	@RequestMapping("/view")
	public String view() {
		return "/demo/view";
	}

	@RequestMapping("/tabOrPop/{view}")
	public String tabOrPop(@PathVariable("view") String view) {
		return "/demo/" + view;
	}

}