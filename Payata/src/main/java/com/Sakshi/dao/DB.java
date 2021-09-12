package com.Sakshi.dao;

import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import java.util.ArrayList;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.Sakshi.model.Payment;
import com.Sakshi.model.User;
import com.Sakshi.model.Worker;
import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCursor;

public class DB {
	MongoClient mongoClient;

	public  DB() {
		
		try {
			String connectionURL = "mongodb+srv://root:sakshi@cluster0.ynsom.mongodb.net/session24?retryWrites=true&w=majority";
	    	mongoClient = MongoClients.create(connectionURL);
	    	
	    System.out.println(getClass().getSimpleName()+"Mongo DB connection created and refernce to client Object obtained");
		} catch (Exception e) {
			System.out.println("Something Went Wrong: "+e);
		}
		
	}
   
	public boolean registerUser(User user) {
		
		Document document= new Document(user.toMap());
		  
		// Insert into DataBase
		  mongoClient.getDatabase("Payata").getCollection("users").insertOne(document);
		  System.out.println(user.getName()+" : Registered in MongoDB");
		return true;
	}

	public boolean logPayment(Payment payment) {
		
		Document document = new Document(payment.toMap());
    	
    	//Insert into DataBase
    	mongoClient.getDatabase("Payata").getCollection("payments").insertOne(document);
    	System.out.println(payment.userId+" "+payment.payment+" Payment Saved in MongoDB");
		
		return true;
	}
	
public boolean logWorker(Worker worker) {
		
		Document document = new Document(worker.toMap());
    	
    	//Insert into DataBase
    	mongoClient.getDatabase("Payata").getCollection("workers").insertOne(document);
    	System.out.println(worker.userId+" "+worker.name+""+worker.wage+" Workers Record Saved in MongoDB");
		
		return true;
	}
	 public boolean loginUser(User user) {
			BasicDBObject query=new  BasicDBObject();
			query.put("email", user.email);
			query.put("password", user.password);
			
			// Fetching the Data
		  	MongoCursor<Document> cursor = mongoClient.getDatabase("Payata").getCollection("users").find(query).iterator();
		  //	while(cursor.hasNext()) {
		  		//System.out.println(cursor.next());
		  		//System.out.println(cursor.next().toJson());
		  	//}
		  	
		  	boolean flag=cursor.hasNext();
		  	if(flag) {
		  		
	    		//System.out.println(cursor.next().toJson());
	    		Document document = cursor.next();
	    		System.out.println(document.getObjectId("_id"));
	    		System.out.println(document.getString("name"));
	    		
	    		user._id = document.getObjectId("_id").toString();
	    		user.name = document.getString("name");
	    		
	    		System.out.println("[DB] User Data After Successful Login:"+user);
	    		
	    	}
			
			return flag;
		}
	 public void updatePayment(double payment, String paymentId) {
			
		 System.out.println("[DB] Updating Payment "+paymentId);
		 
			BasicDBObject query = new BasicDBObject();
			query.put("_id", new ObjectId(paymentId));
			
	    	MongoCursor<Document> cursor = mongoClient.getDatabase("Payata").getCollection("payments").find(query).iterator();
	    	Document document = cursor.next();
	    	
	    	document.put("payment", payment);
	    	
	    	
	    	
	    	ObjectId old= new ObjectId(paymentId);
	    	System.out.println("[DB]" +document.toJson());
	    	
	    	//Update into DataBase
	    	mongoClient.getDatabase("Payata").getCollection("payments").updateOne(Filters.eq("_id",old),Updates.set("payment", payment) );
	    	System.out.println("Payment Updated");
			
		}
	  
	 
		
		public void deletePayment(String paymentId) {
			
			System.out.println("[DB] Deleting Fever:"+paymentId);
			
			BasicDBObject query = new BasicDBObject();
			
			query.put("_id", new ObjectId(paymentId));
			
	    	// Fetching the Data
	    	mongoClient.getDatabase("Payata").getCollection("payments").deleteOne(query);
	    	
		}
		public void updateWage(double wage, String wageId) {
			
			 System.out.println("[DB] Updating Payment "+wageId);
			 
				BasicDBObject query = new BasicDBObject();
				query.put("_id", new ObjectId(wageId));
				
		    	MongoCursor<Document> cursor = mongoClient.getDatabase("Payata").getCollection("workers").find(query).iterator();
		    	Document document = cursor.next();
		    	
		    	document.put("payment", wage);
		    	
		    	
		    	
		    	ObjectId old= new ObjectId(wageId);
		    	System.out.println("[DB]" +document.toJson());
		    	
		    	//Update into DataBase
		    	mongoClient.getDatabase("Payata").getCollection("payments").updateOne(Filters.eq("_id",old),Updates.set("payment", wage) );
		    	System.out.println("Wage Updated");
				
			}
		  
		 
			
			public void deleteWage(String wageId) {
				
				System.out.println("[DB] Deleting Fever:"+wageId);
				
				BasicDBObject query = new BasicDBObject();
				
				query.put("_id", new ObjectId(wageId));
				
		    	// Fetching the Data
		    	mongoClient.getDatabase("Payata").getCollection("workers").deleteOne(query);
		    	
			}
		
	
public void fetchUsers() {
		
		try {
			MongoCursor<Document> cursor = mongoClient.getDatabase("Payata").getCollection("users").find().iterator();
	    	while(cursor.hasNext()) {
	    		//System.out.println(cursor.next());
	    		System.out.println(cursor.next().toJson());
	    	}
		}catch(Exception e) {
			System.out.println("Something Went Wrong: "+e);
	
		}
}
public ArrayList<Payment> fetchPayments(String userId) {
	
	ArrayList<Payment> paymentRecords = new ArrayList<Payment>();
	
	try {
		
		BasicDBObject query = new BasicDBObject();
		query.put("userId", userId);
		
    	MongoCursor<Document> cursor = mongoClient.getDatabase("Payata").getCollection("payments").find(query).iterator();
    	while(cursor.hasNext()) {
    		
    		Document document = cursor.next();
    		Payment payment = new Payment();
    		payment._id = document.getObjectId("_id").toString();
    		payment.userId = document.getString("userId");
    		payment.dateTimeStamp = document.getDate("dateTimeStamp").toString();
    		payment.payment = document.getDouble("payment");
    		
    		paymentRecords.add(payment);
    		
    	}
	}catch(Exception e) {
		System.out.println("Something Went Wrong: "+e);
	}
	
	return paymentRecords;
	
}

public ArrayList<Worker> fetchWorkers(String userId) {
	
	ArrayList<Worker>workerRecords = new ArrayList<Worker>();
	
	try {
		
		BasicDBObject query = new BasicDBObject();
		query.put("userId", userId);
		
    	MongoCursor<Document> cursor = mongoClient.getDatabase("Payata").getCollection("workers").find(query).iterator();
    	while(cursor.hasNext()) {
    		
    		Document document = cursor.next();
    		Worker worker = new Worker();
    		worker._id = document.getObjectId("_id").toString();
    		worker.userId = document.getString("userId");
    		worker.dateTimeStamp = document.getDate("dateTimeStamp").toString();
    		worker.name= document.getString("name");
    		worker.wage = document.getDouble("wage");
    		
    		workerRecords.add(worker);
    		
    	}
	}catch(Exception e) {
		System.out.println("Something Went Wrong: "+e);
	}
	
	return workerRecords;
	
}
}
	