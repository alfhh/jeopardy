/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DataBase.DBHandler;
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
public class HistoryContrlador extends HttpServlet {

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
        String history = request.getParameter("history");
       // System.out.println("history "+history);
        String url = "/login.jsp";
        HttpSession session = request.getSession();
        /**
         * Retrieves a list of all professor's student games
         */
        if(history.equals("getAllProfessor")){
            Professor prof = ((Professor)session.getAttribute("professor"));
            
            //ArrayList lista = DBHandler.getAllHistory(prof);
            ArrayList listaEquipos = DBHandler.getHTeams((int)session.getAttribute("idProf"));
            ArrayList listaSolo = DBHandler.getHStudents((int)session.getAttribute("idProf"));
            
            if(listaEquipos.isEmpty() && listaSolo.isEmpty()){
                url="/noHistory.jsp";
            }
            else{
                url="/showBlobs.jsp";
                session.setAttribute("lEquipos", listaEquipos);
                session.setAttribute("lSolos", listaSolo);
            }
            
        }
        /**
         * Retrieves the list of a specific student history
         */
        if(history.equals("getByStudent")){
           // System.out.println("controlador");
            //Professor prof = ((Professor)session.getAttribute("professor"));
            String outs = (String)request.getAttribute("valor");
           int number =  (Integer)request.getAttribute("valor");
         //  System.out.println(outs+" okok");
           
            ArrayList lista = DBHandler.getHistoryStudent(number);
            
            if(lista.isEmpty()){
                url="/noHistory.jsp";
            }
            else{
                System.out.println("entro");
                url="/historyByStudent.jsp";
                String all = "<table class='table table-hover'><tr><th>First Name</th><th>Last Name</th> <th>Number</th><th>Points</th> <th>Team Name</th></tr>";
             for (int i = 0; i < lista.size(); i++) {
                    Student s = (Student) lista.get(i);
                    all+="<tr><td>"+s.getFname()+"</td><tr><td>"+s.getLname()+"</td><tr><td>"+s.getNumber()+"</td><tr><td>"+s.getPoints()+"</td><tr><td>"+s.getTeamName()+"</td>";
             }
             all+="</table>";
             System.out.println(all);
                session.setAttribute("lista", all);
                response.setContentType("text/plain");  
                response.setCharacterEncoding("UTF-8"); 
             response.getWriter().write(all); 
            }
            
        }
         RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
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
