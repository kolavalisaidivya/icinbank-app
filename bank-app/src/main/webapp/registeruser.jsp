<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String name=request.getParameter("name");
String type=request.getParameter("type");
String phno=request.getParameter("ph.no");
String dob=request.getParameter("dob");
String username=request.getParameter("username");
String pw=request.getParameter("password");
String acctno=request.getParameter("acctno");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/icin-bank", "root", "Sailucky@123");
Statement st=conn.createStatement();
ResultSet rs = st.executeQuery("select * from user where (username='" + username + "' and accounttype='"+type+"') or (accountno='"+acctno+"' and accounttype='"+type+"')");
%>
<!DOCTYPE html>
<html>
<head>
<style>
body
{
background-image:url("file:///E:/ICIN-BANK1/src/main/webapp/css/bg-image.jpg");
}
h2
{
color:black;
}</style>
</head>
<body>
<%
if (rs.next()) {
%>
<h2>User already exists... try to login<a href="userlogin.html">Login</a>or</h2>
<h2>Try Again by giving the Correct Details<a href="register.jsp">Register</a></h2>

<%
 }
 else
 {
	 int i1=0;

int i=st.executeUpdate("insert into user(username,password,accounttype,phoneno,dob,name,money,accountno,block,withdraw,deposit,transaction) values('"+username+"','"+pw+"','"+type+"','"+phno+"','"+dob+"','"+name+"','"+i1+"','"+acctno+"','active user','active user','active user','active user')");
if(i>0){
%>
<h2>User Registration is Successful...You can login now!</h2>
<a href="userlogin.jsp">Login Here</a>

<%}
else
	{
%>
<h2>User Registration Not Successful.....</h2>
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
</body>
</html>






































