<%-- 
    Document   : login
    Created on : Mar 18, 2015, 12:21:03 PM
    Author     : enriqueohernandez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id = "datos" scope= "session"
                     class = "DataBase.DBHandler" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
    <center>
        <br/><br/>
        <h1>Welcome!</h1>
        <form action="LoginControlador?login=true" method ="POST">
            Email: <input type="text" name="email"><br><br>
            Password: <input type="Password" name="password"><br><br>
            <%
                //Si regresa un resultado invalido volvemos a la pagina
        String invalidUser = (String) request.getAttribute("invalidUser");
        if(invalidUser != null){
            if(invalidUser.equals("invalid")){
                %>  <p style="color:red">Invalid Password.</p>
                <%
            }
        }
    %>
    
            <input type="submit" value="Login">
            
        </form>

    </center>
</body>
</html>
