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
    ArrayList columns = new ArrayList();
    columns.add((ArrayList)session.getAttribute("c1"));
    columns.add((ArrayList)session.getAttribute("c2"));
    columns.add((ArrayList)session.getAttribute("c3"));
    columns.add((ArrayList)session.getAttribute("c4"));
    columns.add((ArrayList)session.getAttribute("c5"));
    columns.add((ArrayList)session.getAttribute("c6"));
   
    

  for (int i = 0; i < 5; i++) {
      for(int j = 0; j < 6; j++){
        ArrayList temp = (ArrayList)columns.get(j);
        Square sq = (Square)temp.get(i);
        out.println("<button type='button' class='btn btn-primary' data-toggle='modal' data-target='."+sq.getID()+"'>"+sq.getScore()+"</button>");
        out.println("<div class='modal fade "+sq.getID()+"' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel' aria-hidden='true'>");
        out.println("<div class='modal-dialog modal-lg'><div class='modal-content'>");

        //HERE GOES THE CONTENT
        out.println("</div></div></div>");
      }
      out.println("<br><br>");
  }
%>

<!-- Large modal -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>