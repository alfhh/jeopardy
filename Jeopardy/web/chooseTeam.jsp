<%-- 
    Document   : chooseSolo
    Created on : Apr 27, 2015, 6:36:32 PM
    Author     : mrquorr
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="User.Student"%>
<%@page import="User.Team"%>
<%@include file="/header.jsp" %>

    <div class="container">

        <div class='table-responsive'>
        <form action="GameController?task=toGameTeam" method="post">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Student</th>
                <%
                ArrayList equipos = (ArrayList)session.getAttribute("Equipos");
                int numTeams = (int)session.getAttribute("quantity");
                for(int i = 0; i < numTeams; i++){
                    Team eq = (Team)equipos.get(i);
                    out.println("<th>"+eq.getName()+"</th>"); // Prints the team's name in the header
                }
                out.println("</tr></thead>");
                out.println("<thbody>");
                
                int numStudents = (int)session.getAttribute("studentNum");
                for(int i = 0; i < numStudents; i++) {
                    
                    ArrayList students = (ArrayList)session.getAttribute("students");
                    Student st = (Student) students.get(i);
                    out.print("<tr><td>"+st.getFname()+ " " +st.getLname()+"</td>");
                    
                    for(int j = 0; j < numTeams; j++)
                        out.println("<td><input type='radio' name='"+st.getIdS()+"' value='"+j+"'></td>");
                    
                    out.print("</tr>");
                    
                }
                    out.println("</tbody></table>");
 
            %>
            </table>
         <input type="submit" value="Submit" class="btn btn-default">
        </form>
        </div>
        
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>
