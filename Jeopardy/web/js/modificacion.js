          
          function okok(){
                  window.alert("modif");
          }
          function trim(value) {
    var temp = value;
    var obj = /^(\s*)([\W\w]*)(\b\s*$)/;
    if (obj.test(temp)) { temp = temp.replace(obj, '$2');}
    var obj = /  /g;
    while (temp.match(obj)) { temp = temp.replace(obj, " ");}
    return temp;
}

//Funcion para calcular el largo en pixels det texto dado
    
function getTextWidth(texto)
{
    //Valor por default : 150 pixels
    var ancho = 150;

    if(trim(texto) == "")
    {
        return ancho;
    }

    //Creacin de un span escondido que se puedr· medir
    var span = document.createElement("span");
    span.style.visibility = "hidden";
    span.style.position = "absolute";

    //Se agrega el texto al span y el span a la p·gina
    span.appendChild(document.createTextNode(texto));
    document.getElementsByTagName("body")[0].appendChild(span);

    //tamaÒo del texto
    ancho = span.offsetWidth;

    //Eliminacin del span
    document.getElementsByTagName("body")[0].removeChild(span);
    span = null;

    return ancho;
}


//Funcion de modificacion del elemento seleccionado mediante doble-click
function modificar(obj,id1,htmlId)
{
   // window.alert("modificar");
    
    
    //Objeto que sirve para editar el valor en la pagina
    var input = null;

    input = document.createElement("input");


    //Asignar en la caja el valor de la casilla
    if (obj.innerText)
        input.value = obj.innerText;
    else
        input.value = obj.textContent;
    var valorviejo = input.value;
     
    
    input.value = trim(input.value);


    //a la caja INPUT se la asigna un tamao un poco mayor que el texto a modificar
    input.style.width  = getTextWidth(input.value) + 30 + "px";

    //Se remplaza el texto por el objeto INPUT
    obj.replaceChild(input, obj.firstChild);

    //Se selecciona el elemento y el texto a modificar
    input.focus();
    input.select();

    //AsignaciÛn de los 2 eventos que provocar·n la escritura en la base de datos

    //Salida de la INPUT
    input.onblur = function salir()
    {
        salvarMod(obj, input.value,id1,htmlId, valorviejo);
        delete input;
    };

    //La tecla Enter
    input.onkeydown = function keyDown(event)
    {
        if(event.keyCode == 13)
        {
            salvarMod(obj, input.value,id1,htmlId, valorviejo);
            delete input;
        }
    };
    
}
//Salvando las modificaciones
/*
function salvarMod(obj, valor,id1,htmlId, valorviejo)
{
    obj.replaceChild(document.createTextNode(valor), obj.firstChild);
 
 
}
*/

 





