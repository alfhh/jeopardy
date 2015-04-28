/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import  DataBase.DBGame;
import User.Professor;
import User.Student;
import User.Team;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ahinojosa
 */
@WebServlet(name = "GameController", urlPatterns = {"/GameController"})
public class GameController extends HttpServlet {

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
        
        String task = request.getParameter("task");
        String url = "/login.jsp";
        HttpSession session = request.getSession();
        
        /**
         * This task is activated when the professor clicks the Game +
         * button on his home page.
         * It loads all the courses data, needed to create a new game.
         */
        if(task.equals("new")){
            ArrayList courses = DBGame.getCourses(); // Load the courses names
            int size = DBGame.getNumGames(); // Get the size
            session.setAttribute("courseNames", courses);
            url = "/newGame.jsp";
        }
        
        /**
         * This task receives the id of the Course that was clicked by
         * the user and then shows all the categories related to the
         * course.
         */
        else if(task.equals("check")){
            session.removeAttribute("categories");
            int id = Integer.parseInt(request.getParameter("id"));
            int num = Integer.parseInt(request.getParameter("num"));
            ArrayList categories = DBGame.getCategories(id);
            session.setAttribute("idCategories",num);
            session.setAttribute("categories", categories);
            url = "/newGame.jsp";
        }
        
        /**
         * This task receives an array of the checked students to start the
         * game.
         */
        else if(task.equals("toGame")){
            ArrayList teams = new ArrayList();
            ArrayList students = DBGame.getStudents(); // Load the students
            int size = DBGame.getNumStudents(); // Get the size
            for(int i = 0; i < size; i++){
                Student s = (Student)students.get(i);
                if(request.getParameter("" + s.getIdS())!=null){
                    Team tm = new Team(s.getFname(), 0, 0, s.getIdS());
                    teams.add(tm);
                }
            }
            session.setAttribute("Team", teams);
            url = "/gameTest.jsp";
        }
        
        /**
         * This task receives an array of six values of categories,
         * from which it uploads them to session.
         */
        else if(task.equals("questions")){
            session.removeAttribute("categories");
            String categoriesID[] = request.getParameterValues("categories");
            
            for(int i = 0; i < 6; i++) {
                String[] cat = categoriesID[i].split("_");
                session.setAttribute("catID"+ i, cat[0]);
                session.setAttribute("catName"+ i, cat[1]);
                ArrayList squares = DBGame.getSquares(Integer.parseInt(cat[0]));
                session.setAttribute("squares"+ i, squares);
            }
            
            url = "/selectSquares.jsp";
        }
        
        /**
         * This task sends you to the player select screen.
         */
        else if(task.equals("choose")){
            ArrayList students = DBGame.getStudents(); // Load the students
            int size = DBGame.getNumStudents(); // Get the size
            request.setAttribute("students", students);
            request.setAttribute("studentNum", size);
            url = "/chooseSolo.jsp";
        }
        
        
        
        else if(task.equals("go")){
            for(int i = 0; i < 6; i++)
                session.removeAttribute("squares"+ i);
            
                // Creation of C1
                ArrayList c1 = new ArrayList();
                String name = session.getAttribute("catName0").toString();
                String valores[] = request.getParameterValues(name);
                
                for(int j = 0; j < 5; j++){
                    DBGame.getSquaresbyID(Integer.parseInt(valores[j]), c1);
                }
                session.setAttribute("c1", c1);
                
                // Creation of C2
                ArrayList c2 = new ArrayList();
                name = session.getAttribute("catName1").toString();
                valores = request.getParameterValues(name);
                
                for(int j = 0; j < 5; j++){
                    DBGame.getSquaresbyID(Integer.parseInt(valores[j]), c2);
                }
                session.setAttribute("c2", c2);
                
                // Creation of C3
                ArrayList c3 = new ArrayList();
                name = session.getAttribute("catName2").toString();
                valores = request.getParameterValues(name);
                
                for(int j = 0; j < 5; j++){
                    DBGame.getSquaresbyID(Integer.parseInt(valores[j]), c3);
                }
                session.setAttribute("c3", c3);
                
                // Creation of C4
                ArrayList c4 = new ArrayList();
                name = session.getAttribute("catName3").toString();
                valores = request.getParameterValues(name);
                
                for(int j = 0; j < 5; j++){
                    DBGame.getSquaresbyID(Integer.parseInt(valores[j]), c4);
                }
                session.setAttribute("c4", c4);
                
                // Creation of C5
                ArrayList c5 = new ArrayList();
                name = session.getAttribute("catName4").toString();
                valores = request.getParameterValues(name);
                
                for(int j = 0; j < 5; j++){
                    DBGame.getSquaresbyID(Integer.parseInt(valores[j]), c5);
                }
                session.setAttribute("c5", c5);
                
                // Creation of C6
                ArrayList c6 = new ArrayList();
                name = session.getAttribute("catName5").toString();
                valores = request.getParameterValues(name);
                
                for(int j = 0; j < 5; j++){
                    DBGame.getSquaresbyID(Integer.parseInt(valores[j]), c6);
                }
                session.setAttribute("c6", c6);
                
                
            
            url = "/chooseGameMode.jsp";
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
