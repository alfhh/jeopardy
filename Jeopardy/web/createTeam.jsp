<%-- 
    Document   : createTeam
    Created on : Apr 28, 2015, 2:54:24 AM
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
            <form role="form" action="GameController?task=saveTeam" method="post">
            <%                    
                for(int i = 0; i < (int)session.getAttribute("quantity"); i++){
                    out.println("<div class='form-group'>");
                    out.println("<label for='Team"+i+"'>Team: "+(i+1)+"</label>");
                    out.println("<input type='text' class='form-control' name='Team"+i+"' placeholder='Enter TeamName'></div><br>");
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
