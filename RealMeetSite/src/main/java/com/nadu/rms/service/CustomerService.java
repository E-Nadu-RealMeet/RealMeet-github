package com.nadu.rms.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.nadu.rms.dao.CustomerDAO;
import com.nadu.rms.vo.Notices;

public class CustomerService {

	CustomerDAO customerDAO;

	public void setCustomerDAO(CustomerDAO customerDAO) {
		this.customerDAO = customerDAO;
	}
	
	public String NoticesListLoad(HttpServletRequest req){
		Gson gson = new Gson();
		List<Notices> Notices = customerDAO.selectNotices();
		
		return gson.toJson(Notices);
		
	}
}
