<%@ page import ="java.sql.*" %>
<%
 String user = request.getParameter("uname");
 String pwd = request.getParameter("psw");
 Class.forName("com.mysql.jdbc.Driver");
 Connection con =
DriverManager.getConnection("jdbc:mysql://localhost:3306/icin-bank",
 "root", "Sailucky@123");
 Statement st = con.createStatement();
 ResultSet rs;
 rs = st.executeQuery("select * from admin where username='" + user + "' and password='" + pwd + "'");
 if (rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  align:center;
  background-image:url("file:///E:/ICIN-BANK1/src/main/webapp/css/bg-image.jpg");
  
}

.navbar {
  overflow: hidden;
  background-color: #333;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: black;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
</head>
<body>

<div class="navbar">
  <a href="Homepage.html">Home</a>
  <div class="dropdown">
    <button class="dropbtn">About Users
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="registeredusers.jsp">Registered Users</a>
    </div>
  </div> 
  <div class="dropdown">
    <button class="dropbtn">Admin Activities
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="authorize-cheque.jsp">Authorize Check Books</a>
      
      
    </div>
  </div> 
  
 <a href="Homepage.jsp">Logout</a>
  
</div>


<div style="padding:0 16px">
  <h3>Welcome To ICIN Bank</h3>
  <p>You can do any type of transactions like withdraw,deposit etc...</p>
  <p>You can request for check books</p>
  <p>You can also see the balance in different accounts</p>
</div>



<% 
 } else {
%>
	 
 <h2>Invalid Username Or Password <a href='adminlogin.jsp'>try again</a></h2>
 <%
 }
%>
</body>
</html>