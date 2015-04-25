<%-- 
    Document   : userMain
    Created on : Apr 24, 2015, 10:54:32 PM
    Author     : ahinojosa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="professor" scope="session" class="User.Professor"/>

<jsp:useBean id = "datos" scope= "session"
                     class = "DataBase.DBHandler" />
<%
    
    String valid = (String) session.getAttribute("validLogin");
    if(valid != null){
        if(valid.equals("false")){
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
            dispatcher.forward(request, response);
        }
    }
    else{
       RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
            dispatcher.forward(request, response); 
    }
    %>

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

    <title>Home Page</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/jumbotron-narrow.css" rel="stylesheet">
    
    <!-- Bootstrap JS -->
    <script src="js/bootstrap.min.js" ></script>

  </head>

  <body>

    <div class="container">
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="GameController?task=new">Game +</a></li>
            <li role="presentation"><a href="#" >email@test.com</a></li>
            <li role="presentation"><a href="#">Help</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Welcome <jsp:getProperty name="professor" property="fname"/> <jsp:getProperty name="professor" property="lname"/></h3>
      </div>

      <div class="jumbotron">
        <h1>Jeopardy Generator</h1>
        <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        <p><a class="btn btn-lg btn-success" href="#" role="button">Sign up today</a></p>
      </div>

      <footer class="footer">
        <p>&copy; Company 2014</p>
      </footer>

    </div> <!-- /container -->


  </body>
</html>
