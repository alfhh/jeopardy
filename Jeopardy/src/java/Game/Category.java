/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Game;

/**
 *
 * @author ahinojosa
 */
public class Category {
    private int id;
    private String name;
    private int fk_class;
    
    public Category(int id, String n, int c){
        this.id = id;
        this.name = n;
        this.fk_class = c;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getFk_class() {
        return fk_class;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setFk_class(int fk_class) {
        this.fk_class = fk_class;
    }
    
    
}
