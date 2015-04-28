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
            System.out.println("ToGame");
            ArrayList teams = new ArrayList();
            ArrayList students = DBGame.getStudents(); // Load the students
            int size = DBGame.getNumStudents(); // Get the size
            for(int i = 0; i < size; i++){
                Student s = (Student)students.get(i);
                if(request.getParameter("" + s.getIdS())!=null){
                    System.out.println(s.getFname());
                    Team tm = new Team(s.getFname(), 0, 0, s.getIdS());
                    teams.add(tm);
                }
            }
            session.setAttribute("turn", 0);
            session.setAttribute("squaresLeft", 30);
            session.setAttribute("Team", teams);
            session.setAttribute("1p", 1);
            url = "/gameTest.jsp";
        }
        
        
        /**
         * This task receives an array of the checked students to start the
         * game.
         * SAME AS THE PAST ONE BUT FOR TEAMS
         * !! THIS MUST BE IMPLEMENTED
         */
        else if(task.equals("toGameTeam")){
            System.out.println("TEAMS!!");
            
            String players[] = request.getParameterValues("student");
            
            // Here the value is obtained with the value of the checkbox, that
            // is the name of the radio button, then get the value of the radio
            // button.
            for(int i = 0; i < players.length; i++){
                System.out.println(players[i]+ " juega en "+request.getParameter(players[i]));
                DBGame.createGroupStudent(Integer.parseInt(players[i]), Integer.parseInt(request.getParameter(players[i])));
            }
            
            ArrayList teams = (ArrayList)session.getAttribute("Equipos");
            session.setAttribute("turn", 0);
            session.setAttribute("squaresLeft", 30);
            session.setAttribute("Team", teams);
            session.setAttribute("1p", 0);
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
         * The value of type depends on the radio button that you
         * choose: Solo or Team
         */
        else if(task.equals("choose")){
            
            String type = request.getParameter("type");
            int teamAmounts = 1;
            ArrayList students = DBGame.getStudents(); // Load the students
            int size = DBGame.getNumStudents(); // Get the size
            session.setAttribute("students", students);
            session.setAttribute("studentNum", size);
            
            if(type.equals("solo"))
                url = "/chooseSolo.jsp";
            
            else{
                teamAmounts = Integer.parseInt(request.getParameter("quantity"));
                session.setAttribute("quantity", teamAmounts);
                url = "/createTeam.jsp";
            }
        }
        
        
        /**
         * This function saves the teams in the data base creating a relationship with 
         * the id from the professor
         */
        else if(task.equals("saveTeam")){
            ArrayList equipos = new ArrayList();
            for(int i = 0; i < (int)session.getAttribute("quantity"); i++){
                DBGame.createTeam(request.getParameter("Team"+i), (int)session.getAttribute("idProf"), equipos);
            }
           
            session.setAttribute("Equipos", equipos);
            url = "/chooseTeam.jsp";
            
        }
        
        
        /**
         * This function loads the selected questions into six different
         * arrays that will be loaded on the game
         */
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
