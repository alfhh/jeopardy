/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// as soon as the document is loaded
$( document ).ready(function() {
    alert('hello');
  $('.square').click(function() {
            // removes the text of the content
            $(this).toggleClass("show");
            $(this).removeClass( "square" );
        });
});
