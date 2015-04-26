<%-- 
    Document   : sendMail
    Created on : Apr 25, 2015, 6:46:14 AM
    Author     : enriqueohernandez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="User.Professor"%>
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
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type = "text/javascript">
        $(document).ready(function() {
            //window.alert("enviarMAil");
            var email = '<%= session.getAttribute("email1") %>';
            var name = '<%= session.getAttribute("fname1") %>';
            var last = '<%= session.getAttribute("lname1") %>';
            var pass = '<%= session.getAttribute("pass1") %>';
            var completeName = name + ' ' +last;
            var mailBody = 'Hello, ' + completeName + '\r\n Your account is ready!, \r\n Your username is: ' + email + ' and password: ' + pass+' \r\n Please login to change your password.';
            
            $.ajax({
            type: "POST",
            url: "https://mandrillapp.com/api/1.0/messages/send.json",
            data: {
                'key': 'xwAoTe-1ZDyb2yTDPTks3w',
                'message': {
                    'from_email': 'mail@JeoCreate.com',
                    'to': [
          {
              'email': email,
              'name': completeName,
              'type': 'to'
          }
        ],
                    'autotext': 'true',
                    'subject': 'Your new account is ready!',
                    'html': mailBody
                }
            }
        }).done(function (response) {
            console.log(response);
        });
    
        });
    </script>

    <title>Email has been sent</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sticky-footer.css" rel="stylesheet">

  </head>

  <body>

    <!-- Begin page content -->
    <div class="container">
      <div class="page-header">
        <h1>Account creation successful!</h1>
      </div>
      <p class="lead">Thank you <%= session.getAttribute("fname1") %> <%= session.getAttribute("lname1") %></p>
      <p>A confirmation email has been sent to <%= session.getAttribute("email1") %> with your new password.</p>
    </div>

    <footer class="footer">
      <div class="container">
        <p class="text-muted">Account creation successful!</p>
      </div>
    </footer>

  </body>
</html>
