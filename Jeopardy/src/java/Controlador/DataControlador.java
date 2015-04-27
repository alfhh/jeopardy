/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DataBase.DBGame;
import DataBase.DBHandler;
import Game.Category;
import Game.Course;
import Game.Square;
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
        /**
         * retrieves all courses to be displayed
         */
        if(data.equals("getCourse")){
            
            //url="/modCurso.jsp";
           ArrayList list = DBGame.getCourses();
           
             all += "<table class='table table-bordered'><tr><th>Name</th><th>Erase</th></tr>";
             for (int i = 0; i < list.size(); i++) {
                    Course c = (Course) list.get(i);
                    all+="<tr><td id=name-"+c.getId()+" class='celda' ondblclick=modificar(this,"+c.getId()+",'name')>"+c.getName()+"</td><td id=borrar-"+c.getId()+"><button onclick='borrar("+ c.getId()+")'>Delete Row</button></td></tr>";

                    //all+="<tr><td id=name-"+c.getId()+" class='celda' ondblclick=okok()>"+c.getName()+"</td><td id=borrar-"+c.getId()+"><button onclick='borrar("+ c.getId()+")'>BorrarFila</button></td></tr>";
             }
             all+="</table>";
           System.out.println("TODOLISTO");
           //request.setAttribute("debugCurso", "Entro");
            
        }
        /**
         * updates a course 
         */
        if(data.equals("updateCourse")){
            
           // System.out.println("HACERUPDATE");
            
           String id = request.getParameter("id");
           String columna = request.getParameter("columna");
           String valorViejo = request.getParameter("valorViejo");
           String newValor = request.getParameter("valor");
           //String id, String column, String oldvalue, String newValue
           DBHandler.updateCourse(id, columna, valorViejo, newValor);
           
        }
        /**
         * Deletes a course
         */
        if(data.equals("deleteCourse")){
            
            //System.out.println("delete");
            
           String id = request.getParameter("id");
           //String id, String column, String oldvalue, String newValue
           DBHandler.deleteCourse(id);
           
        }
        /**
         * adds a new empty course
         */
        if(data.equals("addCourse")){
            
           // System.out.println("add");
            
           //String id = request.getParameter("id");
           //String id, String column, String oldvalue, String newValue
           DBHandler.addCourse();
           
        }
        /**
         * gets a specific category
         */
        if(data.equals("getCategory")){
            
            //url="/modCurso.jsp";
            ArrayList listCourse = DBGame.getCourses();
            //ArrayList[] listCategory = new ArrayList[listCourse.size()];
            
            for(int i =0; i< listCourse.size();i++){
                 Course c = (Course) listCourse.get(i);
                 ArrayList listCategory = DBGame.getCategories(c.getId());
                 all+= "<h2>"+c.getName()+"</h2>";
                 all+= "<table class='table table-bordered'><tr><th>Name</th><th>Erase</th></tr>";
                 for(int j =0; j< listCategory.size(); j++){
                     Category cat = (Category) listCategory.get(j);
                     all+="<tr><td id=name-"+cat.getId()+"-"+c.getId()+" class='celda' ondblclick=modificarCat(this,"+c.getId()+","+cat.getId()+",'name')>"+cat.getName()+"</td><td id=borrar-"+cat.getId()+"><button onclick='borrarCat("+c.getId()+","+ cat.getId()+")'>Delete Row</button></td></tr>";

                 }
                 all+="</table>";
                 all+="<button onclick=\"addRowCat("+c.getId()+")\">Add Row</button>";
            }
            
           
        }
            
        /**
         * updates a specific category
         */    
        if(data.equals("updateCategory")){
            //data=updateCategory&id=6&columna=name&valorViejo=Calculus&valor=Calculus1&sup=1
            System.out.println("HACERUPDATE");
            
           String id = request.getParameter("id");
           String columna = request.getParameter("columna");
           String valorViejo = request.getParameter("valorViejo");
           String newValor = request.getParameter("valor");
           String idsup = request.getParameter("sup");
           //String id, String column, String oldvalue, String newValue
           DBHandler.updateCategory(id, columna, valorViejo, newValor, idsup);    
  
        }
        /**
         * deletes a specific category
         */
        if(data.equals("deleteCategory")){
            
            System.out.println("delete");
            /*
             var i1 = "data=deleteCategory&idClass=";
    var i2 = "&idCategory="
            */
            
           String idClass = request.getParameter("idClass");
           String idCategory = request.getParameter("idCategory");
           //String id, String column, String oldvalue, String newValue
           DBHandler.deleteCategory(idClass, idCategory);
           
        }
        /**
         * Adds a new empty category
         */
        if(data.equals("addCategory")){
            
           // System.out.println("add");
            
           String idClass = request.getParameter("idClass");
           //String id, String column, String oldvalue, String newValue
           DBHandler.addCategory(idClass);
           
        }
        /**
         * retrieves all questions 
         */
        if(data.equals("getSquare")){
            //System.out.println("square!");
            //url="/modCurso.jsp";
            ArrayList listCourse = DBGame.getCourses();
            String[] column = {"question","hint","points"};
            for(int i =0; i< listCourse.size();i++){
                 Course c = (Course) listCourse.get(i);
                 ArrayList listCategory = DBGame.getCategories(c.getId());
                 //<div class="well well-small">
            
       // </div>
                 all+= "<div class=\"well well-small\"><h2>"+c.getName()+"</h2></div>";
                 for(int j =0; j< listCategory.size(); j++){
                     Category cat = (Category) listCategory.get(j);
                     ArrayList listSquare = DBGame.getSquares(cat.getId());
                     all+="<h3>"+cat.getName()+"</h3>";
                     all+= "<table class='table table-bordered'><tr><th>Question</th><th>Hint</th><th>Points</th><th>Erase</th></tr>";
                     for(int k = 0; k < listSquare.size(); k++){
                         Square sq = (Square) listSquare.get(k);
                            for(int x=0; x<=2;x++){
                               // System.out.println(x);
                                if(x==0)
                                   all+="<tr><td id="+column[x]+"-"+cat.getId()+"-"+c.getId()+"-"+sq.getID()+" class='celda' ondblclick=modificarSq(this,"+c.getId()+","+cat.getId()+","+sq.getID()+",'"+column[x]+"')>"+sq.getQuestion()+"</td>";
                                if(x==1)
                                  all+="<td id="+column[x]+"-"+cat.getId()+"-"+c.getId()+"-"+sq.getID()+" class='celda' ondblclick=modificarSq(this,"+c.getId()+","+cat.getId()+","+sq.getID()+",'"+column[x]+"')>"+sq.getHint()+"</td>";
                                if(x==2){
                                  all+="<td id="+column[x]+"-"+cat.getId()+"-"+c.getId()+"-"+sq.getID()+" class='celda' ondblclick=modificarSq(this,"+c.getId()+","+cat.getId()+","+sq.getID()+",'"+column[x]+"')>"+sq.getScore()+"</td>";
                                  all+="<td id=borrar-"+sq.getID()+"><button onclick='borrarSq("+c.getId()+","+ cat.getId()+","+sq.getID()+")'>Erase Row</button></td></tr>";
                                }
                             }
                         
                         //*/
                       }
                     all+="</table>";
                     all+="<button onclick=\"addRowSq("+cat.getId()+")\">Add Row</button>";
 
                 }
                 
            }
            
          // System.out.println(all);
        }
        /**
         * Updates a specific question
         */
        if(data.equals("updateSquare")){
            //data=updateCategory&id=6&columna=name&valorViejo=Calculus&valor=Calculus1&sup=1
            //System.out.println("HACERUPDATE");
            
           String id = request.getParameter("id");
           String columna = request.getParameter("columna");
           String valorViejo = request.getParameter("valorViejo");
           String newValor = request.getParameter("valor");
           String idsup = request.getParameter("sup");
           //String id, String column, String oldvalue, String newValue
           DBHandler.updateSquare(id, columna, valorViejo, newValor, idsup);    
  
        }
        /**
         * Deletes a specific question
         */
        if(data.equals("deleteSquare")){
            
            System.out.println("delete");
            /*
             var i1 = "data=deleteCategory&idClass=";
    var i2 = "&idCategory="
            */
            
           String idQuestion = request.getParameter("idQuestion");
           String idCategory = request.getParameter("idCategory");
           //String id, String column, String oldvalue, String newValue
           DBHandler.deleteSquare(idCategory, idQuestion);
           
        }
        /**
         * Adds a specific question
         */
        if(data.equals("addSquare")){
            
           // System.out.println("add");
            
           String idCategory = request.getParameter("idCategory");
           //String id, String column, String oldvalue, String newValue
           DBHandler.addSquare(idCategory);
           
        }
        
        /*
        *
        *
        *
        *
        */
        
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
