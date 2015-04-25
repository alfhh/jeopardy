/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DataBase.DBHandler;
import User.Professor;
import java.io.IOException;
import java.io.PrintWriter;
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
        
        if(login.equals("true")){
            String usuario =  request.getParameter("email");
            String password =  request.getParameter("password");
            
            boolean valid = false;

            Professor prof = new Professor(usuario, password);
            valid = DBHandler.getLogin(prof);
            //System.out.println("# id "+prof.getId());
            
            if(valid){
                
                //cambiar
                if(prof.getStatus() == 2){
                    url = "/userMain.jsp"; 
                    invalidUser = "valid";
                    DBHandler.changeTries(prof, 0);
                }
                else if(prof.getStatus() == 1){
                    url = "/changePass.jsp"; 
                 
                }
                else if(prof.getStatus() == 0){
                    url = "/BlockedAccount.jsp";
                }
            }
            else{
                boolean valid2 = false;
                //prof = new Professor();
                request.setAttribute("invalidLogin", invalidUser);
                valid2 = DBHandler.getTries(prof);
                int tries2  = (1 + prof.getTries());
                DBHandler.changeTries(prof,(tries2));
                DBHandler.getTries(prof);
             
                request.setAttribute("numberTries",""+prof.getTries());
                //System.out.println("# id "+prof.getId());
                if(prof.getTries() >=3 ){
                    DBHandler.changeStatus(prof, 0);
                    url = "/BlockedAccount.jsp";
                }
                else{
                url = "/login.jsp";
                }
            }
            
            session.setAttribute("professor", prof);
            validLogin = "true";
            
            //request.setAttribute("usuario", usr);
        }
        else if(login.equals("logout")){
            session.removeAttribute("professor");
             url = "/login.jsp";
             session.removeAttribute("validLogin");
            
        }else if(login.equals("changePass")){
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
