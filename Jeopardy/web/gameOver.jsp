<%-- 
    Document   : gameOver
    Created on : Apr 27, 2015, 9:47:15 PM
    Author     : enriqueohernandez
--%>

<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="User.Team"%>
<%@page import="java.util.ArrayList"%>
<%@include file="/header.jsp" %>

    <div class="container">
        <table class="table table-hover">
            <tr><th>Team</th><th>Points</th></tr>
        
        <%
             ArrayList teams = (ArrayList) session.getAttribute("Team");
             
                      
                for(int i = 0; i<teams.size();i++){
                    Team tm =(Team)teams.get(i);
                   out.println("<tr><td>"+tm.getName()+"</td><td>"+tm.getPuntaje()+"</td></tr>");
                    
                 }
            
            %>
            
            <h1 class="text-center">Thanks for playing!</h1>
            <br>
  
        </table>
    

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

  </body>
</html>
