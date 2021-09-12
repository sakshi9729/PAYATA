package com.Sakshi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Sakshi.model.User;
import com.Sakshi.dao.DB;


@WebServlet({ "/RegisterController", "/Register" })
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//1 Fetch data from Request
		User user= new User();
		user.setName(request.getParameter("txtName"));
		user.email=request.getParameter("txtEmail");
		user.password=request.getParameter("txtPassword");
		
		//2 Logical Operation
		//Dump the data in MongoDB
				
		DB db = new DB();
		
		//3 Send back some response
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		boolean result= db.registerUser(user);
		
		String html="";
		if(result) {
			HttpSession session = request.getSession();
			session.setAttribute("keyUser", user);
			html= "<html>\r\n"
					+ "<head>\r\n"
					+ "<meta charset=\"ISO-8859-1\">\r\n"
					+ "<title>Payata</title>\r\n"
					+ "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\r\n"
					+ "  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\r\n"
					+ "  <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js\"></script>\r\n"
					+ "  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\r\n"
					+ "</head>\r\n"
					+ "\r\n"
					+ "\r\n"
					+ "\r\n"
					+ "<body style=\"background-color: hsl(0, 0%, 80%);\">\r\n"
					+ "\r\n"
					+ "  <nav class=\"navbar navbar-expand-md bg-dark navbar-dark\">\r\n"
					+ "  <a class=\"navbar-brand\" href=\"index.html\">PAYATA</a>\r\n"
					+ "  <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#collapsibleNavbar\">\r\n"
					+ "    <span class=\"navbar-toggler-icon\"></span>\r\n"
					+ "  </button>\r\n"
				
					+ "     <div class=\"collapse navbar-collapse\" id=\"collapsibleNavbar\">\r\n"
					+ "    <ul class=\"navbar-nav\">\r\n"
					+ "     \r\n"
					+ "      <li class=\"nav-item\">\r\n"
					+ "        <a class=\"nav-link\" href=\"home.jsp\">HOME</a>\r\n"
					+ "      </li>\r\n"
					
					+ "    </ul>\r\n"
					+ "  </div>  \r\n"
					+ "</nav>\r\n<br><br>"
					
					+ "    <div class=\"container\">\r\n"
					+ "    <div class=\"jumbotron\">\n"
					
					+ "<center>THANK YOU " + user.email+"<br>REGSTRATON SUCCESS<br>"
					+"<a href='home.jsp'>Enter Home</a></div></div>" 
			 		+ "</center></body></html>";
		}else {
			html="<html><body><center>Something went wrong"+user.email+"<br>Pls Try again</center></body></html>";
		}
		out.println(html);
		//writer.println("Thank You. We have registered you successfully");
	}

}
