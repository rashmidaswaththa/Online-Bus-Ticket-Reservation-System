<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agent page</title>
</head>


<% //In case, if Editor session is not set, redirect to Login page
if((request.getSession(false).getAttribute("Agent")== null) )
{
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%} %>
<body>
<center><h2>Agent's Home</h2></center>
 
Welcome <%=request.getAttribute("userName") %>
 
<div style="text-align: right"><a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a></div>
 
</body>


</html>