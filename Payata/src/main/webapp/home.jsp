<%@ page import="com.Sakshi.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>home</title>
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
        <a class="nav-link" href="viewPayment.jsp">Payments Record</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="viewWorkersRecord.jsp">Workers Record </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"></a>
      </li>    
    </ul>
  </div>  
</nav>

<br>
    <div class="container">
    <div class="jumbotron">
   <center><h1 style="color:#009688; ">PAYATA</h1></center>  
    <br>     
    <%
		User user = (User)session.getAttribute("keyUser");
	%>

	
		<h3 style="font-family:courier;">Welcome Home, Dear <%= user.name %></h3 > <h3 style="font-family:courier;"><%= user.email %></h3>
	<br><br>
		<h3 style="font-family: courier;">Log Your Payment Details Here</h3>
		<a href="viewPayment.jsp">VIEW ALL PAYMENT RECORDS</a>
		<br><br>
		
		<form action="addPayment.jsp" method="get">
		 <div class="form-group">
      <label form="payment">Enter Payment:</label>
      <input type="payment" class="form-control" id="payment" placeholder="Enter payment" name="txtPayment">
    </div>
			
			<button type="submit" class="btn btn-primary">LOG PAYMENT</button>
			
		</form>
		<br>
		
		
		</div>
		</div>
		<div class="container">
    <div class="jumbotron">
		<br>
		<h3 style="font-family:courier;">Log Your Worker Details Here</h3>
		<a href="viewWorkersRecord.jsp">VIEW ALL WORKERS RECORD</a>
		<br><br>
		
		<form action="addWorker.jsp" method="post">
    <div class="form-group">
      <label form="name">Enter Name:</label>
      <input type="name" class="form-control" id="name" placeholder="Enter name" name="txtName">
    </div>
     <div class="form-group">
      <label for="wage">Given Wage:</label>
      <input type="wage" class="form-control" id="wage" placeholder="Enter Given Wage" name="txtWage">
    </div>
   
   
    <button type="submit" class="btn btn-primary">LOG WORKER RECORD</button>
  </form>
		
		<br>
		
		<table>
		</table>
		
	
	
  </div>
       
</div>

</body>
</html>