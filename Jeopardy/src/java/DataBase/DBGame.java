/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;

import User.Professor;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ahinojosa
 */
public class DBGame {

    private static Connection connection;

    public DBGame() {
        try {
          
            connection = DriverManager.getConnection("jdbc:mysql://104.131.19.102:3306/jeopardy", "root", "hinojosar00t");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void getCourses() {
        try {
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("select name from Classes");

            if (results.next()) {
                System.out.println(results.getString(1) + "YESH");
            }
            
            statement.close();

        } catch (SQLException ex) {
            Logger.getLogger(DBGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static boolean getLogin2(Professor prof) {
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
}
