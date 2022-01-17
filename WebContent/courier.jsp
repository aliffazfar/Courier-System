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
  background-color: #E88D00;
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
.disabled-link {
  pointer-events: none;
}
</style>
<head>
<meta charset="UTF-8">
<link rel="icon" href="images/fav-01.png" type="image/gif" sizes="18x18">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="stylee.css">
<title>Add Courier Men | Ninja Laju</title>
</head>
<body>
<div class="top">
<header>
   <a href="staff.jsp"><img src="images/ninja-01.png" id="logo" style="height:60px;width:auto;"></a>
<nav class="topnav">
  <a  class="active" href="staff.jsp" style="pointer-events: none">Welcome, <%= (String)session.getAttribute("username") %></a>
  <a href="index.jsp">Logout</a>
    </nav></header>
</div>
<div class="left">
  <div class="sidebar">
  <a  href="staff.jsp">Dashboard</a>
  <a class="active" href="courier.jsp">Add Courier Men</a>
  <a href="couriertable.jsp">Courier Men List</a>
  <a href="pending.jsp">Pending Parcel</a>
  <a href="tracking.jsp">Update Tracking ID</a>
  <a href="parcel.jsp">Out For Delivery</a>
</div>
</div>
<div class="main">
 <div class="center" style="border-style: solid;border-radius: 25px;border: 4px solid #E88D00;">
 <img src="images/courier-01.png" style='height: 100%; width: 100%; object-fit: contain' class="center"><br>
 
  <form action="RegisterCourier" method="post">
	<div class="form-group name2 col-md-6">
	
    <label for="fname">Courier Name</label>
    <input type="text"  name="courierName" placeholder="Courier Name.." > </div>
    
	<div class="form-group name3 col-md-6">
    <label for="lname">Courier IC Number</label>
    <input type="text"  name="courierIC" placeholder="Courier IC Number.."></div>

  <label for="lname">Courier Address</label>
    <input type="text"  name="courierAdd" placeholder="Courier Address..">
    
    <br><br>	<div class="form-group name2 col-md-6">
	
    <label for="fname">Courier Phone Number</label>
    <input type="text" name="courierPhone" placeholder="Courier Phone Number.."> </div>
    
	<div class="form-group name3 col-md-6">
    <label for="lname">Courier Postcode</label>
    <input type="text" name="courierPostcode" placeholder="Courier Postcode.."></div>
    
    <label for="courierType">Courier Type</label>
    <select  name="courierType">
    	<option ></option>
      <option value="Rider">Rider</option>
      <option value="Lorry">Lorry</option>
    </select>
    <br><br>
    <input type="submit" value="Submit">
  </form>
</div>
</div>

</body>

</html>