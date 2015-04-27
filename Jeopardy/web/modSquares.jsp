<%-- 
    Document   : modSquares
    Created on : Apr 27, 2015, 1:29:51 PM
    Author     : enriqueohernandez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/header.jsp" %>
<script src="js/modificacionSq.js"></script>
<script>
   
   
//Salvando las modificaciones
function salvarModSq(obj,valor,valorviejo, idClass,idCategory,idQuestion,columna)
{ //salvarMod(obj, input.value, valorviejo ,idClass,idCategory,idQuestion,columna);
   //salvarMod(obj, input.value,idsup,id1,htmlId, valorviejo);
    var i1 = "data=updateSquare&id=";
    var i2 = "&columna=";
    var i3 = "&valorViejo=";
    var i4 = "&valor=";
    var i5 = "&sup=";
    var res = i1.concat(idQuestion,i2,columna,i3,valorviejo, i4, valor,i5,idCategory);
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
//reloads the page 
function reload1(){
   // window.alert("reload");
                    $.ajax({
                    type: "get",
                    url: "DataControlador", //this is my servlet
                    data: "data=getSquare",
                    success: function(msg){   
                        var panel = document.getElementById("result1");
                        panel.innerHTML= msg;
                    }
                });
}
//erases a question
function borrarSq(idClass, idCategory, idQuestion)
{
   
    var i1 = "data=deleteSquare&idCategory=";
    var i2 = "&idQuestion=";
    var res = i1.concat(idCategory,i2,idQuestion);
    //window.alert(res);
    
    $.ajax({
                    type: "get",
                    url: "DataControlador", //this is my servlet
                    data: res,
                    success: function(msg){ 
                        obj.replaceChild(document.createTextNode(valor), obj.firstChild);
                    }
                });
                reload1();

}
//adds a new row to be modified
function addRowSq(idCategory)
{
     var i1 = "data=addSquare&idCategory=";
    var res = i1.concat(idCategory);
   // window.alert(res);
    $.ajax({
                    type: "get",
                    url: "DataControlador", //this is my servlet
                    data: res,
                    success: function(msg){ 
                        obj.replaceChild(document.createTextNode(valor), obj.firstChild);
                    }
                });
                reload1();

}


</script>


    <div class="container">
    

        <h1>Category</h1>
       <div id="result1"></div>
    
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
                    data: "data=getSquare",
                    success: function(msg){   
                        var panel = document.getElementById("result1");
                       // window.alert(msg);
                        panel.innerHTML= msg; 
                    }
                });
        });
      </script>

  </body>
</html>
