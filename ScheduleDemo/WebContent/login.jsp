<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!-- Login jsp --> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta hhtp-equiv="Content-Type" content="text/html"; charset="UTF-8">
	<title>Login page</title>
	<link href="css/login.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class = "wrapper">
	<center><img src="images/L.png" alt="Logint"></center> 
	<h1>Login</h1>
	
	<!-- -create form for users to login to the system -->
	<!-- send user entered data to the Login servlet using action -->
	<form name="form" action="<%=request.getContextPath()%>/LoginServlet" method="post" >
 
         <input type="text" name="username" placeholder=" Username"/>
       
         <input type="password" name="password" placeholder="Password"/>
        
         <!-- -display error message when user give wrong credentials-->
         <span style="color:red"><b><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></b></span><br>
        
         <input type="submit" value="Login"></input><br>
         <input type="submit" value="Cancel" onclick="window.location='main.jsp'"></input>
       
      </form>
			
	 <div class="bottomtext">
				<input type="checkbox" name="remember" checked="checked" >Remember me
				<a href="#">Forgot Password ?</a>
	 </div>
</div>
<div id="overlay-area"></div>
</body>
</html>