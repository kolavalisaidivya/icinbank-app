<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/icin-bank", "root", "Sailucky@123");
Statement st=conn.createStatement();
int dlt=Integer.parseInt(request.getParameter("id2"));
ResultSet rs = st.executeQuery("select * from usercheck where id="+dlt);

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
<%
if(rs.next())
{
	int i1=st.executeUpdate("update usercheck set accept='accepted' where id="+dlt);
%>
<h2>Authorized the Cheque-book Successfully</h2>

<%
}
else{
%>
<h2>Authorization Is Not Successful</h2>

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






































