<%-- 
    Document   : history
    Created on : Apr 25, 2015, 9:08:09 PM
    Author     : enriqueohernandez
--%>

<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="User.Student"%>
<jsp:useBean id="student" scope="session" class="User.Student"/>
<%@include file="/header.jsp" %>

<%

%>
    <div class="container">   
       
<%!
    public String addLinebreaks(String input, int maxLineLength) {
        StringTokenizer tok = new StringTokenizer(input, " ");
        StringBuilder output = new StringBuilder(input.length());
        int lineLen = 0;
        while (tok.hasMoreTokens()) {
            String word = tok.nextToken();

            if (lineLen + word.length() > maxLineLength) {
                output.append(word + "<br/>");
                lineLen = 0;
            } else {
                output.append(word + " ");
                lineLen += word.length() + 1;
            }
        }
        return output.toString();
    }
%>

        <%
            ArrayList student1 = (ArrayList) request.getAttribute("lista");

            %>
        <h1 class="lead">
            History!
        </h1>
        <table class="table table-hover">
            <tr><th>First Name</th><th>Last Name</th> <th>Number</th><th>Points</th> <th>Team Name</th><th>Game</th></tr>
            <%
            for (int i = 0; i < student1.size(); i++) {
                    Student s = (Student) student1.get(i);
            %>
            <tr><td><%=s.getFname()%></td><td><%=s.getLname()%></td><td><%=s.getNumber()%></td><td><%=s.getPoints()%></td><td><%=s.getTeamName()%></td><td><%=s.getGame()%></td></tr>
            <%}%>
        </table>
        <br/><br/>
                

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>

  </body>
</html>

