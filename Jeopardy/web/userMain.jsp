<%-- 
    Document   : userMain
    Created on : Apr 24, 2015, 10:54:32 PM
    Author     : ahinojosa
--%>
<%@include file="/header.jsp" %>

    <div class="container">
                                <%
                //If bad input the message gets displayed.
        String message = (String) request.getAttribute("message");
        if(message != null){
            
            %>  <div class="alert alert-success"><%= message%></div>
                <%
        }
    %>

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>New GAME</h1>
        <p>Press the button to play a new game</p>
        <p></p>
        <p>
          <a class="btn btn-lg btn-primary" href="GameController?task=new" role="button">Game +</a>
        </p>
      </div>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

  </body>
</html>
