<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String name=request.getParameter("name");
String type=request.getParameter("account-type");
String trans=request.getParameter("transaction");
String amount=request.getParameter("amount");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/icin-bank", "root", "Sailucky@123");
Statement st=conn.createStatement();
ResultSet rs = st.executeQuery("select * from user-requests where username='" + name + "' and account-type='" + type + "' and request-type='"+trans+"'");
 if (rs.next()) {
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
}</style></head>
<body>
<h2>User Request already Started... try to perform Transaction<a href="verify-request.jsp">Do Transaction</a></h2>

<%
 }
 else
 {
int i=st.executeUpdate("insert into user-requests(username,account-type,request-type,money)values('"+name+"','"+type+"','"+trans+"','"+amount+"')");
%>
<h2>User Request is Successfully sent to Admin...You can Perform Transaction <a href="verify-request.jsp">here</a>!</h2>
<a href="userlogin.html">Login Here</a>

<% }
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>







































