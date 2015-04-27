/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;

import Game.Course;
import Game.Category;
import Game.Square;
import User.Professor;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
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
    
    /**
     * Returns a List with the names of all the names of the courses in the
     * classes table
     * @return result
     */
    public static ArrayList getCategories(int idCourse) {
        ArrayList result = new ArrayList();
        
        try {
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("select id, name from Categories where fk_class ="+idCourse+"");

            while (results.next()) {
                int id = Integer.parseInt(results.getString(1));
                String name = (results.getString(2));
                Category d = new Category(id, name, idCourse);
                result.add(d);
            }
            
            statement.close();

        } catch (SQLException ex) {
            Logger.getLogger(DBGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return result;
    }
    
    public static ArrayList getSquares(int idCategory) {
        ArrayList result = new ArrayList();
        
        try {
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("select Id, question, hint, points from Squares where fk_category ="+idCategory+"");

            while (results.next()) {
                int id = Integer.parseInt(results.getString(1));
                String question = (results.getString(2));
                System.out.println("THE NAME IS: "+question);
                String hint = (results.getString(3));
                int points = Integer.parseInt(results.getString(4));
                Square sq = new Square(id, question, hint, points);
                result.add(sq);
            }
            
            statement.close();

        } catch (SQLException ex) {
            Logger.getLogger(DBGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return result;
    }
    
    
    /**
     * Returns the number of elements in the classes tables
     * Searching by name..
     * @return size
     */
    public static int getNumGames(){
        // Variable used to store the number of elements in classes
        int size = 0;
        
        try {
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("select count(name) from Classes");

            if (results.next()) { // Just one row received
                size = results.getInt(1);
            }
            
            statement.close();

        } catch (SQLException ex) {
            Logger.getLogger(DBGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return size;
    }
    
    /**
     * Returns a List with the names of all the names of the courses in the
     * classes table
     * @return result
     */
    public static ArrayList getCourses() {
        ArrayList result = new ArrayList();
        
        try {
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("select * from Classes");

            while (results.next()) {
                int id = Integer.parseInt(results.getString(1));
                String name = (results.getString(2));
                Course c = new Course(id, name);
                result.add(c);
            }
            
            statement.close();

        } catch (SQLException ex) {
            Logger.getLogger(DBGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return result;
    }
    
}
