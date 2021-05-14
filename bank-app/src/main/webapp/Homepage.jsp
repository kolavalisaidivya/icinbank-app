<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
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

.subnav {
  float: left;
  overflow: hidden;
}

.subnav .subnavbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: black;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .subnav:hover .subnavbtn {
  background-color: blue;
}

.subnav-content {
  display: none;
  position: absolute;
  left: 0;
  background-color: blue;
  width: 100%;
  z-index: 1;
}

.subnav-content a {
  float: left;
  color: white;
  text-decoration: none;
}

.subnav-content a:hover {
  background-color: #eee;
  color: black;
}

.subnav:hover .subnav-content {
  display: block;
}
</style>
</head>
<body>

<div class="navbar">
  <a href="#home">Home</a>
  
  <div class="subnav">
    <button class="subnavbtn">Admin Services</button>
    <div class="subnav-content">
      <a href="adminlogin.jsp">Admin Login</a>
    </div>
  </div> 
  <div class="subnav">
    <button class="subnavbtn">User Services <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
      <a href="register.jsp">Registration for user</a>
      <a href="userlogin.jsp">Login user</a>
    </div>
  </div>
  <a href="contact.jsp">Contact</a>
</div>

<div style="padding:0 16px">
  <h3>Welcome To ICIN Bank</h3>
  <p>If you are a Admin you can login using Admin login</p>
  <p>If you are a user you can register by giving your details</p>
  <p>if you have already registered,Then you can login using your credentials</p>
</div>

</body>
</html>
