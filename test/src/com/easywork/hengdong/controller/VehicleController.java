package com.easywork.hengdong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.easywork.hengdong.pojo.Vehicle;
import com.easywork.hengdong.service.VehicleService;

@Controller
@RequestMapping("/vehicle")
public class VehicleController extends BaseController<Vehicle> {
	@Autowired
	private VehicleService vehicleService;

}