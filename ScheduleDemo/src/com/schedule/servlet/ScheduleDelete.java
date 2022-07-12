package com.schedule.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.schedule.util.CustomerDBUtil;


@WebServlet("/ScheduleDelete")
public class ScheduleDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("sid");
		
		boolean value = CustomerDBUtil.Deleteschedule(id);
		
		if(value == true) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
