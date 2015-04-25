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
    <script type = "text/javascript">
             function validar(){
                 //e.preventDefault;
                // window.alert("OHsHIT");

             var password =  document.getElementById('password').value;
             var verPassword = document.getElementById('passwordVer').value;
             if(password != verPassword){
                 document.getElementById("message").innerHTML = "Passwords are not equal, please change them!";
                 return false;
             }
        }
        </script>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
  </head>

  <body>

    <div class="container">

      <form action="LoginControlador?login=changePass" method ="POST" class="form-signin" onsubmit="return validar()">
        <h2 class="form-signin-heading">This is the first time you login</h2>
        <h5 class="form-signin-heading">Please Change your password</h5>
        <label for="newPassword" class="sr-only">new password</label>
        <input type="password" id="password" name="newpass" class="form-control" placeholder="new password" required autofocus>
        <label for="verifyPassword" class="sr-only">verify password</label>
        <input type="password" id="passwordVer" name="verpass" class="form-control" placeholder="verify password" required>
            

        <button class="btn btn-lg btn-primary btn-block" value="Ldgin" type="submit" >Change Password</button>
        
        <p id="message" style="color:red"></p> 
      </form>

    </div> <!-- /container -->
  </body>
</html>

