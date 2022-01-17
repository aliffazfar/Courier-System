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
  background-color : #e3e3e3; 
}

input[type=submit] {
  width: 100%;
  background-color: orange;
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
<link rel="stylesheet" href="style.css">
<title>Parcel Details | Ninja Laju</title>
</head>
<body>
<header>
<a href="staff.jsp" class="logo"><img src="images/ninja-01.png" style="height:60px;width:auto;"></a>
<nav class="topnav">
  <a  class="active" href="staff.jsp" style="pointer-events: none">Welcome, <%= (String)session.getAttribute("username") %></a>
  <a  href="staff.jsp">Home</a>
  <a href="index.jsp">Logout</a>
    </nav>
</header> 

 <div class="center" style="border-style: solid;">
 <img src="images/parcelD-01.png" style='height: 100%; width: 100%; object-fit: contain' class="center"><br>
 <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String itemID=request.getParameter("idd");
String sql ="select * from item WHERE item_id ='"+itemID+"' ";
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
%>
 
  <form>

    <div class="form-group name2 col-md-6">
    <label for="lname">Tracking ID</label>
    <input type="text"  value="<%=resultSet.getString("item_id") %>" disabled></div>

  <div class="form-group name3 col-md-6">
    <label for="fname">Receiver Name</label>
    <input type="text"  value="<%=resultSet.getString("recName") %>" disabled> </div>
   
    
	<div class="form-group name2 col-md-6">
	     <label for="lname">Receiver IC</label>
    <input type="text"  value="<%=resultSet.getString("recIC") %>" disabled>
	</div>
    
    	<div class="form-group name3 col-md-6">
 <label for="lname">Receiver Phone Number</label>
    <input type="text" value="<%=resultSet.getString("recPhone") %>" disabled>
    </div>
    
      <div class="form-group name3 col-md-6"> 
       <label for="lname">Receiver Postcode</label>
    <input type="text" value="<%=resultSet.getString("recPostcode") %>" disabled></div>
    
<div class="form-group name3 col-md-6"> 
       <label for="lname">Item Type</label>
    <input type="text" value="<%=resultSet.getString("itemType") %>" disabled></div>
    
<br><br><label for="lname">Receiver Address</label><br>
    <input type="text" value="<%=resultSet.getString("recAdd") %>" disabled>

    <br><br><label for="lname">Comment</label><br>
	<input type="text" value="<%=resultSet.getString("comment") %>" disabled>
  <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>  
  </form>
</div>


</body>
</html>