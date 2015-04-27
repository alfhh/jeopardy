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
<script type="text/javascript" src="slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
  <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
				

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
  <script>
            $(document).ready(function(){
                $('.row placeholders').slick({
                centerMode: true,
                centerPadding: '60px',
                slidesToShow: 3,
                responsive: [
                  {
                    breakpoint: 768,
                    settings: {
                      arrows: false,
                      centerMode: true,
                      centerPadding: '40px',
                      slidesToShow: 3
                    }
                  },
                  {
                    breakpoint: 480,
                    settings: {
                      arrows: false,
                      centerMode: true,
                      centerPadding: '40px',
                      slidesToShow: 1
                    }
                  }
                ]
              });
          });    

                </script>
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
                if(session.getAttribute("categories") != null){
                    ArrayList categories = (ArrayList)session.getAttribute("categories");
                    for(int i = 0; i < categories.size(); i++){
                        Category cat = (Category)categories.get(i);
                        out.print("<tr>");
                        out.print("<td>"+cat.getName()+"</td>");
                        out.print("<td><input type='checkbox' name='categories' value='"+cat.getId()+ "_"+ cat.getName() +"'><br></td>");
                        out.print("</tr>");
                    }

                }
                %>
              </tbody>
            </table>
            <button type="submit" class="btn btn-default">Submit</button>
           </form>
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
