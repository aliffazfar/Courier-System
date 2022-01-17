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
  background-color: #ad0000;
  color: white;
  padding: 6px 6px;
  margin: 6px 0;
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
textarea{
   height: 100px;
   width: 100%;
   padding:1%;
   border:0;
}
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 85%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: center;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #E88D00;
  color: white;
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
<title>Out For Delivery | Ninja Laju</title>
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
  <a href="tracking.jsp">Update Tracking ID</a>
  <a class="active" href="parcel.jsp">Out For Delivery</a>
</div>
</div>
<div class="main">
<h2 style="text-align:center;">OUT FOR DELIVERY</h2>
     <table id="customers" style="margin-left:auto;margin-right:auto;">
       <tr>
         <th>Tracking ID</th>		   
         <th>Receiver Name</th> 
		 <th>Receiver Phone</th>
		 <th>Receiver Postcode</th>      
		 <th>Courier Assigned</th> 
		 <th>Courier Phone</th>
		 <th>Status</th>
		 <th></th>         
       </tr>
        <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from item INNER JOIN manage ON item.item_id = manage.item_id INNER JOIN courier ON manage.courier_ic=courier.courier_ic INNER JOIN ship ON item.item_id = ship.item_id ORDER BY item.item_id ASC";


resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
		<tr>
			<td><%=resultSet.getString("item_id") %></td>
			<td><%=resultSet.getString("recName") %> </td>
			<td><%=resultSet.getString("recPhone") %> </td>
			<td><%=resultSet.getString("recPostcode") %> </td>
			<td><%=resultSet.getString("courier_name") %> </td>
			<td><%=resultSet.getString("courier_phone") %> </td>
			
			<% String x=resultSet.getString("ship_delivered");
			if (x.equals("nulll")){%>
			<td>Out for delivery</td>
			
			<%}
			else{%>
			
			<td><%=resultSet.getString("ship_delivered") %> </td>
			<td>
			<form action="deleteparcel.jsp" method="post">
			<input type="hidden" name="idd" value="<%=resultSet.getString("item_id") %>">
			<input type="submit" value="Delivered">
 		    </form>
			</td>
			<%}%>

		</tr>
  <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 

     </table>
 <br> <br>
</div>

</body>
</html>