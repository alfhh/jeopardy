<%-- 
    Document   : game.jsp
    Created on : Apr 25, 2015, 10:47:09 PM
    Author     : mrquorr
--%>

<%@page import="Game.Square"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jeopardy</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="js/game.js"></script>
    </head>
    <body>
        <%
            //Receive the different columns and their headers. 
            ArrayList col1 = (ArrayList) request.getAttribute("c1");
            String col1H = (String) request.getAttribute("c1Header");
            ArrayList col2 = (ArrayList) request.getAttribute("c2");
            String col2H = (String) request.getAttribute("c2Header");
            ArrayList col3 = (ArrayList) request.getAttribute("c3");
            String col3H = (String) request.getAttribute("c3Header");
            ArrayList c4l1 = (ArrayList) request.getAttribute("c4");
            String col4H = (String) request.getAttribute("c4Header");
            ArrayList co51 = (ArrayList) request.getAttribute("c5");
            String col5H = (String) request.getAttribute("c5Header");
            ArrayList col6 = (ArrayList) request.getAttribute("c6");
            String col6H = (String) request.getAttribute("c6Header");
            
            String dcol1H = "foo";
            ArrayList dcol1= new ArrayList();
            Square s1 = new Square(1, "m1", "n1", 1);

            Square s2 = new Square(2, "m2", "n2", 2);
            Square s3 = new Square(3, "m3", "n3", 3);
            Square s4 = new Square(4, "m4", "n4", 4);
            Square s5 = new Square(5, "m5", "n5", 5);

            dcol1.add(s1);
            dcol1.add(s2);
            dcol1.add(s3);
            dcol1.add(s4);
            dcol1.add(s5);
            
            String dcol2H = "bar";
            ArrayList dcol2= new ArrayList();
            Square t1 = new Square(1, "m11", "n11", 1);
            Square t2 = new Square(2, "m21", "n21", 1);
            Square t3 = new Square(3, "m31", "n31", 1);
            Square t4 = new Square(4, "m41", "n41", 1);
            Square t5 = new Square(5, "m51", "n51",1 );
            dcol2.add(t1);
            dcol2.add(t2);
            dcol2.add(t3);
            dcol2.add(t4);
            dcol2.add(t5);
            
        %>
        <div class="container-fluid">

           
            <div class="col-md-2">
            <table>
                <tr><th><%= dcol1H %></th></tr>
                <% 
                    for (int i = 0; i < dcol1.size(); i++){
                        Square s = (Square) dcol1.get(i);
                %>
                <tr><td class="square"><%= s.getHint() %></td></tr>
                <% } %>
            </table>
            </div>

        </div>
    </body>
</html>
