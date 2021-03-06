<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="professor" scope="session" class="User.Professor"/>

<jsp:useBean id = "datos" scope= "session"
                     class = "DataBase.DBHandler" />
<jsp:useBean id = "datos2" scope= "session"
                     class = "DataBase.DBGame" />
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

    <title>JeoGen - Jeopardy</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/navbar-fixed-top.css" rel="stylesheet">
    
    <script src="js/bootstrap.min.js"></script>

  </head>

  <body>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="userMain.jsp">Welcome <jsp:getProperty name="professor" property="fname"/> <jsp:getProperty name="professor" property="lname"/></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="userMain.jsp">Home</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">History <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="HistoryContrlador?history=getAllProfessor">By Professor</a></li>
                <li><a href="historyByStudent.jsp">By Student</a></li>
              </ul>
              
                 
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Add-Modify-Edit <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="modCurso.jsp">Course</a></li>
                <li><a href="modCategory.jsp">Category</a></li>
                <li><a href="modSquares.jsp">Questions</a></li>
              </ul>
            </li>  
            <li><a href="addStudent.jsp">AddStudent</a></li>
            
          </ul>
          <ul class="nav navbar-nav navbar-right">
            
            <li class="active"><a href="LoginControlador?login=logout">Logout <span class="sr-only">(current)</span></a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>