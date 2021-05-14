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
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<style>
body
{
align:center;
background-image:url("file:///E:/ICIN-BANK1/src/main/webapp/css/bg-image.jpg");

}
table {
  border-collapse: collapse;
  width: 100%;
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
<h1>Balance In User Account</h1>
<table border="1">
<tr>
<th>Id</th>
<th>Name</th>
<th>Account-Type</th>
<th>Account No.</th>
<th>Money</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, 
password);
statement=connection.createStatement();
int dlt = Integer.parseInt(request.getParameter("id2"));
resultSet = statement.executeQuery("select * from user where id="+dlt+"");
if(resultSet.next()){
String block=resultSet.getString("block");
String s=resultSet.getString("name");
if(block.equals("blocked")){
%>
<h2>You are not allowed to see balance...As you are blocked by the admin...</h2>
<%
}
else
{
	resultSet = statement.executeQuery("select * from user where name='"+s+"'");
while(resultSet.next()){
	String na=resultSet.getString("name");
	int id1=resultSet.getInt("id");
	String type=resultSet.getString("accounttype");
	String acctno=resultSet.getString("accountno");
	String money=resultSet.getString("money");
%>
<tr>
<td><%out.println(id1);%></td>
<td><%out.println(na) ; %></td>
<td><%out.println(type) ; %></td>
<td><%out.println(acctno) ; %></td>
<td><%out.println(money) ; %></td>
</tr>
<%
}
}
}
else{
%>
<h2>error occured...</h2>
<%
}
connection.close();
} catch (Exception e)  {
e.printStackTrace();
}
%>
</table>
</body>
</html>