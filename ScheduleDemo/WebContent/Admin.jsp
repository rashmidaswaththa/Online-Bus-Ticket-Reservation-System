<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta hhtp-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<title>Admin page</title>
<link href="css/admin.css" rel="stylesheet" type="text/css">
</head>

<% //In case, if Admin session is not set, redirect to Login page
if((request.getSession(false).getAttribute("Admin")== null) )
{
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%} %>
<body>

 <nav>
      <div class="logo">25Quickbus</div>
      <input type="checkbox" id="click">
      <label for="click" class="menu-btn">
        <i class="fas fa-bars"></i>
      </label>
      <ul>
        <li><a class="active" href="#">Home</a></li>
        <li><a href="#">About us</a></li>
        <li><a href="#">Career</a></li>
        <li><a href="#">Contact us</a></li>
        <li><a href="#">Feedback</a></li>
        <li><a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a></li>
      </ul>
    </nav>

<div class="hero-image">
  <div class="hero-text">
    <h1>Welcome admin <%=request.getAttribute("userName") %></h1> 
  </div>
</div>

<br>
<div class="box-area">
	<div class="single-box">
		<div class="img-area"></div>
		<div class="img-text">
		    <div class="para2"><p>Click here to manage bus schedules</p></div>
			<div class="para1"><input type="button"  class="button" value="Bus Schedule" onclick="window.location='display.jsp'" ></div>
		</div>
	</div>

	<div class="single-box">
		<div class="img-area"></div>
		<div class="img-text">
			<div class="para2"><p>Click here to manage all the users</p></div>
			<div class="para1"><input type="button"  class="button" value="User Management" onclick="window.location='#'" ></div>
		</div>
	</div>

	<div class="single-box">
		<div class="img-area"></div>
		<div class="img-text">
			<div class="para2"><p>Click here to create and see the reports</p></div>
			<div class="para1"><input type="button"  class="button" value="Report" onclick="window.location='#'" ></div>
		</div>
	</div>

	<div class="single-box">
		<div class="img-area"></div>
		<div class="img-text">
			<div class="para2"><p>Click here to manage buses</p></div>
			<div class="para1"><input type="button"  class="button" value="Bus Management" onclick="window.location='#'" ></div>
		</div>
	</div>
</div>
 
<br><br>
 
<div class="footer-dark">
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-md-3 item">
                        <h3>Services</h3>
                        <ul>
                            <li><a href="#">Web design</a></li>
                            <li><a href="#">Development</a></li>
                            <li><a href="#">Hosting</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-6 col-md-3 item">
                        <h3>About</h3>
                        <ul>
                            <li><a href="#">Company</a></li>
                            <li><a href="#">Team</a></li>
                            <li><a href="#">Careers</a></li>
                        </ul>
                    </div>
                    <div class="col-md-6 item text">
                        <h3>Company Name</h3>
                        <p>Praesent sed lobortis mi. Suspendisse vel placerat ligula. Vivamus ac sem lacus. Ut vehicula rhoncus elementum. Etiam quis tristique lectus. Aliquam in arcu eget velit pulvinar dictum vel in justo.</p>
                    </div>
                    <div class="col item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-instagram"></i></a></div>
                </div>
                <p class="copyright">Company Name © 2021</p>
            </div>
        </footer>
    </div>
</body>



</html>