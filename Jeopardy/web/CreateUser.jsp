<%-- 
    Document   : CreateUser
    Created on : Apr 25, 2015, 5:17:49 AM
    Author     : enriqueohernandez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id = "datos" scope= "session"
                     class = "DataBase.DBHandler" />
<!DOCTYPE html>
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

    <title>Create your account</title>
    

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sticky-footer.css" rel="stylesheet">
    
    

  </head>

  <body>

    <!-- Begin page content -->
    <div class="container">
      <div class="page-header">
        <h1>Create your account</h1>
      </div>
      <p class="lead">Please enter your first name, last name and email!</p>
      
      <form action="LoginControlador?login=CreateNewUser" method ="POST" class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="email" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">First Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="name" placeholder="First Name">
    </div>
  </div>
          <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Last Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="last" placeholder="Last Name">
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default" value="Ldgin" id="sendMail">Create Account</button>
    </div>
  </div>
</form>
      
    </div>

    <footer class="footer">
      <div class="container">
        <p class="text-muted">Create new Account.</p>
      </div>
    </footer>
  </body>
</html>
