<%-- 
    Document   : gameTest
    Created on : Apr 26, 2015, 10:58:21 PM
    Author     : ahinojosa
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Game.Square" %>
<%@page import="Game.Category" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/header.jsp" %>
        
<%
    ArrayList col2 = (ArrayList)session.getAttribute("c2");
    for(int i = 0; i < 5; i++){
        Square c = (Square)col2.get(i);
        out.println(c.getQuestion());
    }
    
%>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>