<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
try
{
int dlt = Integer.parseInt(request.getParameter("id2"));
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/icin-bank", "root", "Sailucky@123");
Statement st=conn.createStatement();
ResultSet rs = st.executeQuery("select * from user where id="+dlt);
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
color:powderblue;
}</style>
</head>
<body>
<%
if (rs.next()) {
	String name=rs.getString("name");
	String accno=rs.getString("accountno");
	String type=rs.getString("accounttype");
	String money=rs.getString("money");
	String block=rs.getString("block");
    if(block.equals("blocked"))
    {
 
	
%>
<h2>Your request cannot be processed as the admin blocked you</h2>

<%
 
 }
 else
 {
	 int i1=0;
ResultSet rs1 =st.executeQuery("select * from usercheck where accountno='" + accno + "'");
if(rs1.next()){
	String s=rs1.getString("accept");
	if(s.equals("accepted")){
%>
<h2>Check Book Request is accepted by the Admin...You will get cheque book in 2 or 3 weeks...</h2>
<%
}
else
{
%>
<h2>User Request already sent...Wait for admin acceptance </h2>
<%
}
}
else
{
int i=st.executeUpdate("insert into usercheck(name,accounttype,accountno,money,accept) values('"+name+"','"+type+"','"+accno+"','"+money+"','not accepted')");
if(i>0){
%>
<h2>User Request is sent Successfully...You can hear from the Admin soon!</h2>
<a href="welcomeuser.html">Go to  User Homepage</a>

<%
}
else
	{
%>
<h2>User Request Is Not Successful Sent.....</h2>
<%
}
	}
}
}
else
{
%>
<h2>User don't exist</h2>
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






































