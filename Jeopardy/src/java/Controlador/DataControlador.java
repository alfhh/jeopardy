/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DataBase.DBGame;
import DataBase.DBHandler;
import Game.Course;
import User.Professor;
import User.Student;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author enriqueohernandez
 */
public class DataControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean send = false;
        String all = "";
       String data = request.getParameter("data");
       // System.out.println("history "+history);
        String url = "/userMain.jsp";
        HttpSession session = request.getSession();
        /**
         * Retrieves a list of all professor's student games
         */
        if(data.equals("AddStudent")){
            
            String name = request.getParameter("name");
            String lName = request.getParameter("lName");
            String id = request.getParameter("studentID");
            
            DBHandler.insertStudent(name, lName, id);
            
            request.setAttribute("message", "Student added succesfuly!");
            
            url="/userMain.jsp";
            send = true;
           
            
        }
        if(data.equals("getCourse")){
            
            //url="/modCurso.jsp";
           ArrayList list = DBGame.getCourses();
           
             all += "<table class='table-bordered'><tr><th>Name</th><th>borrar</th></tr>";
             for (int i = 0; i < list.size(); i++) {
                    Course c = (Course) list.get(i);
                    all+="<tr><td id=name-"+c.getId()+" class='celda' ondblclick=modificar(this,"+c.getId()+",'name')>"+c.getName()+"</td><td id=borrar-"+c.getId()+"><button onclick='borrar("+ c.getId()+")'>BorrarFila</button></td></tr>";

                    //all+="<tr><td id=name-"+c.getId()+" class='celda' ondblclick=okok()>"+c.getName()+"</td><td id=borrar-"+c.getId()+"><button onclick='borrar("+ c.getId()+")'>BorrarFila</button></td></tr>";
             }
             all+="</table>";
           System.out.println("TODOLISTO");
           //request.setAttribute("debugCurso", "Entro");
            
        }
        if(data.equals("updateCourse")){
            
            System.out.println("HACERUPDATE");
            
           String id = request.getParameter("id");
           String columna = request.getParameter("columna");
           String valorViejo = request.getParameter("valorViejo");
           String newValor = request.getParameter("valor");
           //String id, String column, String oldvalue, String newValue
           DBHandler.updateCourse(id, columna, valorViejo, newValor);
           
        }
        
        if(send){
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
        }else{
            response.setContentType("text/plain");  
            response.setCharacterEncoding("UTF-8"); 
            response.getWriter().write(all); 
        }
       
         
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
