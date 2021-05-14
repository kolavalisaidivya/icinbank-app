<html>
<head>
<title>Registration Page for user</title>
<style>
body{
background-image:url("file:///E:/ICIN-BANK1/src/main/webapp/css/bg-image.jpg");
}
.container {
  padding: 16px;
}
input[type=text], input[type=password],input[type=date] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

h3 {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
    color: dodgerblue;
  
}

button {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
    background: powderblue;
  
}

button:hover {
  opacity:1;
  background: powderblue;
  
}

select {
                appearance: none;
                outline: 0;
                background: powderblue;
                background-image: none;
                width: 100%;
                height: 10%;
                color: black;
                cursor: pointer;
                border:1px solid black;
                border-radius:3px;
            }

.signin {
  background-color: #f1f1f1;
  text-align: center;
  background: powderblue;
  
}

</style>
</head>
<body>
<form action="registeruser.jsp">
  <div class="container">
<h1>Bank Account Registration Form</h1><br/>
<h3>Enter the Account Details</h3><br/><br/>
<label for="Account type">Choose a Account:</label><br/>

<select name="type" id="type" required>
  <option value="Checking Account">Checking Account</option>
  <option value="Savings Account">Savings Account</option>
  <option value="primary Account">Primary Account</option>
</select>
<br/><br/>
<label>Account No.:</label>
<input type="text" name="acctno" id="acctno" placeholder="Account No." required>
<br/><br/>


<h3>Personal Information</h3><br/>
<p>The information given in this section is considered as the information of the primary account owner information.</p><br/><br/>
<label>Name:</label>
<input type="text" name="name" id="name" placeholder="full name" required>
<br/><br/>
<label>Phone Number:</label><br/>
<input type="text" name="ph.no" id="pn" placeholder="enter phone number" required>
<br/><br/>
<label for="start">Date of Birth:</label>

<input type="date" id="dob" name="dob"
       min="1980-01-01" max="2020-12-31">

<br/><br/>
<h3>Login Information:</h3>
<label>Username:</label><br/>
<input type="text" name="username" id="un" placeholder="username" required>
<br/><br/>
<label>Password:</label><br/>
<input type="password" name="password" id="pw" placeholder="password" required>
<br/><br/>

<input type="checkbox" value="ia" required>
<label>I agree to the terms and conditions</label>
<br/><br/>
<button type="submit" name="register"  id="register">Register
</button>
</div>
 <div class="container signin">
    <p>Already have an account? <a href="userlogin.jsp">Sign in</a>.</p>
  </div>
</form>
</body>

</html>