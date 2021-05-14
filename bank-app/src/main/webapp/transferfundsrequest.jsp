<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String name=request.getParameter("name");
String type=request.getParameter("type");
String name1=request.getParameter("name1");
String type1=request.getParameter("type1");
String amount=request.getParameter("amount");
String acctno=request.getParameter("acctno");
	

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/icin-bank", "root", "Sailucky@123");
Statement st=conn.createStatement();
ResultSet rs1 = st.executeQuery("select * from user where name='"+name1+"' and accounttype='"+type1+"'");
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
body
{
background-image:url("file:///E:/ICIN-BANK1/src/main/webapp/css/bg-image.jpg");
}
</style></head>
<body>
<%
 if (rs1.next()) {
	 String transaction=rs1.getString("transaction");		

int amount1=Integer.parseInt(request.getParameter("amount"));
int amt1=Integer.parseInt(rs1.getString("money"));
String block=rs1.getString("block");
int id=rs1.getInt("id");
ResultSet rs2 = st.executeQuery("select * from user where name='"+name+"' and accounttype='"+type+"'");
int amount2=amt1-amount1;

%>

<%
 if(block.equals("blocked")){
%>

<script>
alert("User has been blocked by the admin to do All transactions")</script>
<%
 }
 else if(transaction.equals("blocked")){
%>

<script>
alert("User has been blocked by the Admin to do Transfer Funds transactions")</script>
<%
 }
 else{
	 if(amt1>amount1){
	 if(rs2.next()){
		 String ac=rs2.getString("accountno");
	 if(ac.equals(acctno)){
		 int amt2=Integer.parseInt(rs2.getString("money"));
		int id1=rs2.getInt("id");
		int amount3=amt2+amount1;
	 String deposit="Transferred Money to"+acctno;
int i1=st.executeUpdate("update user set money='"+amount3+"' where id="+id1 );
int i2=st.executeUpdate("update user set money='"+amount2+"' where id="+id );
if(i1>0)
{
	int i=st.executeUpdate("insert into userrequests(username,accounttype,requesttype,money)values('"+name1+"','"+type1+"','"+deposit+"','"+amount+"')");
%>

<h2>Transfer of money is successfull!</h2>
<h2>View the Transaction details</h2>
<table>
<tr>
<th>Name</th>
<th>Account-type</th>
<th>Transaction-Type</th>
<th>Amount</th>
</tr>
<tr>
<td><%=name1 %></td>
<td><%=type1 %></td>
<td><%=deposit %></td>
<td><%=amount %></td>

</tr>
</table>
<h4><a href="welcomeuser.jsp">Go to home page</a></h4>

<%
}
else{
	%>
	<h3>Error Occured While Transfering Money</h3>
	<%
}
 }
	 else
		 {
%>
<h2>Receiver Account Number Doesnot Exist..Check That Once</h2>
<%
}
	 }
	 
	 
	 else{
%>
	 
	 <h2>Receiver Account Details Are Incorrect...check once</h2>
	 
<%
	 }
		 }
 
 else
 {
%>
<h3>Amount Is Not Enough In the sender Account</h3>
<%
 }
}
 }else{
	 %>
	 <h2>Sender Information is Incorrect Check Once...</h2>
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
