<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color:  #E88D00;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: black;
}

div {
  border-radius: 5px;
  padding: 20px;
  
}
#name {
    width: 223.67px;
    height: 40.25px;
}

.form-group {
    display: inline-block;
    width: calc(50% - 1px);
    padding: 0 !important;
}

.container {
    display: inline-block;
    width: 90%;
    margin-left: 5% !important;
    margin-right: 5% !important;
}

.form-control {
    margin: 0 !important;
}

</style>
<head>
<meta charset="UTF-8">
<link rel="icon" href="images/fav-01.png" type="image/gif" sizes="18x18">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="stylee.css">
<title>Ship Your Item | Ninja Laju</title>
</head>
<body>
<header>
<a href="index.jsp" class="logo"><img src="images/ninja-01.png" style="height:60px;width:auto;"></a>
<nav class="topnav">
  <a  href="index.jsp">Home</a>
    <a class="active" href="ship.jsp">Ship Your Item</a>
  <a href="login.jsp">Login</a>
    </nav>

</header> 
 <div class="center" style="border-style: solid;border-radius: 25px;border: 4px solid #E88D00;" >
 <img src="images/sender-01.png" style='height: 100%; width: 100%; object-fit: contain' class="center"><br>
 
  <form action="RegisterServlet" method="post">
	<div class="form-group name2 col-md-6">
	
    <label for="fname">Full Name</label>
    <input type="text"  name="custName" placeholder="Your Full Name.."> </div>
    
	<div class="form-group name3 col-md-6">
    <label for="lname">IC Number</label>
    <input type="text"  name="custIC" placeholder="Your IC Number.."></div>

  <label for="lname">Address</label>
    <input type="text"  name="custAdd" placeholder="Your Address..">
    
    	<div class="form-group name2 col-md-6">
	
    <label for="fname">Phone Number</label>
    <input type="text" name="custPhone" placeholder="Your Phone Number.."> </div>
    
	<div class="form-group name3 col-md-6">
    <label for="lname">Postcode</label>
    <input type="text" name="CustNationality" placeholder="Your Postcode.."></div>
    
    <input type="submit" value="Submit">
  </form>
</div>


</body>

</html>