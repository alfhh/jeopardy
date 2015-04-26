/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DataBase.DBHandler;
import User.Student;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ActionServlet
 */

public class AjaxControlador extends HttpServlet {
 private static final long serialVersionUID = 1L;

    
    public AjaxControlador() {
        // TODO Auto-generated constructor stub
    }


  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  String name=null;
  //System.out.println(request.getAttribute("valor"));
  
  String number =  (String) request.getParameter("val");
           System.out.println(number);
           
           
            ArrayList lista = DBHandler.getHistoryStudent(Integer.parseInt(number));
            
         
             String all = "<table class='table table-hover'><tr><th>First Name</th><th>Last Name</th> <th>Number</th><th>Points</th> <th>Team Name</th></tr>";
             for (int i = 0; i < lista.size(); i++) {
                    Student s = (Student) lista.get(i);
                    all+="<tr><td>"+s.getFname()+"</td><td>"+s.getLname()+"</td><td>"+s.getNumber()+"</td><td>"+s.getPoints()+"</td><td>"+s.getTeamName()+"</td></tr>";
             }
             all+="</table>";
  
  
  response.setContentType("text/plain");  
  response.setCharacterEncoding("UTF-8"); 
  response.getWriter().write(all); 
 }

  
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  // TODO Auto-generated method stub
  
 }

}