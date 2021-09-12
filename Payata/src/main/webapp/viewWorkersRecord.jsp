<%@page import="com.Sakshi.model.Worker"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Sakshi.dao.DB"%>
<%@page import="com.Sakshi.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Worker Record</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body style="background-color:#009688;">
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a class="navbar-brand" href="index.html">PAYATA</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="home.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="viewPayment.jsp">Payments Record </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href=""></a>
      </li>    
    </ul>
  </div>  
</nav>

<br>

<div class="container">
  <div class="jumbotron">

<%
		User user = (User)session.getAttribute("keyUser");
		DB db = new DB();
	%>


	
	<div class="container">
  <h2>Worker Record</h2>
  <p>Dear <%= user.name%>, your payment records till date: </p>            
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Date Time</th>
        <th>Name</th>
        <th>Wage</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
    
   	   <%
			ArrayList<Worker> workers = db.fetchWorkers(user._id);
		
			for(Worker worker : workers){
				
		%>
    
	      <tr>
	        <td><%=worker.dateTimeStamp %></td>
	        <td><%= worker.name %></td>
	        <td><%= worker.wage %></td>
	        <td><a href='actionWage.jsp?actionWage=update&wageid=<%=worker._id%>&wage=<%=worker.wage%>'>UPDATE</a>  <a href='actionWage.jsp?action=delete&wageid=<%=worker._id%>'>DELETE</a></td>
	      </tr>
	      
      	<%			
				
			}
		%>
    </tbody>
  </table>
</div>
	</div>
	</div>

</body>
</html>