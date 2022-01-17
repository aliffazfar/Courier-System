<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  width: 70%;
  padding: 12px 20px;
  margin: 8px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  text-align: center; 
   display: block;
  margin-left: auto;
  margin-right: auto;
}

input[type=submit] {
  width: 70%;
  background-color:  #E88D00;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
     display: block;
  margin-left: auto;
  margin-right: auto;
}

input[type=submit]:hover {
  background-color: black;
}
div.c {
  font-size: 150%;
}
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 30%;
  
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
  background-color: #000;
  color: white;
}
.disabled-link {
  pointer-events: none;
}
</style>
<head>
<meta charset="UTF-8">
<link rel="icon" href="images/fav-01.png" type="image/gif" sizes="18x18">
<link rel="stylesheet" href="stylee.css">
<title>Track and Ship a Parcel | Ninja Laju</title>
</head>
<body>

<header>
<a href="index.jsp" class="logo"><img src="images/ninja-01.png" style="height:60px;width:auto;"></a>
<nav class="topnav">
  <a class="active" href="index.jsp">Home</a>
    <a href="ship.jsp">Ship Your Item</a>
  <a href="login.jsp">Login</a>
    </nav>
</header> 
<img src="images/slide.png" style="height:320px;width:auto;" class="center"><br><hr><br><br>


  <form action="track" method="post" class="center">
    <h3 style="text-align:center;">Enter the tracking number stated on your AWB/EWB</h3>
    <input type="text"  name="trackID" placeholder="E.g : 100000001,100000002" >
    <input type="submit" value="Track Now">
    <p style="color:red;font-size:15px;text-align:center;">Enter your airwaybill number (separated by comma).
Available up to 10 airwaybills.</p>
  </form>
  <p style="font-size:16px;text-align:center;">Our AWB consists of 12 digits number. Key in without any spacing to trace your parcel.</p><br>

    <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

String id = null;
String pick= null;
String depart= null;
String arrive= null;
String sort= null;
String outt= null;
String delivered= null;
String nulll = "nulll";
String itemID=request.getParameter("trackID");
String sql ="select * from ship WHERE item_id ='"+itemID+"' ";

boolean blnResultSetIsEmpty = true;
resultSet = statement.executeQuery(sql);


while(resultSet.next()){
	 blnResultSetIsEmpty = false;
 id = resultSet.getString("item_id");
 pick= resultSet.getString("ship_pick");	
 depart= resultSet.getString("ship_depart");
 arrive= resultSet.getString("ship_arrive");
 sort= resultSet.getString("ship_sort");
 outt= resultSet.getString("ship_out");
 delivered= resultSet.getString("ship_delivered");

}
%>

       
  	<% if (pick != null && !pick.equals(nulll)){%>
  		<p style="font-size:19px;text-align:center;">TRACKING ID : <%=id%> </p>
       <table id="customers" style="margin-left:auto;margin-right:auto;border-collapse: collapse;">
  		<tr>
			<th>[ninjaLaju] Pickup</th>
		</tr>
		<tr>
			<td><%=pick%></td>
		</tr>
     </table><br>
      <% } if(depart != null && !depart.equals(nulll)){ %>
      <table id="customers" style="margin-left:auto;margin-right:auto;border-collapse: collapse;">
  		<tr>
			<th>[ninjaLaju] Departure</th>
		</tr>
		<tr>
			<td><%=depart%></td>
		</tr>
     </table><br>
       <% } if(arrive != null && !arrive.equals(nulll)){ %>
      <table id="customers" style="margin-left:auto;margin-right:auto;border-collapse: collapse;">
  		<tr>
			<th>[ninjaLaju] Arrival</th>
		</tr>
		<tr>
			<td><%=arrive%></td>
		</tr>
     </table><br>
      <% } if(sort != null && !sort.equals(nulll)){ %>
      <table id="customers" style="margin-left:auto;margin-right:auto;border-collapse: collapse;">
  		<tr>
			<th>[ninjaLaju] Sorting</th>
		</tr>
		<tr>
			<td><%=sort%></td>
		</tr>
     </table><br>
      <% } if(outt != null && !outt.equals(nulll)){ %>
      <table id="customers" style="margin-left:auto;margin-right:auto;border-collapse: collapse;">
  		<tr>
			<th>[ninjaLaju] Out for Delivery</th>
		</tr>
		<tr>
			<td><%=outt%></td>
		</tr>
     </table><br>
     <% } if(delivered != null && !delivered.equals(nulll)){ %>
      <table id="customers" style="margin-left:auto;margin-right:auto;border-collapse: collapse;">
  		<tr>
			<th>[ninjaLaju] Delivered</th>
		</tr>
		<tr>
			<td><%=delivered%></td>
		</tr>
     </table>
     <% } else if(pick.equals(nulll)){%>
     <p style="font-size:19px;text-align:center;">TRACKING ID : <%=id%> </p>
      <table id="customers" style="margin-left:auto;margin-right:auto;border-collapse: collapse;">
  		<tr>
			<th>[ninjaLaju]</th>
		</tr>
		<tr>
			<td>Waiting for processing</td>
		</tr>
     </table><% } %>

     
     
  <br><hr><br>
   <%
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>  
 <img src="images/partner-01.png" style="width:640px;height:auto;" class="center"><br><br><br><br><br>

</body>
</html>