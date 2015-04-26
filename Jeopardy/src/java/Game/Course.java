/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Game;

/**
 * 
 * @author ahinojosa
 * This class should be called Classe, but for Java nature we changed
 * the name.
 */
public class Course {
    private int id;
    private String name;

    public Course(int i, String n){
        this.id = i;
        this.name = n;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }
    

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }
    
    
}
