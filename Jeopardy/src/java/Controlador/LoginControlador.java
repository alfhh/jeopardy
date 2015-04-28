/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DataBase.DBHandler;
import DataBase.RandomStringGenerator;
import User.Professor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author enriqueohernandez
 * Controller for all login functions
 */
public class LoginControlador extends HttpServlet {

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
        String login = request.getParameter("login");
        String url = "/login.jsp";
        String validLogin = "false";
        String invalidUser = "invalid";
        HttpSession session = request.getSession();
        
        //if the login came from login page
        if(login.equals("true")){
            String usuario =  request.getParameter("email");
            String password =  request.getParameter("password");   
            boolean valid = false;
            Professor prof = new Professor(usuario, password);
            valid = DBHandler.getLogin(prof);
            
            //if the user is valid
            if(valid){
                //if the status is completed (passowrd updated)
                if(prof.getStatus() == 2){
                    url = "/userMain.jsp"; 
                    invalidUser = "valid";
                    DBHandler.changeTries(prof, 0);
                    session.setAttribute("idProf", prof.getId());
                }
                //if the user needs to change the password
                else if(prof.getStatus() == 1){
                    url = "/changePass.jsp"; 
                 
                }
                //if the account is bloqued
                else if(prof.getStatus() == 0){
                    url = "/BlockedAccount.jsp";
                }
            }
            else{
                //if the password was wrong increase the number of ties
                boolean valid2 = false;
                request.setAttribute("invalidLogin", invalidUser);
                valid2 = DBHandler.getTries(prof);
                int tries2  = (1 + prof.getTries());
                DBHandler.changeTries(prof,(tries2));
                DBHandler.getTries(prof);      
                request.setAttribute("numberTries",""+prof.getTries());
                if(prof.getTries() >=3 ){
                    //if it is more than 3 we block the account
                    DBHandler.changeStatus(prof, 0);
                    url = "/BlockedAccount.jsp";
                }
                else{
                url = "/login.jsp";
                }
            }
            
            session.setAttribute("professor", prof);
            validLogin = "true";
           
        }
        /**
         * if we click logout 
        */
        else if(login.equals("logout")){            
                 session.invalidate();
                response.sendRedirect("login.jsp");
                return; // <--- Here.
            
        }/**
         * if it is time to change the password
         */
        else if(login.equals("changePass")){
            boolean valid = false;
            
            Professor prof = ((Professor)session.getAttribute("professor"));
            
             String newPass = request.getParameter("newpass");
                 
            valid = DBHandler.changePass(prof, newPass);
            
            if(valid){
                url= "/login.jsp";
                request.setAttribute("newPassword", "newPassword");
                DBHandler.changeStatus(prof, 2);
                DBHandler.changeTries(prof, 0);
            }
            else
                url="/changePass.jsp";
        }
        else if(login.equals("CreateNewUser")){
            
            StringBuffer buffer = new StringBuffer();
            String characters = "";

                
            String email = request.getParameter("email");
            String name =  request.getParameter("name"); 
            String last =  request.getParameter("last"); 
            //System.out.println(email + " "+name + " " +last );
            //http://syntx.io/how-to-generate-a-random-string-in-java/
           
            String pass;
            try {
                pass = RandomStringGenerator.generateRandomString(10,RandomStringGenerator.Mode.ALPHANUMERIC);
                DBHandler.insertProfessor( email,  pass,  name,  last);
                 //Professor prof = new Professor(0,name,last,pass,email,1,0);
                 session.setAttribute("email1", email );
                 session.setAttribute("fname1", name );
                 session.setAttribute("lname1", last );
                 session.setAttribute("pass1", pass );

                    url="/sendMail.jsp";
            } catch (Exception ex) {
                Logger.getLogger(LoginControlador.class.getName()).log(Level.SEVERE, null, ex);
            }

            //int id, String fname, String lname, String password, String email, int status, int tries
            
            
    
        }
        
        session.setAttribute("validLogin", validLogin);
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
