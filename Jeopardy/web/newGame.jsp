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
      
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <%
            
            /**
             * Here are printed the first three classes on the top of the
             * page.
             */ 
                int numb = 0;
                if(session.getAttribute("idCategories")!=null){
                    numb = (Integer)(session.getAttribute("idCategories"));
                }
                
            ArrayList courses = (ArrayList)session.getAttribute("courseNames");
                for(int i = 0; i < courses.size(); i++){
                    Course c = (Course)courses.get(i);
                    if(i == numb)
                        out.println("<li data-target='#myCarousel' data-slide-to='" +i+"' class='active'></li>");
                    else
                        out.println("<li data-target='#myCarousel' data-slide-to='" +i+"'></li>");
                             
                }
                /*
                    
                */
            %>
            </ol>

            <!-- Wrapper for slides -->
          <div class="carousel-inner" role="listbox">
              <%
                ArrayList courses1 = (ArrayList)session.getAttribute("courseNames");
                for(int i = 0; i < courses1.size(); i++){
                    Course c = (Course)courses1.get(i);
                    if(i==numb)
                        out.println("<div class='item active'>");
                    else
                        out.println("<div class='item'>");
                    out.println("<a href='GameController?task=check&id="+c.getId()+"&num="+i+"'>"); 
                    out.println("<img class='img-responsive center-block' src='http://placehold.it/300&text="+c.getName()+"' alt=''>");
                    out.println("</a>");
                    out.println("</div>");
                }
                    
                    
                %>
            
          </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
      
           <%
                if(session.getAttribute("categories") != null){
            %>
          <h2 class="sub-header">Section title</h2>
          <div class="table-responsive">
              <form action="GameController?task=questions" method="post">
              <table class="table table-striped">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Select</th>
                </tr>
              </thead>
              <tbody>
                <%
                
                    ArrayList categories = (ArrayList)session.getAttribute("categories");
                    for(int i = 0; i < categories.size(); i++){
                        Category cat = (Category)categories.get(i);
                        out.print("<tr>");
                        out.print("<td>"+cat.getName()+"</td>");
                        out.print("<td><input type='checkbox' name='categories' value='"+cat.getId()+ "_"+ cat.getName() +"'><br></td>");
                        out.print("</tr>");
                    }

                
                %>
              </tbody>
            </table>
            <button type="submit" class="btn btn-default">Submit</button>
           </form>
          </div>
          <%
             }
            %>  
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
