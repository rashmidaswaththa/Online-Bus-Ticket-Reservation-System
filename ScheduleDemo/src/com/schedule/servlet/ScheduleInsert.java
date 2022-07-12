package com.schedule.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.schedule.util.CustomerDBUtil;

@WebServlet("/ScheduleInsert")
public class ScheduleInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String date = request.getParameter("date");
		String name = request.getParameter("name");
		String route = request.getParameter("route");
		String dtime = request.getParameter("dtime");
		String atime = request.getParameter("atime");
		
		boolean value;
		
		value = CustomerDBUtil.Insertschedule(date, name, route, dtime, atime);
		
		if(value == true) {
			RequestDispatcher dis = request.getRequestDispatcher("display.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unSuc.jsp");
			dis2.forward(request, response);
		}
	}

}
