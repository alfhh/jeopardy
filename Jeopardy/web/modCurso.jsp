<%-- 
    Document   : modCurso
    Created on : Apr 26, 2015, 9:41:06 PM
    Author     : enriqueohernandez
--%>
<%@include file="/header.jsp" %>
<script src="js/modificacion.js"></script>
<script>
   
   
//Salvando las modificaciones
function salvarMod(obj, valor,id1,htmlId, valorviejo)
{
   
    var i1 = "data=updateCourse&id=";
    var i2 = "&columna=";
    var i3 = "&valorViejo=";
    var i4 = "&valor=";
    var res = i1.concat(id1,i2,htmlId,i3,valorviejo, i4, valor);
 //window.alert(res);
        
    
    $.ajax({
                    type: "get",
                    url: "DataControlador", //this is my servlet
                    data: res,
                    success: function(msg){ 
                         //window.alert("salvar");
                        obj.replaceChild(document.createTextNode(valor), obj.firstChild);
                        //var panel = document.getElementById("result1");
                        
                        //panel.innerHTML= msg;
                    }
                });
                

}

</script>

    <div class="container">
                             <%
                //If bad input the message gets displayed.
        String message = (String) request.getAttribute("debugCurso");
        if(message != null){
            
                %>  <p style="color:green"><%= message%></p>
                <%
        }
    %>
        <h1>Lista de usuarios</h1>

        <div id="result1"></div>

    <center><button onclick="agregarRenglon()">Add Row</button></center>    
    
    </div> <!-- /container -->


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
                    data: "data=getCourse",
                    success: function(msg){   
                        var panel = document.getElementById("result1");
                        panel.innerHTML= msg;
                    }
                });
        });
      </script>
      
      
      
               

  </body>
</html>
