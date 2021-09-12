<%@page import="com.Sakshi.model.Payment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Sakshi.dao.DB"%>
<%@page import="com.Sakshi.model.User"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Payment Record</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body style="background-color: hsl(0, 0%, 50%);">
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

	<%
		User user = (User)session.getAttribute("keyUser");
		DB db = new DB();
	%>


	
	<div class="container">
  <h2>Payment Record</h2>
  <p>Dear <%= user.name%>, your payment records till date: </p>            
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Date Time</th>
        <th>Payment</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
    
   	   <%
			ArrayList<Payment> payments = db.fetchPayments(user._id);
		
			for(Payment payment : payments){
				
		%>
    
	      <tr>
	        <td><%= payment.dateTimeStamp %></td>
	        <td><%= payment.payment %></td>
	        <td><a href='action.jsp?action=update&paymentid=<%=payment._id%>&payment=<%=payment.payment%>'>UPDATE</a>  <a href='action.jsp?action=delete&paymentid=<%=payment._id%>'>DELETE</a></td>
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