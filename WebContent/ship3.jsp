<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*" %>
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
  background-color : #e3e3e3; 
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
textarea{
   height: 100px;
   width: 100%;
   padding:1%;
   border:0;
}

</style>
  <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String ic = (String)request.getAttribute("recIC");
String ic2 = "1000232373";
String sql ="select * from item JOIN customer ON item.cust_ic = customer.cust_ic WHERE item.item_id ='"+ic+"' ";
resultSet = statement.executeQuery(sql);

String id =null;
String rname =null;
String rphone =null;
String radd = null;
String rpst = null;
String sname = null;
String sphone = null;
String sadd = null;
String spst = null;
String cmmt = null;
String type = null;
Date date = new Date();

while(resultSet.next()){
 id = resultSet.getString("item_id");
 rname = resultSet.getString("recName");
 rphone = resultSet.getString("recPhone");
 radd = resultSet.getString("recAdd");
 rpst = resultSet.getString("recPostcode");
 sname = resultSet.getString("cust_name");
 sphone = resultSet.getString("cust_phone");
 sadd = resultSet.getString("cust_address");
 spst = resultSet.getString("cust_nationality");
 cmmt = resultSet.getString("comment");
 type = resultSet.getString("itemType");
}
%>
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
 <p style="color:red;font-size:20px;text-align:center;">PRINT THE AIRWAY BILL AND COMPLETE THE PAYMENT AT OUR NEAREST STORE!!</p>
 <table border=1 style="margin-left:auto;margin-right:auto;width: 90%;">
 <tr>
 <td colspan="2" ><img src="images/aw-01.png" style="height:130px;width:auto;position: static;"></td>
 </tr>
 <tr>
 <td   style="width:550px;"><p style="font-size:20px;color:#000;display:inline;"><b>&emsp;Order Details</b></p></td>
  <td style="width:320px;"><p style="font-size:20px;color:#000;display:inline;"><b>&emsp;Order Details (Courier)</b></p></td>
 </tr>
  <tr>
  
 <td>

 <p style="font-size:18px;color:#000;display:inline;"> &emsp;Ship by Date:&emsp;&emsp; <%= date.toString()%><br> 
 &emsp;Tracking ID:&emsp;&emsp;&emsp;&emsp; <b><%= id%></b><br><br><br>
 </p>
</td>

 <td> <p style="font-size:18px;color:#000;display:inline;">&emsp;Parcel Type: <%= type%><br> &emsp;Parcel Desc: <%= cmmt%><br><br><br>
 
 </p></td>
 </tr>
 
  <tr>
 <td   style="width:550px;"><p style="font-size:20px;color:#000;display:inline;"><b>&emsp;Sender Details</b></p></td>
  <td rowspan="2" style="width:320px;text-align:center;"><br><p style="font-size:50px;color:#000;display:inline;">TRG 7800</p><br><br></td>
 </tr>
   <tr>
 <td   rowspan="2" style="width:550px;"><p style="font-size:18px;color:#000;display:inline;">&emsp;Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= sname%><br><br><br>
 &emsp;Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= sphone%><br> &emsp;Address:&nbsp;&nbsp;&nbsp; <%= sadd%><br><br>
  &emsp;Postcode:&nbsp; <%= spst%><br> <br>
 </p></td>
 </tr>
 <tr>
   <td rowspan="2" style="text-align:center;"><br><p style="font-size:50px;color:#000;display:inline;"> <%= rpst%></p><br><br></td>

 </tr>
   <tr>
 <td   style="width:550px;"><p style="font-size:20px;color:#000;display:inline;"><b>&emsp;Recipient Details</b></p></td>
 </tr>
    <tr>
 <td   rowspan="1" style="width:550px;"><p style="font-size:18px;color:#000;display:inline;">&emsp;Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= rname%><br><br><br>
 &emsp;Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= rphone%><br> &emsp;Address:&nbsp;&nbsp;&nbsp; <%= radd%><br><br>
  &emsp;Postcode:&nbsp; <%= rpst%><br><br>
 </p></td>
     <td rowspan="3" style="text-align:center;"><img src="images/as-01.png" style="height:430px;width:auto;position: static;"></td>
 </tr>
   <tr>
 <td   style="width:550px;"><p style="font-size:20px;color:#000;display:inline;"><b>&emsp;POD</b></p></td>
 </tr>
    <tr>
 <td   style="width:550px;"><p style="font-size:18px;color:#000;display:inline;">&emsp;Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
 &emsp;IC:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br> &emsp;Signature:&nbsp;&nbsp;&nbsp; <br><br><br><br>
 </p></td>
 </tr>
 </table>


</div><br><br><br><br><br>
   <%
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>  

</body>
</html>