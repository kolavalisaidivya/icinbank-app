<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "icin-bank";
String userid = "root";
String password = "Sailucky@123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
  border-collapse: collapse;
  width: 100%;
}
body
{
align:center;
background-image:url("file:///E:/ICIN-BANK1/src/main/webapp/css/bg-image.jpg");

}
th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<h1>User Transactions Are</h1>
<table border="1">
<tr>
<th>Name</th>
<th>Account-Type</th>
<th>Transaction-Type</th>
<th>Amount</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, 
password);
statement=connection.createStatement();

int dlt = Integer.parseInt(request.getParameter("id2"));
ResultSet rs = statement.executeQuery("select * from user where id="+dlt+"");
if(rs.next()){
String block=rs.getString("block");
String x=rs.getString("name");
ResultSet resultSet;
String sql1 ="select * from userrequests where username='"+x+"'";

resultSet = statement.executeQuery(sql1);
if(block.equals("blocked")){
%>
<h2>You are not allowed to see transactions...As you are blocked by the admin...</h2>
<%
}
else
{
while(resultSet.next()){
	String na=resultSet.getString("username");
	String type=resultSet.getString("accounttype");
	String req=resultSet.getString("requesttype");
	String money=resultSet.getString("money");
%>
<tr>
<td><%out.println(na) ; %></td>
<td><%out.println(type) ; %></td>
<td><%out.println(req) ;%></td>
<td><%out.println(money) ; %></td>
<%
}
}
}
else
{%>
<h2>Some error occured...While Processing your request..</h2>
<%

}connection.close();
} catch (Exception e)  {
e.printStackTrace();
}
%>
</table>
</body>
</html>