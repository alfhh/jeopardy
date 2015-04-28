<%-- 
    Document   : chooseSolo
    Created on : Apr 27, 2015, 6:36:32 PM
    Author     : mrquorr
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="User.Student"%>
<%@include file="/header.jsp" %>

    <div class="container">

        <form action="GameController?task=toGame" method="post">
        <table class="table table-bordered table-striped">
            <tr><th>Student</th><th>Plays?</th></tr>
                <% 
                    int size = (Integer) request.getAttribute("studentNum");
                    ArrayList list = (ArrayList) request.getAttribute("students");
                    for (int i = 0; i < size; i++){
                        Student s = (Student) list.get(i);
                %>
            <tr><td><%= s.getFname() %> <%= s.getLname() %> </td><td><input type="checkbox" name="<%= s.getIdS() %>" value="<%= s.getIdS() %>"></td></tr>
                <%
                    }
                %>
        </table>
         <input type="submit" value="Submit" class="btn btn-default">
        </form>
        
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>
