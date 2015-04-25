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
            var email = '<%= session.getAttribute("email1") %>'
            var name = '<%= session.getAttribute("fname1") %>'
            var last = '<%= session.getAttribute("lname1") %>'
            var pass = '<%= session.getAttribute("pass1") %>'
                   
            window.alert(email));
            $.ajax({
        type: "POST",
        url: "https://mandrillapp.com/api/1.0/messages/send.json",
        data: {
          'key': 'xwAoTe-1ZDyb2yTDPTks3w',
          'message': {
            'from_email': 'newAccount@JeroGen.com',
            'to': [
                {
                  'email': '' + email,
                  'name': '' + name,
                  'type': 'to'
                }
              ],
            'autotext': 'true',
            'subject': 'Your mail subscription!',
            'html': 'Hello ' + name +', your new passowrd is ' + password +''
          }
        }
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
