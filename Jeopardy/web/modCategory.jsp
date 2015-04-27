<%-- 
    Document   : modCategory
    Created on : Apr 27, 2015, 9:20:51 AM
    Author     : enriqueohernandez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/header.jsp" %>
<script src="js/modificacionCat.js"></script>
<script>
   
   
//Salvando las modificaciones
function salvarMod(obj,valor,idsup,id1,htmlId, valorviejo)
{
   //salvarMod(obj, input.value,idsup,id1,htmlId, valorviejo);
    var i1 = "data=updateCategory&id=";
    var i2 = "&columna=";
    var i3 = "&valorViejo=";
    var i4 = "&valor=";
    var i5 = "&sup=";
    var res = i1.concat(id1,i2,htmlId,i3,valorviejo, i4, valor,i5,idsup);
 window.alert(res);
        
    
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

function reload1(){
   // window.alert("reload");
                    $.ajax({
                    type: "get",
                    url: "DataControlador", //this is my servlet
                    data: "data=getCategory",
                    success: function(msg){   
                        var panel = document.getElementById("result1");
                        panel.innerHTML= msg;
                    }
                });
}
function borrarCat(idClass, idCategory)
{
   
    var i1 = "data=deleteCategory&idClass=";
    var i2 = "&idCategory=";
    var res = i1.concat(idClass,i2,idCategory);
    window.alert(res);
    
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
function addRowCat(idClass)
{
     var i1 = "data=addCategory&idClass=";
    var res = i1.concat(idClass);
    window.alert(res);
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

    <center><button onclick="addRow()">Add Row</button></center>    
    
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
                    data: "data=getCategory",
                    success: function(msg){   
                        var panel = document.getElementById("result1");
                        panel.innerHTML= msg;
                    }
                });
        });
      </script>
      
      
      
               

  </body>
</html>
