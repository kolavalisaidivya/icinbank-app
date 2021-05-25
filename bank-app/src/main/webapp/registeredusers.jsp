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
<h1>Users Registered are</h1>
<table border="1">
<tr>
<th>Id</th>
<th>Name</th>
<th>Account-Type</th>
<th>Date Of Birth</th>
<th>Phone.no</th>
<th>Account No.</th>
<th>Blocking User</th>
<th>Blocking User For Withdraw</th>
<th>Blocking User For Deposit</th>
<th>Blocking User For Transaction</th>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, 
password);
statement=connection.createStatement();
String sql ="select * from user";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String na=resultSet.getString("name");
	int id1=resultSet.getInt("id");
	String type=resultSet.getString("accounttype");
	String phno=resultSet.getString("phoneno");
	String dob=resultSet.getString("dob");
	String acctno=resultSet.getString("accountno");
	String money=resultSet.getString("money");
	String block=resultSet.getString("block");
	String withdraw=resultSet.getString("withdraw");
	String deposit=resultSet.getString("deposit");
	String transaction=resultSet.getString("transaction");


%>
<tr>
<td><%out.println(id1);%></td>
<td><%out.println(na) ; %></td>
<td><%out.println(type) ; %></td>
<td><%out.println(dob) ;%></td>
<td><%out.println(phno) ; %></td>
<td><%out.println(acctno) ; %></td>

<%
if(block.equals("blocked")){
	String trans1="user";

%> 
<td><a href="unblockuser.jsp?id2=<%=id1%>&trans=<%=trans1 %>">Unblock User</a></td>
<%
}
else{
	String trans1="user";
%>
<td><a href="blockuser.jsp?id2=<%=id1%>&trans=<%=trans1 %>">Block User</a></td>
<%
}
if(withdraw.equals("blocked")){
	String trans="withdraw";

%> 
<td><a href="unblockuser.jsp?id2=<%=id1%>&trans=<%=trans %>">Unblock User</a></td>
<%
}
else{
	String trans="withdraw";
%>
<td><a href="blockuser.jsp?id2=<%=id1%>&trans=<%=trans %>">Block User</a></td>
<%
}if(deposit.equals("blocked")){
	String s1="deposit";

	%> 
	<td><a href="unblockuser.jsp?id2=<%=id1%>&trans=<%=s1 %>">Unblock User</a></td>
	<%
	}
	else{
		String s1="deposit";

	%>
	<td><a href="blockuser.jsp?id2=<%=id1%>&trans=<%=s1 %>">Block User</a></td>
	<%
	}
if(transaction.equals("blocked")){
	String trans2="transaction";

		%> 
		<td><a href="unblockuser.jsp?id2=<%=id1%>&trans=<%=trans2 %>">Unblock User</a></td></tr>
		<%
		}
		else{
			String trans2="transaction";
		%>
		<td><a href="blockuser.jsp?id2=<%=id1%>&trans=<%=trans2 %>">Block User</a></td></tr>
		<%
		}

}
connection.close();
} catch (Exception e)  {
e.printStackTrace();
}
%>
</table>
</body>
</html>