package com.schedule.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.schedule.model.Customer;
import com.schedule.util.CustomerDBUtil;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("username");
	    String password = request.getParameter("password");
	 
	    Customer cus1 = new Customer();
	 
	    cus1.setUsername(userName);
	    cus1.setPassword(password);
	 
	    CustomerDBUtil cusdb = new  CustomerDBUtil();
	 
	    try
	    {
	        String userValidate = cusdb.Validate(cus1);
	 
	        if(userValidate.equals("Admin_Role"))
	        {
	            System.out.println("Admin's Home");
	 
	            HttpSession session = request.getSession(); //Creating a session
	            session.setAttribute("Admin", userName); //setting session attribute
	            request.setAttribute("userName", userName);
	 
	            request.getRequestDispatcher("Admin.jsp").forward(request, response);
	        }
	        else if(userValidate.equals("Agent_Role"))
	        {
	            System.out.println("Agent's Home");
	 
	            HttpSession session = request.getSession();
	            session.setAttribute("Agent", userName);
	            request.setAttribute("userName", userName);
	 
	            request.getRequestDispatcher("Agent.jsp").forward(request, response);
	        }
	        else if(userValidate.equals("User_Role"))
	        {
	            System.out.println("User's Home");
	 
	            HttpSession session = request.getSession();
	            session.setMaxInactiveInterval(10*60);
	            session.setAttribute("User", userName);
	            request.setAttribute("userName", userName);
	 
	            request.getRequestDispatcher("User.jsp").forward(request, response);
	        }
	        else
	        {
	            System.out.println("Error message = "+userValidate);
	            request.setAttribute("errMessage", userValidate);
	 
	            request.getRequestDispatcher("login.jsp").forward(request, response);
	        }
	    }
	    catch (IOException e1)
	    {
	        e1.printStackTrace();
	    }
	    catch (Exception e2)
	    {
	        e2.printStackTrace();
	    }
	} 
		
	}


