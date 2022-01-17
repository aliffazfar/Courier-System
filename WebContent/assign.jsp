
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
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 70%;
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
<title>Assign Courier | Ninja Laju</title>
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
 <div class="center" style="border-style: solid;border-radius: 25px;border: 4px solid #E88D00;" >
  <img src="images/assign-01-01.png" style='height: 100%; width: 100%; object-fit: contain' class="center"><br>
  <form action="Assign" method="post">
	<label for="lname">Courier Name</label>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
%>
    <select name="selected_dept_id">
        <%
        String pcs = (String)request.getAttribute("pstcd");
        String sql ="select * from courier WHERE courier_postcode = '"+pcs+"'";
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){        
		String fname = resultSet.getString("courier_name"); 
		%>
	<option value="<%=fname %>"><%=fname %></option><%}%>
    </select>

 <%
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>  
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String message = (String)request.getAttribute("alertMsg");
String iddd=(String)request.getAttribute("iddd");
String sql ="SELECT * FROM item WHERE item_id = '"+iddd+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<br><br>
<div class="form-group name2 col-md-6">
    <label for="lname">Tracking ID</label>
    <input type="text" style="background-color : #e3e3e3;" name="selected_parcel_id" value="<%=resultSet.getString("item_id") %>" disabled></div>

  <div class="form-group name3 col-md-6">
    <label for="fname">Parcel Postcode Area</label>
    <input type="text" style="background-color : #e3e3e3;" value="<%=resultSet.getString("recPostcode") %>" disabled> </div>

<br><br><label for="lname">Parcel Address</label>
<input type="text" style="background-color : #e3e3e3;" value="<%=resultSet.getString("recAdd") %>" disabled>

<div class="form-group name2 col-md-6">
    <label for="lname">Parcel Type</label>
    <input type="text" style="background-color : #e3e3e3;" value="<%=resultSet.getString("itemType") %>" disabled></div>

  <div class="form-group name3 col-md-6">
    <label for="fname">Parcel Comment</label>
    <input type="text" style="background-color : #e3e3e3;" value="<%=resultSet.getString("comment") %>" disabled> </div>

<input type="hidden" name="idd" value=<%=resultSet.getString("item_id") %>>

<%}%>
<script type="text/javascript">
    var msg = "<%=message%>";
    alert(msg);
</script>
 <%
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>  

<br><br>

<input type="submit" value="ASSIGN">
</form>
</div>

 
 <br>
 <h2 style="text-align:center;">AVAILABLE COURIER MEN</h2>
     <table id="customers" style="margin-left:auto;margin-right:auto;">
       <tr>
         <th>Courier Name</th>		   
         <th>Courier Phone</th> 
		 <th>Courier Type</th>  
		 <th>Delivery Postcode</th>        
       </tr>
        <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String pcs = (String)request.getAttribute("pstcd");
String sql ="select * from courier WHERE courier_postcode = '"+pcs+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
		<tr>
			<td><%=resultSet.getString("courier_name") %></td>
			<td><%=resultSet.getString("courier_phone") %> </td>
			<td><%=resultSet.getString("courier_type") %> </td>
			<td><%=resultSet.getString("courier_postcode") %> </td>
		</tr><%}%>
 <%
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>  

     </table> 
</div>
</body>

</html>