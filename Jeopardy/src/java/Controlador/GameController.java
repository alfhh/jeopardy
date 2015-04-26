/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import  DataBase.DBGame;
import User.Professor;
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
            ArrayList categories = DBGame.getCategories(id);
            session.setAttribute("categories", categories);
            url = "/newGame.jsp";
        }
        
        else if(task.equals("questions")){
            String categoriesID[] = request.getParameterValues("categories");
            session.setAttribute("cat1", categoriesID[0]);
            session.setAttribute("cat2", categoriesID[1]);
            session.setAttribute("cat3", categoriesID[2]);
            session.setAttribute("cat4", categoriesID[3]);
            session.setAttribute("cat5", categoriesID[4]);
            url = "selectSquares.jsp";
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
