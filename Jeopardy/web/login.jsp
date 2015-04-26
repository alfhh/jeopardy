<%-- 
    Document   : login
    Created on : Mar 18, 2015, 12:21:03 PM
    Author     : enriqueohernandez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id = "datos" scope= "session"
                     class = "DataBase.DBHandler" />

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
  </head>

  <body>
  

    <div class="container">

      <form action="LoginControlador?login=true" method ="POST" class="form-signin">
        <h2 class="form-signin-heading">Please sign in</h2>
         <%
                //It displays the message if we changed the password successfully 
        String newPass = (String) request.getAttribute("newPassword");
        if(newPass != null){
                %>  <p style="color:green"> Change Successful!, please login with your new password </p>
                <%
            
        }
    %>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="text" id="inputEmail" name="email" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
                        <%
                //It displays the number of tries in case the password was wrong
        String numberTries = (String) request.getAttribute("numberTries");
        if(numberTries != null){
                %>  <p style="color:green"> Number of tries (3 or more blocked): <%=numberTries%></p>
                <%
            
        }
    %>
    
                        <%
                //If bad input the message gets displayed.
        String invalidUser = (String) request.getAttribute("invalidLogin");
        if(invalidUser != null){
            if(invalidUser.equals("invalid")){
                %>  <p style="color:red">Invalid password or email, please try again.</p>
                <%
            }
        }
    %>
        
        
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>

        <button class="btn btn-lg btn-primary btn-block" value="Ldgin" type="submit">Sign in</button>
      </form>
    
    <br><br><br><br>
    <center>
      <form action="CreateUser.jsp" method ="POST">
            <button type="submit"   class="btn btn-default">Create User</button>
      </form>
    </center>
  
    </div> <!-- /container -->
  </body>
</html>

