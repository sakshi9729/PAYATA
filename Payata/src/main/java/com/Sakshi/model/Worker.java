package com.Sakshi.model;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Worker {
	
   public String _id;
   public String userId;
   public String name;
   public double wage;
   public String dateTimeStamp;

   public Worker() {
}

 public Worker(String userId, String name, double wage) {
	this.userId = userId;
	this.name = name;
	this.wage = wage;
	
}
 
 public Map toMap() {
	 Map<String,Object> map= new HashMap<String,Object>();
	 map.put("userId", userId);
	 map.put("name", name);
	 map.put("wage", wage);
	 map.put("dateTimeStamp", new Date());
	 return map;
			 
 }

@Override
public String toString() {
	return "Worker [_id=" + _id + ", userId=" + userId + ", name=" + name + ", wage=" + wage + "]";
}


   
}
