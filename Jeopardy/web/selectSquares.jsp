<%-- 
    Document   : selectSquares
    Created on : Apr 26, 2015, 2:56:52 AM
    Author     : ahinojosa
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Game.Square" %>
<%@page import="Game.Category" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/header.jsp" %>
        
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12 col-md-8 col-md-offset-2 main">
            <form action="GameController?task=go" method="post">
            <%
                for(int i = 0; i < 6; i++) {
                    
                    out.println("<h2 class='sub-header'>"+ session.getAttribute("catName"+i) +"</h2>");
                    out.println("<div class='table-responsive'>");      
                    out.println("<table class='table table-striped'><thead>");
                    out.println("<tr><th>Question</th><th>Answer</th><th>Points</th><th>Select</th></tr></thead>");
                    out.println("<tbody>");
                    
                    ArrayList squares = (ArrayList)session.getAttribute("squares"+i);
                    for(int j = 0; j < squares.size(); j++){
                        Square sq = (Square)squares.get(j);
                        out.println("<tr>");
                        out.println("<td>"+sq.getQuestion()+"</td>");
                        out.println("<td>"+sq.getHint()+"</td>");
                        out.println("<td>"+sq.getScore()+"</td>");
                        // THE ID OF THE CATEGORY IS PRINTED FIRST, THEN THE ID OF THE SQUARE
                        out.println("<td><input type='checkbox' name='"+session.getAttribute("catName"+i)+"' value='"+sq.getID()+"'></td>");
                        out.println("</tr>");
                    }
                    
                    out.println("</tbody></table>");
                }
                    
 
            %>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>  
          
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
