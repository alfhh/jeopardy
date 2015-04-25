/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;

import User.Professor;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author enriqueohernandez
 */
public class DBHandler {

    private static Connection connection;

    public DBHandler() {
        try {
          
            connection = DriverManager.getConnection("jdbc:mysql://104.131.19.102:3306/jeopardy", "root", "hinojosar00t");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static boolean getLogin(Professor prof) {
        boolean valid = false;
        try {
            Statement statement = connection.createStatement();
           // CallableStatement cs = null;
            /*
            
            ResultSet rs = cs.executeQuery();
            */
            String email = prof.getEmail();
            String password = prof.getPassword();
            //"SELECT * FROM Professors where email='"+email+"' AND password='"+password+"'"

            ResultSet results = statement.executeQuery("SELECT * FROM Professors where email='"+email+"' AND password='"+password+"'");
              //valid = statement.execute("{call returnProfessorRow(" +email + ","+ password+"}");
            //
            if (results.next()) {
         
                prof.setFname(results.getString(2));
                prof.setLname(results.getString(3));
                prof.setStatus(Integer.parseInt(results.getString(5)));
                prof.setTries(Integer.parseInt(results.getString(6)));
               
                valid = true;
 
            }
            
            statement.close();

        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;   
    }
    /*
    public static void storeMessage(Mensaje mensaje) {
        try {
            Statement statement = connection.createStatement();
            String de = mensaje.getDe();
            String para = mensaje.getPara();
            String contenido = mensaje.getContenido();
            String query = "insert into mensajes (de, para, contenido) values ('" + de + "','" + para + "','" + contenido + "')";
            statement.executeUpdate(query);
            statement.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static ArrayList getMessages(String para) {
        ArrayList list = new ArrayList();
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT de, contenido, contenido FROM mensajes where para='"+para+"'");
            while (results.next()) {
                String de=results.getString(1);
                String contenido=results.getString(2);
                Mensaje mensaje = new Mensaje(de, para, contenido);
                list.add(mensaje);
            }
            statement.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
   
        public static boolean addUser(Usuario usr) {
             boolean valid = false;
        try {
            Statement statement = connection.createStatement();
            String usuario = usr.getUser();
            String password = usr.getPassword();
            String query = "insert into usuarios (users, passwords) values ('" + usuario + "','" + password + "')";
            statement.executeUpdate(query);
            statement.close();
            valid =true;
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;

    }
    
   */

}
