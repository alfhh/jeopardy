<%-- 
    Document   : newGame
    Created on : Apr 25, 2015, 3:17:55 AM
    Author     : ahinojosa
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Game.Course" %>
<%@page import="Game.Category" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/header.jsp" %>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12 col-md-8 col-md-offset-2 main">
          <h1 class="page-header">Select a class:</h1>

          <div class="row placeholders">
            <%
            
            /**
             * Here are printed the first three classes on the top of the
             * page.
             */
            ArrayList courses = (ArrayList)session.getAttribute("courseNames");
                for(int i = 0; i < 3; i++){
                    Course c = (Course)courses.get(i);
                    out.println("<div class='col-xs-6 col-sm-3 placeholder'>");
                    out.println("<a href='GameController?task=check&id="+c.getId()+"'>");
                    out.println("<img src='http://placehold.it/300&text="+c.getName()+"' class='img-responsive' alt='Generic placeholder thumbnail'>");
                    out.println("</a>");
                    out.println("</div>");
                }
            %>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="http://placehold.it/300&text=Add%20New%20!" class="img-responsive" alt="Generic placeholder thumbnail">
            </div>
          </div>

          <h2 class="sub-header">Section title</h2>
          <div class="table-responsive">
              
              <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Name</th>
                </tr>
              </thead>
              <tbody>
                <%
                if(session.getAttribute("categories") != null){
                    ArrayList categories = (ArrayList)session.getAttribute("categories");
                    for(int i = 0; i < categories.size(); i++){
                        Category cat = (Category)categories.get(i);
                        out.print("<tr>");
                        out.print("<td>"+cat.getName()+"</td>");
                        out.print("</tr>");
                    }

                }
                %>
              </tbody>
            </table>
          </div>
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
