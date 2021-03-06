/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;

import User.Professor;
import User.Student;
import User.Team;
import Game.Blob;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author enriqueohernandez
 */
//https://github.com/MNoya/CloudDataBase/blob/master/JDBCTutorial/src/com/oracle/tutorial/jdbc/StoredProcedureJavaDBSample.java
public class DBHandler {

    private static Connection connection;

    public DBHandler() {
        try {
          
            connection = DriverManager.getConnection("jdbc:mysql://104.131.19.102:3306/jeopardy", "root", "hinojosar00t");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * The function saves into Professor the attributes from the Database.
     * 
     * @param prof
     * @return boolean
     */
    public static boolean getLogin(Professor prof) {
        boolean valid = false;
        String email = prof.getEmail();
        String password = prof.getPassword();
        try {
            Statement statement = connection.createStatement();

            ResultSet results = statement.executeQuery("SELECT * FROM Professors where email='"+email+"' AND password='"+password+"'");

            if (results.next()) {
                prof.setId(Integer.parseInt(results.getString(1)));
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
         if(!valid){
             try {
                Statement statement2 = connection.createStatement();
                ResultSet results2 = statement2.executeQuery("SELECT * FROM Professors WHERE email='"+email+"'");
                if (results2.next()) {
                    prof.setId(Integer.parseInt(results2.getString(1)));
                    prof.setFname(results2.getString(2));
                    prof.setLname(results2.getString(3));
                    prof.setStatus(Integer.parseInt(results2.getString(5)));
                    prof.setTries(Integer.parseInt(results2.getString(6)));
                    
                }
                statement2.close();
              } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
         return valid;   
    }/**
     * The function changes the password of the Professor
     * @param prof
     * @param newPass
     * @return boolean
     */
     public static boolean changePass(Professor prof, String newPass) {
             boolean valid = false;
        try {
            Statement statement = connection.createStatement();
            String email = prof.getEmail();
            String password = prof.getPassword();
            String query = "UPDATE Professors SET password = '"+newPass+"' WHERE Id= '"+prof.getId()+"'";
            statement.executeUpdate(query);
            statement.close();
            valid =true;
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;

    }
     /**
      * The function changes the status of the professor
      * @param prof
      * @param status
      * @return boolean
      */
     public static boolean changeStatus (Professor prof, int status) {
             boolean valid = false;
        try {
            Statement statement = connection.createStatement();
            String email = prof.getEmail();
            String password = prof.getPassword();
            String query = "UPDATE Professors SET status = "+status+"  WHERE Id= '"+prof.getId()+"'";
            statement.executeUpdate(query);
            statement.close();
            valid =true;
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;
    }/**
     * The function changes the tries of the Professor
     * @param prof
     * @param tries
     * @return 
     */
     public static boolean changeTries (Professor prof, int tries) {
             boolean valid = false;
        try {
            Statement statement = connection.createStatement();
            String email = prof.getEmail();
            String password = prof.getPassword();
            String query = "UPDATE Professors SET tries = "+tries+" WHERE Id= '"+prof.getId()+"'";
            statement.executeUpdate(query);
            statement.close();
            valid =true;
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;
    }
     /**
      * The function changes the tries of the Professor
      * @param prof
      * @return boolean
      */
     public static boolean getTries (Professor prof) {
             boolean valid = false;
        try {
            Statement statement = connection.createStatement();
            String email = prof.getEmail();
            String password = prof.getPassword();
            int tries  = 0;
            String query = "SELECT tries FROM Professors WHERE Id= '"+prof.getId()+"'";
            ResultSet results = statement.executeQuery(query);
            if (results.next()) {
                valid = true;
               tries = Integer.parseInt(results.getString(1));
               prof.setTries(tries);
            }
            statement.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;
    }
     /**
      * Insert a professor
      * @param email
      * @param password
      * @param name
      * @param last
      * @return boolean
      */
     public static boolean insertProfessor (String email, String password, String name, String last) {
             boolean valid = false;
        try {
            Statement statement = connection.createStatement();
                    
            String query = "insert into Professors (fname, lname, password, status, tries, email) values ('" + name + "','" + last + "','" + password + "','" + 1 + "','" + 0 + "','" + email + "')";
            statement.executeUpdate(query);
            statement.close();
            valid =true;
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;
    }
     /**
      * Get history from specific professor
      * @param prof
      * @return 
      */
     public static ArrayList getAllHistory (Professor prof) {
             //boolean valid = false;      
        ArrayList list = new ArrayList();
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery(
       "SELECT s.fname, s.lname, s.number, \n" +
"t.points, t.name as 'team name', \n" +
"g.Id as 'game', s.Id\n" +
"from Students as s\n" +
"join student_team as st on s.Id = st.fk_student\n" +
"join Teams as t on t.Id = st.fk_team\n" +
"join Games as g on t.fk_game = g.Id\n" +
"where g.fk_prof = "+prof.getId()+"");
             
            while (results.next()) {
                String fname=results.getString(1);
                String lname=results.getString(2);
                int number=Integer.parseInt(results.getString(3));
                int point=Integer.parseInt(results.getString(4));
                String teamName=results.getString(5);
                int game=Integer.parseInt(results.getString(6));
                int Ids=Integer.parseInt(results.getString(7));
                 
                Student stu = new Student(fname,lname,number,point,teamName,game,Ids,"");
                list.add(stu);
            }
            statement.close();
             
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
     }
     /**
      * Get history from specific student
      * @param numberId
      * @return 
      */
     public static ArrayList getHistoryStudent (int numberId) {
             //boolean valid = false;      
        ArrayList list = new ArrayList();
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery(
       "select s.fname, s.lname, s.number, t.points, g.playedDate, t.name, g.fk_prof\n" +
"from Students as s\n" +
"join student_team as st on s.Id = st.fk_student\n" +
"join Teams as t on t.Id = st.fk_team\n" +
"join Games as g on g.Id = t.fk_game\n" +
"where s.number = "+numberId+"");
             
            while (results.next()) {
                String fname=results.getString(1);
                String lname=results.getString(2);
                int number=Integer.parseInt(results.getString(3));
                int point=Integer.parseInt(results.getString(4));
                String date = results.getString(5);
                String teamName=results.getString(6);
                int profnum = Integer.parseInt(results.getString(7));
                //int game=Integer.parseInt(results.getString(6));
                //int Ids=Integer.parseInt(results.getString(7));
                 
                Student stu = new Student(fname,lname,number,point,teamName,0,0, date);
                list.add(stu);
            }
            statement.close();
             
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
     }
     /**
      * Insert new student
      * @param name
      * @param last
      * @param number
      * @return boolean
      */
     public static boolean insertStudent (String name, String last, String number) {
             boolean valid = false;
        try {
            Statement statement = connection.createStatement();
                    
            String query = "insert into Students (fname, lname, number) values ('" + name + "','" + last + "','" + number + "')";
            statement.executeUpdate(query);
            statement.close();
            valid =true;
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;
    }/**
     * Updates a course informations
     * @param id
     * @param column
     * @param oldvalue
     * @param newValue
     * @return 
     */
     public static boolean updateCourse (String id, String column, String oldvalue, String newValue) {
             boolean valid = false;
        try {
            Statement statement = connection.createStatement();
                    //UPDATE registrados SET $nombreColumna= '$valorNuevo' WHERE $nombreColumna = '$valorViejo' AND id = '$id'"
            String query = "UPDATE Classes SET " +column +" = '"+newValue+"' WHERE " + column+ "= '"+oldvalue+"' AND Id= '"+id+"'";
            System.out.println(query);
            statement.executeUpdate(query);
            statement.close();
            valid =true;
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;
    }
     /**
      * Deletes a specific course
      * @param id
      * @return 
      */
     public static boolean deleteCourse (String id) {
             boolean valid = false;
        try {
            Statement statement = connection.createStatement();
                    //UPDATE registrados SET $nombreColumna= '$valorNuevo' WHERE $nombreColumna = '$valorViejo' AND id = '$id'"
            String query = "DELETE FROM Classes WHERE Id ="+id+" LIMIT 1";
            System.out.println(query);
            statement.executeUpdate(query);
            statement.close();
            valid =true;
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;
    }/**
     * adds a new empty course
     * @return 
     */
     public static boolean addCourse () {
             boolean valid = false;
        try {
            Statement statement = connection.createStatement();
            String query = "INSERT into Classes (name) VALUES ('name')";
            System.out.println(query);
            statement.executeUpdate(query);
            statement.close();
            valid =true;
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;
    }
     /**
      * Updates a specific category according to its id and the Course id
      * @param id
      * @param column
      * @param oldvalue
      * @param newValue
      * @param idsup
      * @return 
      */
     public static boolean updateCategory (String id, String column, String oldvalue, String newValue, String idsup) {
             boolean valid = false;
        try {
            Statement statement = connection.createStatement();
                    //UPDATE registrados SET $nombreColumna= '$valorNuevo' WHERE $nombreColumna = '$valorViejo' AND id = '$id'"
            String query = "UPDATE Categories SET " +column +" = '"+newValue+"' WHERE " + column+ "= '"+oldvalue+"' AND Id= '"+id+"' AND fk_class ='"+idsup+"'";
            System.out.println(query);
            statement.executeUpdate(query);
            statement.close();
            valid =true;
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;
    }
     /**
      * Deletes a specific category according to its id and its class id
      * @param idClass
      * @param idCategory
      * @return 
      */
     public static boolean deleteCategory (String idClass, String idCategory) {
             boolean valid = false;
        try {
            Statement statement = connection.createStatement();
                    //UPDATE registrados SET $nombreColumna= '$valorNuevo' WHERE $nombreColumna = '$valorViejo' AND id = '$id'"
            String query = "DELETE FROM Categories WHERE Id ="+idCategory+" AND fk_class= "+idClass+" LIMIT 1";
            System.out.println(query);
            statement.executeUpdate(query);
            statement.close();
            valid =true;
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;
    }
     /**
      * adds a new empty category according to its class id
      * @param idClass
      * @return 
      */
     public static boolean addCategory (String idClass) {
             boolean valid = false;
        try {
            Statement statement = connection.createStatement();
            String query = "INSERT into Categories (name,fk_class) VALUES ('name','"+idClass+"')";
            System.out.println(query);
            statement.executeUpdate(query);
            statement.close();
            valid =true;
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;
    }
     /**
      * Updates a specific question according to its id, category id and class id
      * @param id
      * @param column
      * @param oldvalue
      * @param newValue
      * @param idsup
      * @return 
      */
      public static boolean updateSquare (String id, String column, String oldvalue, String newValue, String idsup) {
             boolean valid = false;
        try {
            Statement statement = connection.createStatement();
                    //UPDATE registrados SET $nombreColumna= '$valorNuevo' WHERE $nombreColumna = '$valorViejo' AND id = '$id'"
            String query = "UPDATE Squares SET " +column +" = '"+newValue+"' WHERE " + column+ "= '"+oldvalue+"' AND Id= '"+id+"' AND fk_category ='"+idsup+"'";
            System.out.println(query);
            statement.executeUpdate(query);
            statement.close();
            valid =true;
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;
    }
      /**
       * deletes a specific question according to its id, category id and class id
       * @param idCategory
       * @param idQuestion
       * @return 
       */
       public static boolean deleteSquare (String idCategory, String idQuestion){//(String idClass, String idCategory) {
             boolean valid = false; //idCategory, idQuestion
        try {
            Statement statement = connection.createStatement();
                    //UPDATE registrados SET $nombreColumna= '$valorNuevo' WHERE $nombreColumna = '$valorViejo' AND id = '$id'"
            String query = "DELETE FROM Squares WHERE Id ="+idQuestion+" AND fk_category= "+idCategory+" LIMIT 1";
            System.out.println(query);
            statement.executeUpdate(query);
            statement.close();
            valid =true;
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;
    }
       /**
        * adds a new empty question according to its id, category id and class id
        * @param idCategory
        * @return 
        */
       public static boolean addSquare (String idCategory) {
             boolean valid = false;
        try {
            Statement statement = connection.createStatement();
            String query = "INSERT into Squares (question,hint,points,fk_category) VALUES ('question','hint',0,'"+idCategory+"')";
            System.out.println(query);
            statement.executeUpdate(query);
            statement.close();
            valid =true;
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return valid;
    }
     //updateSquare
       
       
       public static void addTeamHistory (int fkProf, int type, int fkG, int score) {
           
           DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	   Date date = new Date();
           
        try {
            Statement statement = connection.createStatement();
            String query = "INSERT into Histories (playedDate, fk_prof, fk_group, type, points) VALUES ('"+dateFormat.format(date)+"',"+fkProf+", "+fkG+", "+type+", "+score+")";
            System.out.println(query);
            statement.executeUpdate(query);
            statement.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
       
       
    public static ArrayList getHTeams (int idProf) {
        ArrayList resultado = new ArrayList();
        try {
            Statement statement = connection.createStatement();

            String query = "select * from Histories where fk_prof= "+idProf+" and type = 0";
            ResultSet results = statement.executeQuery(query);
            while (results.next()) {
               int id = Integer.parseInt(results.getString(1));
               String date = results.getString(2);
               int group = Integer.parseInt(results.getString(4));
               int type = Integer.parseInt(results.getString(5));
               int points = Integer.parseInt(results.getString(6));
               Blob b = new Blob(id, date, idProf, group, type, points);
               resultado.add(b);
            }
            statement.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return resultado;
    }
    
        public static ArrayList getHStudents (int idProf) {
        ArrayList resultado = new ArrayList();
        try {
            Statement statement = connection.createStatement();

            String query = "select * from Histories where fk_prof= "+idProf+" and type = 1";
            ResultSet results = statement.executeQuery(query);
            while (results.next()) {
               int id = Integer.parseInt(results.getString(1));
               String date = results.getString(2);
               int group = Integer.parseInt(results.getString(4));
               int type = Integer.parseInt(results.getString(5));
               int points = Integer.parseInt(results.getString(6));
               System.out.println("Guardado " + id);
               Blob b = new Blob(id, date, idProf, group, type, points);
               resultado.add(b);
            }
            statement.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return resultado;
    }
        
        public static String getSNamse (int id) {
        String c = "";
            try {
            Statement statement = connection.createStatement();

            String query = "select fname, lname from Students where Id= "+id+"";
            ResultSet results = statement.executeQuery(query);
            if (results.next()) {
               String a = results.getString(1);
               String b = results.getString(2);
                c = a + " " + b;
            }
            statement.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return c;
    }
        
            public static String getTNamse (int id) {
        String c = "";
            try {
            Statement statement = connection.createStatement();

            String query = "select name from Groups where Id= "+id+"";
            ResultSet results = statement.executeQuery(query);
            if (results.next()) {
               c = results.getString(1);
            }
            statement.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
         return c;
    }
     
  

}
