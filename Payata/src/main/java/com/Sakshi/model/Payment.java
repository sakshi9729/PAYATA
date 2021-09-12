package com.Sakshi.model;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Payment {
	public String _id;
	public String userId;
	public double payment;
	public String dateTimeStamp;
	
	public Payment() {
	}

	public Payment( String userId, double payment) {
		
		this.userId = userId;
		this.payment = payment;
			}

	public Map toMap() {
		Map<String, Object> map= new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("payment",payment);
		map.put("dateTimeStamp", new Date());
		return map;
	}
	@Override
	public String toString() {
		return "Payment [_id=" + _id + ", userId=" + userId + ", payment=" + payment + "]";
	}

	
	}
	
	

