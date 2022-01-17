<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "servlet";
String userid = "root";
String password = "root1234";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
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

</style>
<head>
<meta charset="UTF-8">
<link rel="icon" href="images/fav-01.png" type="image/gif" sizes="18x18">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="stylee.css">
<title>Update Tracking ID | Ninja Laju</title>
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
  <a  href="courier.jsp">Add Courier Men</a>
  <a  href="couriertable.jsp">Courier Men List</a>
  <a href="pending.jsp">Pending Parcel</a>
  <a class="active" href="tracking.jsp">Update Tracking ID</a>
  <a href="parcel.jsp">Out For Delivery</a>
</div>
</div>
<div class="main">
 <div class="center" style="border-style: solid;border-radius: 25px;border: 4px solid #E88D00;">
 <img src="images/updateTrackk-01.png" style='height: 100%; width: 100%; object-fit: contain' class="center"><br>
 
 
  <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();


String itemID=request.getParameter("idd");
String sql ="select * from ship WHERE item_id ='"+itemID+"' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	
String id = resultSet.getString("item_id");
String pick= resultSet.getString("ship_pick");	
String depart= resultSet.getString("ship_depart");
String arrive= resultSet.getString("ship_arrive");
String sort= resultSet.getString("ship_sort");
String outt= resultSet.getString("ship_out");
String delivered= resultSet.getString("ship_delivered");
String nulll = "nulll";
String null2 = "";
session.setAttribute("idd", id);
%>
  <form action="UpdateTracking" method="post">
	
    <label for="fname">Tracking ID</label>
    <input type="text" style="background-color : #e3e3e3;" name="idd" value="<%=resultSet.getString("item_id") %>" disabled> 
    
    <label for="pickup">Pickup</label>
    
    <select  name="pick">
    <% if (pick.equals(nulll)){%>
    <option value="nulll">null</option>
    <option value="[ninjaLAJU CP PH 789]Parcel has been picked up by ninjaLaju KUT789">[ninjaLAJU CP PH 789]Parcel has been picked up by ninjaLaju KUT789</option>
    <% }else if(pick != null && pick != nulll){ %>
    <option value="<%=pick %>"><%=pick %></option>
     <%} %>
     </select>	
    
    <label for="pickup">Departure</label>
    
    <select  name="depart">
    
   <% if (depart.equals(nulll)){%>
    <option value="nulll">null</option>
    <option value="[ninjaLAJU CP PH 789]Parcel has departed to hub KL99">[ninjaLAJU CP PH 789]Parcel has departed to hub KL998</option>
    <% }else if(depart != null && depart != nulll){ %>
    <option value="<%=depart %>"><%=depart %></option>
     <%} %>
     </select>
    
     <label for="pickup">Arrival</label>
     
    <select  name="arrive">
    <% if (arrive.equals(nulll)){%>
    <option value="nulll">null</option>
    <option value="[ninjaLAJU WPKUL_GATEWAY]Parcel has arrived to hub KL998">[ninjaLAJU WPKUL_GATEWAY]Parcel has arrived to hub KL998</option>
    <% }else if(arrive != null && arrive != nulll){ %>
    <option value="<%=arrive %>"><%=arrive %></option>
     <%} %></select>
    
    <label for="pickup">Sorting</label>
    
    <select  name="sort">
    
     <% if (sort.equals(nulll)){%>
    <option value="nulll">null</option>
    <option value="[ninjaLAJU CDC METRO]Parcel are being sorted at hub KL998">[ninjaLAJU CDC METRO]Parcel are being sorted at hub KL998</option>
    <% }else if(sort != null && sort != nulll){ %>
    <option value="<%=sort %>"><%=sort %></option>
     <%} %></select>
    
      <label for="pickup">Out for Delivery</label>
    <select  name="outt">
    
    <% if (outt.equals(nulll)){%>
    <option value="nulll">null</option>
    <option value="[ninjaLAJU CDC METRO]Parcel out for delivery. (Dispatcher Tel:*)">[ninjaLAJU CDC METRO]Parcel out for delivery. (Dispatcher Tel:*)</option>
    <% }else if(outt != null && outt != nulll){ %>
    <option value="<%=outt %>"><%=outt %></option>
     <%} %></select>
    
     <label for="pickup">Delivered</label>
    <select  name="delivered">
    
	<% if (delivered.equals(nulll)){%>
	<option value="nulll">null</option>
	<option value="[ninjaLAJU CDC METRO]Parcel has been successfully delivered">[ninjaLAJU CDC METRO]Parcel has been successfully delivered</option>
	<% }else if(delivered != null && delivered != nulll){ %>
    <option value="<%=delivered %>"><%=delivered %></option>
   	<% }%>
    </select>
    
 <br>  <br>  <input type="submit" value="Update">
  </form>
</div>
  <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>  
</div>
</body>

</html>