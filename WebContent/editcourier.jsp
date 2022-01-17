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
  box-sizing: border-box;
  background-color : white; 
}

input[type=submit] {
  width: 100%;
  background-color: #059c23;
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
textarea{
   height: 100px;
   width: 100%;
   padding:1%;
   border:0;
}

</style>
<head>
<meta charset="UTF-8">
<link rel="icon" href="images/fav-01.png" type="image/gif" sizes="18x18">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="stylee.css">
<title>Edit Courier Men | Ninja Laju</title>
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
  <a class="active" href="couriertable.jsp">Courier Men List</a>
  <a href="pending.jsp">Pending Parcel</a>
  <a href="tracking.jsp">Update Tracking ID</a>
  <a href="parcel.jsp">Out For Delivery</a>
</div>
</div>
<div class="main">

 <div class="center" style="border-style: solid;border-radius: 25px;border: 4px solid #E88D00;">
 <img src="images/editcourier-01.png" style='height: 100%; width: 100%; object-fit: contain' class="center"><br>
 <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String cIC=request.getParameter("idd");
String sql ="select * from courier WHERE courier_ic ='"+cIC+"' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
 
  <form action="editcourierr" method="post">
  
	<div class="form-group name2 col-md-6">
    <label for="lname">Courier Name</label>
    <input type="text"  name="courierName" value="<%=resultSet.getString("courier_name") %>" ></div>

	<div class="form-group name3 col-md-6">
    <label for="fname">Courier IC</label>
    <input type="text"  name="courierIC" value="<%=resultSet.getString("courier_ic") %>" > </div>
   
    <label for="lname">Courier Address</label>
    <input type="text" name="courierAdd" value="<%=resultSet.getString("courier_add") %>" >
    
    <div class="form-group name2 col-md-6">
	<label for="lname">Courier Phone Number</label>
    <input type="text"  name="courierPhone" value="<%=resultSet.getString("courier_phone") %>" ></div>

    <div class="form-group name3 col-md-6">
	<label for="lname">Courier Postcode</label>
    <input type="text"  name="courierPostcode" value="<%=resultSet.getString("courier_postcode") %>" ></div>
    
	<label for="courierType">Courier Type</label>
    <select  name="courierType">
    <% String x=resultSet.getString("courier_type");
			if (x.equals("Rider")){%>
			 <option value="Rider">Rider</option>
			 <option value="Lorry">Lorry</option>
			<%}
			else {%>
			<option value="Lorry">Lorry</option>
			<option value="Rider">Rider</option>
			<%}%>
    </select>
    <input type="hidden" name="idd" value="<%=resultSet.getString("courier_ic") %>">
  <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>  <br><br>

<input type="submit" value="Update Courier">
  </form>
</div>
</div>

</body>
</html>