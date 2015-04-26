<%-- 
    Document   : historyByStudent
    Created on : Apr 25, 2015, 10:46:34 PM
    Author     : enriqueohernandez
--%>


<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="User.Student"%>
<%@page import="Game.ArrayChange"%>
<jsp:useBean id="student" scope="session" class="User.Student"/>
<%@include file="/header.jsp" %>
<%
            ArrayList student1 = (ArrayList) request.getAttribute("lista");

            %>
<script>
    var myArray = <%= toJavascriptArray(student1) %>;
</script>

<%

%>
    <div class="container">   
    
<input type="text" class="form-control" placeholder="Text input">

<div id="resultado"></div>       

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>

  </body>
</html>

