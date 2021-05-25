<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String name=request.getParameter("name");
String type=request.getParameter("type");
String acctno=request.getParameter("acctno");
int i=Integer.parseInt(request.getParameter("id2"));
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/icin-bank", "root", "Sailucky@123");
Statement st=conn.createStatement();
ResultSet rs = st.executeQuery("select * from recipients where (userid="+i+" and accounttype='"+type+"') and (accountno='"+acctno+"' and recipientname='"+name+"')");
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
<h2>Recipient Already exists...</h2>

<%
 }
 else
 {
	 int i1=0;
	 ResultSet rs1 = st.executeQuery("select * from user where ( accounttype='"+type+"') and (accountno='"+acctno+"' and name='"+name+"')");
    if(rs1.next()){
    	
    int x=rs1.getInt("id");
		int i2=st.executeUpdate("insert into recipients(userid,recipientname,accountno,accounttype,recipientid)values("+i+",'"+name+"','"+acctno+"','"+type+"',"+x+")");
if(i2>0){
%>
<h2>Adding Recipient is Successful...</h2>

<%}
else
	{
%>
<h2>Recipient Adding Is Not Successful.....</h2>
<%
}
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






































