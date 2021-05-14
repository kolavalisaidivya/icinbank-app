<%
int id=Integer.parseInt(request.getParameter("id2"));
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<h2>Adding Recipients</h2>

<form action="recipients.jsp?id2=<%=id %>" method="post">
  

  <div class="container">
    <label for="name"><b>Name</b></label>
    <input type="text" placeholder="Enter Name of the Account Holder" name="name" required>

    <label for="acctno"><b>Account No.</b></label>
    <input type="text" placeholder="Enter Account No." name="acctno" required>
    <label for="Account type"><b>Choose a Account Type:</b></label><br/>

<select name="type" id="type" required>
  <option value="Savings Account">Savings Account</option>
  <option value="Primary Account">Primary Account</option>
  <option value="Checking Account">Checking Account</option>
</select>
    <br/><br/>
            
    <button type="submit">Add</button>
    
  </div>

  
</form>

</body>
</html>
