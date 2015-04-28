<%-- 
    Document   : showBlobs
    Created on : Apr 28, 2015, 8:32:30 AM
    Author     : ahinojosa
--%>

<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="User.Team"%>
<%@page import="Game.Blob"%>
<%@page import="DataBase.DBHandler"%>
<%@page import="java.util.ArrayList"%>
<%@include file="/header.jsp" %>

    <div class="container">
        <table class="table table-hover">
        
        <%
            out.println("<h2 class='sub-header'>By Students</h2>");
            out.println("<div class='table-responsive'>");
            out.println("<table class='table table-striped'><thead>");
            out.println("<tr><th>Date</th><th>Name</th><th>Points</th></tr></thead>");
            out.println("<tbody>");
            ArrayList solo = (ArrayList)session.getAttribute("lSolos");
        
            for(int i = 0; i < solo.size(); i++) {
                    Blob b = (Blob)solo.get(i);
                    out.println("<tr><td>"+b.getDate()+"</td><td>"+DBHandler.getSNamse(b.getFk_group()) +"</td><td>"+b.getPoints()+"</td></tr>");
                }
            out.println("</tbody></table>");
            
         %>
            
            <br>
        </table>
         
         <br>
         
         <table class="table table-hover">
        
        <%
            out.println("<h2 class='sub-header'>By Teams</h2>");
            out.println("<div class='table-responsive'>");
            out.println("<table class='table table-striped'><thead>");
            out.println("<tr><th>Date</th><th>Name</th><th>Points</th></tr></thead>");
            out.println("<tbody>");
            ArrayList equipo = (ArrayList)session.getAttribute("lEquipos");
        
            for(int i = 0; i < equipo.size(); i++) {
                    Blob b = (Blob)equipo.get(i);
                    out.println("<tr><td>"+b.getDate()+"</td><td>"+DBHandler.getTNamse(b.getFk_group()) +"</td><td>"+b.getPoints()+"</td></tr>");
                }
            out.println("</tbody></table>");
            
         %>
            
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
