<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="images/fav-01.png" type="image/gif" sizes="18x18">
<link rel="stylesheet" href="login.css">
<title>Staff Login</title>
</head>
<body>
 
 <div class="login" style="border-radius: 25px;border: 4px solid #E88D00;" >
 <p style="font-size:20px;color:black;text-align:center"><b>STAFF LOGIN</b></p>
  <img border="0" src="images/ninja-01.png" class="expand">
  <form action="<%=request.getContextPath()%>/LoginServlet" method="post">
    <p><input type="text" name="username" value="" placeholder="Username or Email"></p>
    <p><input type="password" name="password" value="" placeholder="Password"></p>
    <p class="remember_me">
<p style="color:red;text-align:center">${message}</p>
    <p class="submit"><input type="submit" name="commit" value="Login"></p>
  </form>

</div>


</body>
</html>