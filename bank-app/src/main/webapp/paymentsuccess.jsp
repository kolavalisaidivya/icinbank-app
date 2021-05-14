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
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
int amt=Integer.parseInt(request.getParameter("money"));
int dlt=Integer.parseInt(request.getParameter("id"));
int dlt1=Integer.parseInt(request.getParameter("id1"));

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

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, 
password);
statement=connection.createStatement();

resultSet = statement.executeQuery("select * from user where id="+dlt1+"");
if(resultSet.next()){
	int amt1=Integer.parseInt(resultSet.getString("money"));


	int am=amt1-amt;
	int i1=statement.executeUpdate(" update user set money="+am+" where id="+dlt1+"" );
	if(i1>0)
	{
	resultSet=statement.executeQuery(" select * from user where id="+dlt+"");
	if(resultSet.next())
	{
		int m=Integer.parseInt(resultSet.getString("money"));
		int am1=m+amt;
		int i3=statement.executeUpdate(" update user set money="+am1+" where id="+dlt+"");
		if(i3>0){
%>
<h2>Transfer is Successful</h2>
<%
		}else{
%>
<h3>Transfer Is Not Complete</h3>
<%
		}
		
	}else{
%>
<h3>No recipient Found</h3>
<%
	}
}
}
else{
%>
<h3>No User Found</h3>
<%
}
connection.close();
} catch (Exception e)  {
e.printStackTrace();
}
%>
</body>
</html>