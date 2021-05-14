<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/icin-bank", "root", "Sailucky@123");
Statement st=conn.createStatement();
int i=Integer.parseInt(request.getParameter("id"));
int i1=Integer.parseInt(request.getParameter("id1"));
ResultSet rs = st.executeQuery("select * from user where id="+i1+"");
if (rs.next()) {

%>
<!DOCTYPE html>
<html>
<head>

<style>
body {font-family: Arial, Helvetica, sans-serif;
background-image:url("file:///E:/ICIN-BANK1/src/main/webapp/css/bg-image.jpg");
}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}



.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
</head>
<body>
<form action="paymentsuccess.jsp">
<label for="money">Enter Money to Transfer</label>
<input type="text" placeholder="enter money to transfer" name="money"  required>
<label for="id">Recipient Id</label>
<input type="text" value=<%= i%> name="id"  required>
<label for="id1">User Id</label>
<input type="text" value=<%=i1 %> name="id1"  required>
<button>Transfer Money</button>
</form>
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

















