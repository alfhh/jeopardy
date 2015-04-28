<%-- 
    Document   : chooseGameMode
    Created on : Apr 27, 2015, 6:03:15 PM
    Author     : mrquorr
--%>
<%@include file="/header.jsp" %>

    <div class="container">
        
      <form action="GameController?task=choose" method="post">
      
          <input type="radio" name="type" value="solo" onclick="
              document.getElementById('teamNumber').disabled = true;
                        " checked>Solo
          
          <input type="radio" name="type" value="team" onclick="
              document.getElementById('teamNumber').disabled = false;
                        ">Team
          
          <input type="number" name="quantity" id="teamNumber" disabled value="2">
          
          <input type="submit" value="Submit" />
      </form>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

  </body>
</html>