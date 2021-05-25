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
 rs = st.executeQuery("select * from user where username='" + user + "' and password='" + pwd + "'");
 if (rs.next()) {
	 int id1=rs.getInt("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

body {
  font-family: Arial, Helvetica, sans-serif;
  background-image:url("file:///E:/ICIN-BANK1/src/main/webapp/css/bg-image.jpg");
  
}
select {
                appearance: none;
                outline: 0;
                background: powderblue;
                background-image: none;
                width: 100%;
                height: 100%;
                color: black;
                cursor: pointer;
                border:1px solid black;
                border-radius:3px;
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
form {border: 3px solid #f1f1f1;}

body
{
align:center;
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
    <button class="dropbtn">User Activities
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="cheque-book.jsp?id2=<%=id1%>">Request Admin for Cheque-books</a>

    </div>
  </div> 
  <div class="dropdown">
    <button class="dropbtn">User Services
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="viewtransactions.jsp?id2=<%=id1%>">View Transactions</a>
      <a href="checkbalance.jsp?id2=<%=id1%>">Balance Enquiry</a>
      <a href="addrecipient.jsp?id2=<%=id1%>">Add Recipients</a>
      <a href="viewrecipient.jsp?id2=<%=id1%>">View Recipients</a>

    </div>
  </div> 
  
 <a href="Homepage.jsp">Logout</a>
  
</div>
<form action="verify-request.jsp">
<h2><label for="Transaction type">Choose a Transaction:</label></h2>

<select name="type" id="type" required>
  <option value="withdraw">Withdraw</option>
  <option value="deposit">Deposit</option>
  <option value="transfer">Transfer Funds</option>
</select>
<br/><br/>`
<button type="submit" name="register"  id="register">Do Transaction
</button>
</form>

<div style="padding:0 16px">
  <h3>Welcome To ICIN Bank</h3>
  <h3>For doing any transaction...... You need to have the grant access from the Admin</h3>
  <p>You can do any type of transactions like withdraw,deposit etc...</p>
  <p>You can request for cheque books</p>
  <p>You can also see the balance in different accounts</p>
</div>
<br/><br/>
</body>
</html>

<% 
 } else {
%>
 <h2>Invalid User or Password <a href='userlogin.jsp'>try again</a></h2>
<%
 }
%>