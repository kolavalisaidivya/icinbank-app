<%@ page import="java.sql.*" %>
<% 
    int dlt = Integer.parseInt(request.getParameter("id2"));
String s=request.getParameter("trans");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/icin-bank","root","Sailucky@123");

    Statement st = con.createStatement();;  

     ResultSet rs= st.executeQuery(" select * from user where id="+dlt);
    if ( rs.next()) {
    	if(s.equals("user")){
    	
    	int i1=st.executeUpdate("update user set block='active user' where id="+dlt);
    	if(i1>0)
    	{
         %>
         <!DOCTYPE html>
         <html>
         <head>
         <style>
         body
         {
         background-image:url("file:///E:/ICIN-BANK1/src/main/webapp/css/bg-image.jpg");
         }</style></head>
         <body>
         <h2>User is unblocked successfully!</h2>
    	 <h3><a href="welcomeuser.jsp">Go to Home page</a></h3>
         
<%
        }
    	else{%>
    	<h2>User Unblocking is not Successful</h2>
<%
    	}
    	}
    	else if(s.equals("withdraw")){
    		int i1=st.executeUpdate("update user set withdraw='active user' where id="+dlt);
        	if(i1>0)
        	{
             %>
             <!DOCTYPE html>
             <html>
             <head>
             <style>
             body
             {
             background-image:url("file:///E:/ICIN-BANK1/src/main/webapp/css/bg-image.jpg");
             }</style></head>
             <body>
             <h2>User is unblocked successfully For Withdraw Transactions!</h2>
        	 <h3><a href="welcomeuser.jsp">Go to Home page</a></h3>
             
    <%
            }
        	else{%>
        	<h2>User Unblocking is not Successful For Withdrawl Transaction</h2>
    <%
        	}
        	}

else if(s.equals("deposit")){
    		int i1=st.executeUpdate("update user set deposit='active user' where id="+dlt);
        	if(i1>0)
        	{
             %>
             <!DOCTYPE html>
             <html>
             <head>
             <style>
             body
             {
             background-image:url("file:///E:/ICIN-BANK1/src/main/webapp/css/bg-image.jpg");
             }</style></head>
             <body>
             <h2>User is unblocked successfully For Deposit Transactions!</h2>
        	 <h3><a href="welcomeuser.jsp">Go to Home page</a></h3>
             
    <%
            }
        	else{%>
        	<h2>User Unblocking is not Successful For Deposit Transaction</h2>
    <%
        	}
        	}
else if(s.equals("transaction")){
	int i1=st.executeUpdate("update user set transaction='active user' where id="+dlt);
	if(i1>0)
	{
     %>
     <!DOCTYPE html>
     <html>
     <head>
     <style>
     body
     {
     background-image:url("file:///E:/ICIN-BANK1/src/main/webapp/css/bg-image.jpg");
     }</style></head>
     <body>
     <h2>User is unblocked successfully For Transfer Transactions!</h2>
	 <h3><a href="welcomeuser.jsp">Go to Home page</a></h3>
     
<%
    }
	else{%>
	<h2>User Unblocking is not Successful For Transfer Transaction</h2>
<%
	}
	}
}
    else
    {
    	out.println("User is not available");
    }
%>
</body>
</html>