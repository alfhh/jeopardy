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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type = "text/javascript">
        $(document).ready(function() {
            //window.alert("enviarMAil");
            var email = '<%= session.getAttribute("email1") %>';
            var name = '<%= session.getAttribute("fname1") %>';
            var last = '<%= session.getAttribute("lname1") %>';
            var pass = '<%= session.getAttribute("pass1") %>';
            var completeName = name + ' ' +last;
            var mailBody = 'Hello, ' + completeName + 
                    '\n\ Your account is ready!, \n\
                        \n\ Your username is: ' + email + '\n\ and password: ' + pass+'\
                        \n\ Please login to change your password.';
            
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
                   
          
 

       /*
       * private int id;
    private String fname;
    private String lname;
    private String password;
    private String email;
    private int status;
    private int tries;
        */
    </script>
        <title>Check your email</title>
    </head>
    <body>
        <h1>Check your email</h1>
    </body>
</html>
