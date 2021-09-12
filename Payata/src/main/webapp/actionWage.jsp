<%@page import="com.Sakshi.dao.DB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update and Delete Worker's Wage</title>


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
        <a class="nav-link" href="viewWorkersRecord.jsp">Workers Record </a>
      </li>    
    </ul>
  </div>  
</nav>

<br>

<div class="container">
  <div class="jumbotron">
<center>

		<%
		DB db = new DB();
	
		String actionWage = request.getParameter("actionWage");
		String wageId = request.getParameter("wageid");
		String wage = request.getParameter("wage");
		
		
		if(actionWage.equals("delete")){
			// delete the  record
			db.deleteWage(wageId);
	%>
		<h3>WORKER'S RECORD DELETED</h3>
		<%			
		}else{
			
	%>
		<h3>UPDATE WORKER'S WAGE</h3>
		<form action="updateWage.jsp?wageId=<%=wageId %>" method="post">
			<input type="text" name="txtWage" value="<%=wage%>">
			
			
			
			<input type="submit" value="UPDATE WAGE">
		</form>
		<%			// update the  record
		}
	%>
	</center>
	</div>
	</div>

</body>
</html>