<%-- 
    Document   : historyByStudent
    Created on : Apr 25, 2015, 10:46:34 PM
    Author     : enriqueohernandez
--%>

<!-- /Displays the game history by student id -->
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="User.Student"%>
<%@page import="Game.ArrayChange"%>
<jsp:useBean id="student" scope="session" class="User.Student"/>
<%@include file="/header.jsp" %>
    <div class="container">  
        
        <input type="number" id="bar" name="bar" class="form-control" placeholder="Please enter Student ID">
        <br>
        <button type="button" class="btn btn-default" id="submit"  >Enter</button>
        <br>
        <br>
<div id="result1"></div>       

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
<script>
     $(document).ready(function() {
            $('#submit').click(function(event)
            {
                $.ajax({
                    type: "get",
                    url: "AjaxControlador", //this is my servlet
                    data: "val="+$('#bar').val(),
                    success: function(msg){   
                        var panel = document.getElementById("result1");
                        panel.innerHTML= msg;
                    }
                });
            });
        });
</script>
  </body>
</html>

