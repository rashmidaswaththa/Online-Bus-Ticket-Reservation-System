package com.schedule.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.schedule.model.Customer;
import com.schedule.model.DBConnection;
import com.schedule.model.Schedule;

import java.lang.*;

public class CustomerDBUtil {
	private static boolean Issuccess;
	private static Connection con = null;
	private static Statement statement = null;
	private static ResultSet resultSet = null;
	
	public String Validate(Customer cus)
	{
	    String userName = cus.getUsername();
	    String password = cus.getPassword();
	 
	    String userNameDB = "";
	    String passwordDB = "";
	    String roleDB = "";
	 
	    try
	    {
	        con = DBConnection.createConnection();
	        statement = con.createStatement();
	        resultSet = statement.executeQuery("select username,password,role from customer");
	 
	        while(resultSet.next())
	        {
	            userNameDB = resultSet.getString("username");
	            passwordDB = resultSet.getString("password");
	            roleDB = resultSet.getString("role");
	 
	            if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("Admin"))
	            return "Admin_Role";
	            else if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("Agent"))
	            return "Agent_Role";
	            else if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("User"))
	            return "User_Role";
	        }
	    }
	    catch(SQLException e)
	    {
	        e.printStackTrace();
	    }
	    return "Invalid user credentials";
	}
	
	private static PreparedStatement preparedStatement = null;
	
	public static boolean Insertschedule(String date, String name, String route, String dtime, String atime) {
		
	    
		try {
			
			 con = DBConnection.createConnection();
			 preparedStatement = con.prepareStatement(
					 "insert into schedule(date ,bus_name ,bus_route ,departure_time ,arrival_time) values (?,?,?,?,?)");
					 
						preparedStatement.setString(1, date);
						preparedStatement.setString(2, name);
						preparedStatement.setString(3, route);
						preparedStatement.setString(4, dtime);
						preparedStatement.setString(5, atime);
		     int rs =  preparedStatement.executeUpdate();
		     
		     if(rs > 0) {
		    	 Issuccess = true;
		     }else {
		    	 Issuccess = false;
		     }
		
	}
		catch(Exception e) {
			 e.printStackTrace();
		}
		
		
		return Issuccess;

}
	

	public static boolean Updateschedule(String id, String date, String name, String route, String dtime, String atime) {
		
		
		int num = Integer.parseInt(id);
		
		try {
		
			 con = DBConnection.createConnection();
			 preparedStatement = con.prepareStatement(
					 "update schedule set date = ?, bus_name = ?, bus_route= ?, departure_time = ?, arrival_time = ? where idschedule= ?");
					 
						preparedStatement.setString(1, date);
						preparedStatement.setString(2, name);
						preparedStatement.setString(3, route);
						preparedStatement.setString(4, dtime);
						preparedStatement.setString(5, atime);
						preparedStatement.setString(6, id);
		     int rs =  preparedStatement.executeUpdate();
		     
		     
		     if(rs > 0) {
		    	 Issuccess = true;
		     }else {
		    	 Issuccess = false;
		     }
		
	}
		catch(Exception e) {
			 e.printStackTrace();
		}
		
		
		
		return Issuccess;
		
	}
	
	
	public static boolean Deleteschedule(String id) {
		
		
			int num = Integer.parseInt(id);
		   
			try {
			
				 con = DBConnection.createConnection();
				 preparedStatement = con.prepareStatement(
						 "delete from schedule where idschedule = ? ");
				
				 preparedStatement.setString(1, id);
				 int r = preparedStatement.executeUpdate();
			     if(r > 0) {
			    	 Issuccess = true;
			     }else {
			    	 Issuccess = false;
			     }
			
		}
			catch(Exception e) {
				 e.printStackTrace();
			}
			
			return Issuccess;
			
		}
	
	
}
