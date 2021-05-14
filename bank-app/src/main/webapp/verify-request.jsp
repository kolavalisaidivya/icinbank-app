<%@ page import ="java.sql.*" %>
<%
 String type = request.getParameter("type");
 Class.forName("com.mysql.jdbc.Driver");
 Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/icin-bank",
 "root", "Sailucky@123");
 Statement st = con.createStatement();
 ResultSet rs;
 String s2="withdraw";
 String s3="deposit";
 String s4="transfer";
if(type.equals(s2))
{
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: Arial, Helvetica, sans-serif;
background-image:url("file:///E:/ICIN-BANK1/src/main/webapp/css/bg-image.jpg");
}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password]
{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
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

<h1>Withdrawl Form</h1>
<form action="withdrawrequests.jsp" method="post">
  

  <div class="container">
      <label for="name"><b>FullName of account holder</b></label>
    <input type="text" placeholder="Enter FullName" name="name" required>
    <label for="Transaction type"><b>Choose a Account type:</b></label><br/>

<select name="type" id="type" required>
  <option value="Savings Account">Savings Account</option>
  <option value="Personal Account">Personal Account</option>
  <option value="Checking Account">Checking Account</option>
</select><br/>  
    <label for="amount"><b>Withdrawl-amount</b></label>
    <input type="text" placeholder="Enter Amount to Withdraw" name="amount" required>

    
    <button type="submit">Confirm Withdraw</button>
    
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <span class="withdraw"> <a href="welcomeuser.jsp">Cancel Withdraw</a></span>
  </div>
<%
}
else if(type.equals(s3))
{
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: Arial, Helvetica, sans-serif;
background-image:url("file:///E:/ICIN-BANK1/src/main/webapp/css/bg-image.jpg");
}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password]
{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
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

<h1>Deposit Form</h1>
<form action="depositrequests.jsp" method="post">
  

  <div class="container">
      <label for="name"><b>FullName of account holder</b></label>
    <input type="text" placeholder="Enter FullName" name="name" required>
    <label for="Transaction type"><b>Choose a Account type:</b></label><br/>

<select name="type" id="type" required>
  <option value="Savings Account">Savings Account</option>
  <option value="Personal Account">Personal Account</option>
  <option value="Checking Account">Checking Account</option>
</select><br/>  
    <label for="amount"><b>Deposit-amount</b></label>
    <input type="text" placeholder="Enter Amount to deposit" name="amount" required>

    
    <button type="submit">Confirm Deposit</button>
    
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <span class="withdraw"> <a href="welcomeuser.jsp">Cancel Deposit</a></span>
  </div>
<%
}
else if(type.equals(s4))
{
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: Arial, Helvetica, sans-serif;
background-image:url("file:///E:/ICIN-BANK1/src/main/webapp/css/bg-image.jpg");
}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password]
{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
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
<h1>Transfer Funds Form</h1>
<form action="transferfundsrequest.jsp" method="post">
  

  <div class="container">
   <label for="name1"><b>FullName of Sender</b></label>
    <input type="text" placeholder="Enter FullName of Sender as per Account" name="name1" required>
    <label for="Transaction type"><b>Choose a Account type of Sender:</b></label><br/>

<select name="type1" id="type" required>
  <option value="Savings Account">Savings Account</option>
  <option value="Personal Account">Personal Account</option>
  <option value="Checking Account">Checking Account</option>
</select><br/>  
      <label for="name"><b>FullName of Receiver</b></label>
    <input type="text" placeholder="Enter FullName of Receiver as per Account" name="name" required>
    <label for="Transaction type"><b>Choose a Account type of Receiver:</b></label><br/>

<select name="type" id="type" required>
  <option value="Savings Account">Savings Account</option>
  <option value="Personal Account">Personal Account</option>
  <option value="Checking Account">Checking Account</option>
</select><br/>  
    <label for="acctno"><b>Transfer-Account-No</b></label>
    <input type="text" placeholder="Enter Account No" name="acctno" required>

    <label for="amount"><b>Transfer-Amount</b></label>
    <input type="text" placeholder="Enter Amount to transfer" name="amount" required>

    
    <button type="submit">Confirm Transfer</button>
    
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <span class="withdraw"><a href="welcomeuser.jsp">Cancel Transfer</a></span>
  </div>
<%
}
else{
%>
<h3>Unknown Error occured While processing Transaction...<a href="welcomeuser.jsp">Try again</a></h3>
<%
}
%>
</body>
</html>