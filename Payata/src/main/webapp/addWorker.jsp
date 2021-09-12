<%@page import="com.Sakshi.dao.DB"%>
<%@page import="com.Sakshi.model.Worker"%>
<%@page import="com.Sakshi.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Worker</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body style="background-color: hsl(0, 0%, 80%);">

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
        <a class="nav-link" href="viewWorkersRecord.jsp">Workers Record</a>
      </li>    
    </ul>
  </div>  
</nav>

<br>
<center>
<div class="container">
  <div class="jumbotron">
<%
		User user = (User)session.getAttribute("keyUser");
	%>

	<center>
		<h4>Welcome to Workers Record</h4> 
		<b><%= user.name %></b>
	

	<%
		
		Worker worker = new Worker();
		worker.userId = user._id;
		worker.name = (request.getParameter("txtName"));
		worker.wage = Double.parseDouble(request.getParameter("txtWage"));
		
		DB db = new DB();
		db.logWorker(worker);
		
	%>
	
	<p>Your Worker has been Recorded Successfully: <%= worker.name%> <%=worker.wage %></p>
	
	
	
	</center>
	</div>
	</div>
	
	
</body>
</html>