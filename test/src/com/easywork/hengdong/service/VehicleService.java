package com.easywork.hengdong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.easywork.hengdong.pojo.Vehicle;
import com.easywork.hengdong.dao.VehicleMapper;

@Transactional
@Service
public class VehicleService {
	@Autowired
	private VehicleMapper vehicleMapper;

	public VehicleMapper getVehicleMapper() {
		return vehicleMapper;
	}

}