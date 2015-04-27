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
                    
                    out.print("<h2 class='sub-header'>"+ session.getAttribute("catName"+i) +"</h2>");
                    out.print("<div class='table-responsive'>");      
                    out.print("<table class='table table-striped'><thead>");
                    out.print("<tr><th>Question</th><th>Answer</th><th>Points</th><th>Select</th></tr></thead>");
                    out.print("<tbody>");
                    
                    ArrayList squares = (ArrayList)session.getAttribute("squares"+i);
                    for(int j = 0; j < squares.size(); j++){
                        Square sq = (Square)squares.get(j);
                        out.print("<tr>");
                        out.print("<td>"+sq.getQuestion()+"</td>");
                        out.print("<td>"+sq.getHint()+"</td>");
                        out.print("<td>"+sq.getScore()+"</td>");
                        out.print("<td><input type='checkbox' name='categories' value='1'></td>");
                        out.print("</tr>");
                    }
                    
                    out.print("</tbody></table>");
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
