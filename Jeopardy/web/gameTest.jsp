<%-- 
    Document   : gameTest
    Created on : Apr 26, 2015, 10:58:21 PM
    Author     : ahinojosa
--%>

<%@page import="User.Team"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Game.Square" %>
<%@page import="Game.Category" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/header.jsp" %>
<style>
    /*Class used for bigger modals*/
    .btn-xl {
    padding: 18px 28px;
    font-size: 32px;
    border-radius: 8px;
}
    
</style>

<script>
    
    // Function used to display the answer text inside the modals
    $('button').click(function(){
    $(this).text(function(i,old){
        return old==='+' ?  '-' : '+';
        });
    });
    
</script>
<div class="container">  
    <div class="jumbotron">
        <div class="row">
  <div class="col-md-10">
      <table class='table borderless'>
         <tr>
             <th><%=session.getAttribute("catName0").toString()%></th>
             <th><%=session.getAttribute("catName1").toString()%></th>
             <th><%=session.getAttribute("catName2").toString()%></th>
             <th><%=session.getAttribute("catName3").toString()%></th>
             <th><%=session.getAttribute("catName4").toString()%></th>
             <th><%=session.getAttribute("catName5").toString()%></th>
             
         </tr>
      
          
 
<%
    // Gets all the values from the session to load it to an Array
    ArrayList columns = new ArrayList();
    columns.add((ArrayList)session.getAttribute("c1"));
    columns.add((ArrayList)session.getAttribute("c2"));
    columns.add((ArrayList)session.getAttribute("c3"));
    columns.add((ArrayList)session.getAttribute("c4"));
    columns.add((ArrayList)session.getAttribute("c5"));
    columns.add((ArrayList)session.getAttribute("c6"));
   
    

  for (int i = 0; i < 5; i++) { // Paint the modals in vertical way
      for(int j = 0; j < 6; j++){ // Paint the modals in horizontal way
        ArrayList temp = (ArrayList)columns.get(j);
        Square sq = (Square)temp.get(i); // Creates a new instance of the Square object, the index of the array depends of the first loop, to start on 0
        
        if(j==0)
            out.println("<tr>");
        if(sq.getScore()>=1000)
             out.println("<td><button type='button' id='"+sq.getID()+"' class='btn btn-primary btn-xl' data-toggle='modal' data-target='."+sq.getID()+"'>"+sq.getScore()+"</button></td>");
        else
             out.println("<td><button type='button'id='"+sq.getID()+"' class='btn btn-primary btn-xl' data-toggle='modal' data-target='."+sq.getID()+"'>&nbsp;"+sq.getScore()+"</button></td>");

        if(j==5)
            out.println("</tr>");
        
        out.println("<div class='modal fade "+sq.getID()+"' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel' aria-hidden='true'>");
        out.println("<div class='modal-dialog modal-lg'><div class='modal-content'>");
        
        // HERE GOES THE INFORMATION OF THE MODAL - SQUARE
            out.println("<div class='modal-header'>");
            out.println("<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
            
            // Modal Title here
            out.println("<h4 class='modal-title' id='gridSystemModalLabel'>Question of "+sq.getScore()+" points</h4></div>");
            
            // Modal Body
            out.println("<div class='modal-body'><div class='container-fluid'>");
            out.println("<h2>"+sq.getQuestion()+"</h2>");
            
            out.println("<br><button class='btn btn-success' data-toggle='collapse' data-target='#intro"+sq.getID()+"'>Show Answer</button>");
            out.println("<div class='row-fluid summary'><div id='intro"+sq.getID()+"' class='collapse'> ");
            out.println("<br><h1>"+sq.getHint()+"</h1>");
            out.println("</div></div>");
            out.println("</div></div>");
            
            out.println("<div class='modal-footer'>");
            out.println("<button type='button' class='btn btn-default' data-dismiss='modal'  onclick=incorrect('"+sq.getID()+"','"+sq.getScore()+"') >Wrong</button>");
            out.println("<button type='button' class='btn btn-primary' data-dismiss='modal'  onclick=correct('"+sq.getID()+"','"+sq.getScore()+"') >Correct!</button>");
            out.println("</div>");
        
        out.println("</div></div></div>");
      }
     // out.println("<br><br>");
  }
%>
        </table>
       
        </div>
        <div class="col-md-2">
            <div id="result1"></div>
        </div>
      </div>

        
    </div>
        <br><br><br><br><br><br>

            <center><a href="DataControlador?data=gameover" ><button type="button" class="btn btn-primary btn-lg btn-block">END GAME!</button></a></center>
</div>
          


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
         $(document).ready(function() {

                $.ajax({
                    type: "get",
                    url: "DataControlador", //this is my servlet
                    data: "data=loadGame",
                    success: function(msg){   
                        var panel = document.getElementById("result1");
                        panel.innerHTML= msg;
                    }
                });
        });
        function reload1(){
           // window.alert("Reload");
            $.ajax({
                    type: "get",
                    url: "DataControlador", //this is my servlet
                    data: "data=loadGame",
                    success: function(msg){   
                        var panel = document.getElementById("result1");
                        panel.innerHTML= msg;
                    }
                });
        }
        function correct(id,score){
  
        //window.alert(score);
            $("#"+id).html("XXX");
            //document.getElementById("'"+id+"'").innerHTML("x");
            
            var i1 = "data=correct&id=";
            var i2 = "&points=";
            var res = i1.concat(id,i2,score);
            $.ajax({
                            type: "get",
                            url: "DataControlador", //this is my servlet
                            data: res,
                            success: function(msg){ 
                                 //window.alert("salvar");
                                

                            }
                        });
             reload1();           
            $('#'+id).attr("disabled", true);
           reload1();
            
        }
        function incorrect(id,score){
            
             $("#"+id).html("XXX");
              $.ajax({
                            type: "get",
                            url: "DataControlador", //this is my servlet
                            data: "data=incorrect",
                            success: function(msg){ 
                             
                            }
                        });
                        
            reload1();
            $('#'+id).attr("disabled", true);
           reload1();
           
            
        }
        
    </script>
  </body>
</html>