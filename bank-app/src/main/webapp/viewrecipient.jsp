<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "icin-bank";
String userid = "root";
String password = "Sailucky@123";
int dlt = Integer.parseInt(request.getParameter("id2"));

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
<h1>Recipients List</h1>
<table border="1">
<tr>
<th>User-Id</th>
<th>Name</th>
<th>Account-No.</th>
<th>Account Type.</th>
<th>Transfer</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, 
password);
statement=connection.createStatement();

ResultSet resultSet = statement.executeQuery("select * from recipients where userid="+dlt+"");

while(resultSet.next()){
	String na=resultSet.getString("recipientname");
	int id1=resultSet.getInt("userid");
	String type=resultSet.getString("accounttype");
	String acctno=resultSet.getString("accountno");
	int id=resultSet.getInt("recipientid");


%>
<tr>
<td><%out.println(id1);%></td>
<td><%out.println(na) ; %></td>
<td><%out.println(type) ; %></td>
<td><%out.println(acctno) ; %></td>


<td><a href="transfermoney.jsp?id=<%= id%>&id1=<%=id1%>">Transfer Money</a></td></tr>
<%
    
	



}

} catch (Exception e)  {
e.printStackTrace();
}
%>
</table>
</body>
</html>