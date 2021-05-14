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
%>
<!DOCTYPE html>
<html>
<head>
<style>
h2{
color:powderblue;
allign:center;
}
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
</style></head>
<body>
<%
 if (rs.next()) {
int amount1=Integer.parseInt(request.getParameter("amount"));
int id=rs.getInt("id");
int amt1=Integer.parseInt(rs.getString("money"));
int amt=amt1-amount1;
String block=rs.getString("block");
String withdraw=rs.getString("withdraw");

%>

<%
 if(block.equals("blocked")){
%>

<script>
alert("User has been Blocked by the Admin to Perform All Transactions")</script>
<%
 }
 else if(withdraw.equals("blocked"))
 {
%>
<script>
 alert("User has been blocked by the Admin to Perform Withdraw Transactions")</script>
 <%
	
 }
 else{
	 String withdraw1="withdraw";
	 if(amount1>(amt1+1000))
	 {
%>
<h2>Amount Is Not Sufficient In The Account to Withdraw...</h2>
<%
	 }
	 else{
int i1=st.executeUpdate("update user set money='"+amt+"' where id="+id );
if(i1>0)
{
	int i=st.executeUpdate("insert into userrequests(username,accounttype,requesttype,money)values('"+name+"','"+type+"','withdraw','"+amount+"')");
%>
<h2>Money Withdrawl is successfull!</h2>
<h2>View the Withdrawl Transaction details</h2>
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
<td>Withdraw</td>
<td><%=amount %></td>

</tr>
</table>
<h4><a href="welcomeuser.jsp">Go to home page</a></h4>

<%
}
else{
	%>
	<h3>Error Occured While Withdrawing money</h3>
	<%
}
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