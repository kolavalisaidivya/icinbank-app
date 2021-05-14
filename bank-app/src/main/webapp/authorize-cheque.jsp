<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/icin-bank", "root", "Sailucky@123");
Statement st=conn.createStatement();
ResultSet rs = st.executeQuery("select * from usercheck");

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
body
{
align:center;

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
h2
{
color:powderblue;
}</style>
</head>
<body>
<h1>User Cheque Book Requests Are</h1>
<table border="1">
<tr>
<th>Id</th>
<th>Name</th>
<th>Account-No</th>
<th>Account-Type</th>
<th>Amount</th>
<th>Permission</th>
</tr>
<%
while (rs.next()) {
	int id=rs.getInt("id");
	String name=rs.getString("name");
	String accno=rs.getString("accountno");
	String type=rs.getString("accounttype");
	String money=rs.getString("money");
	String accept=rs.getString("accept");
	%>
	<tr>
	<td><%out.println(id) ; %></td>
	<td><%out.println(name) ; %></td>
	<td><%out.println(accno) ;%></td>
	<td><%out.println(type) ; %></td>
	<td><%out.println(money) ; %></td>
	<%


	if(accept.equals("accepted")){
	%>

		<td>Authorized Cheque</td></tr>
	<%
	}
	else{
%>
<td><a href="accept-check.jsp?id2=<%=id%>">Authorize Cheque</a></td></tr>
<%
	}
	}
	}
	catch(Exception e)
	{
	System.out.print(e);
	e.printStackTrace();
	}
	%>
	</table>
	</body>
	</html>






































