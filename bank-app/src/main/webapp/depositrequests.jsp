<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String name=request.getParameter("name");
String type=request.getParameter("type");
String amount=request.getParameter("amount");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/icin-bank", "root", "Sailucky@123");
Statement st=conn.createStatement();
ResultSet rs = st.executeQuery("select * from user where username='"+name+"' and accounttype='"+type+"'");
 if (rs.next()) {
int amount1=Integer.parseInt(request.getParameter("amount"));
int id=rs.getInt("id");
int amt1=Integer.parseInt(rs.getString("money"));
int amt=amt1+amount1;
String block=rs.getString("block");
String deposit1=rs.getString("deposit");

%>
<!DOCTYPE html>
<html>
<head>
<style>
h2{
color:powderblue;
allign:center;
}
body
{
background-image:url("file:///E:/ICIN-BANK1/src/main/webapp/css/bg-image.jpg");
}
<style>
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
</style></head>
<body>
<%
 if(block.equals("blocked")){
%>

<script>
alert("User has been blocked by the admin to perform All Transactions")</script>
<%
 }
 else if(deposit1.equals("blocked")){
%>

<script>
alert("User has been blocked by the admin to perform Deposit Transactions")</script>
<%
 }

 else{
	 String deposit="deposit";
int i1=st.executeUpdate("update user set money='"+amt+"' where id="+id );
if(i1>0)
{
	int i=st.executeUpdate("insert into userrequests(username,accounttype,requesttype,money)values('"+name+"','"+type+"','"+deposit+"','"+amount+"')");
%>

<h2>Deposit is successfull!</h2>
<h2>View the Transaction details</h2>
<table>
<tr>
<th>Name</th>
<th>Account-type</th>
<th>Transaction-Type</th>
<th>Amount</th>
</tr>
<tr>
<td><%=name %></td>
<td><%=type %></td>
<td>Deposit</td>
<td><%=amount %></td>

</tr>
</table>
<h4><a href="welcomeuser.jsp">Go to home page</a></h4>

<%
}
else{
	%>
	<h3>Error Occured While depositing money</h3>
	<%
}
 }
 }
 else
 {
%>
<h3>User with the Username and account-type doesn't exist...</h3>
<%
 }
}

catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>
</html>