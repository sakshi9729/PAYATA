package com.Sakshi.model;

import java.util.HashMap;

import java.util.Map;

public class User {

	public String _id;
    public String name;
    public String email;
    public String password;
            
   public User() {
   }

    public User(String name, String email, String password) {
	this.name = name;
	this.email = email;
	this.password = password;
}
    public String getName() {
		return name;
	}


	public void setName(String name) {
		if(name.length()<2) {
			System.out.println("Invalid Name");
		}else {
			this.name = name;
			System.out.println("Name Set");
		}
	}
		
		
	public Map toMap() {
		Map<String,Object> map= new HashMap<String, Object>();
		map.put("name", name);
		map.put("email", email);
		map.put("password", password);
		return map;
		
		
	}
	
    @Override
	public String toString() {
		return "User [name=" + name + ", email=" + email + ", password=" + password + "]";
	}
	
    
   
  
}
