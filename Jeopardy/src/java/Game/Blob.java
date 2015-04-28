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
public class Blob {
    
    private int Id;
    private String date;
    private int fk_prof;
    private int fk_group;
    private int type;
    private int points;

    public Blob(int Id, String date, int fk_prof, int fk_group, int type, int points) {
        this.Id = Id;
        this.date = date;
        this.fk_prof = fk_prof;
        this.fk_group = fk_group;
        this.type = type;
        this.points = points;
    }

    public int getId() {
        return Id;
    }

    public String getDate() {
        return date;
    }

    public int getFk_prof() {
        return fk_prof;
    }

    public int getFk_group() {
        return fk_group;
    }

    public int getType() {
        return type;
    }

    public int getPoints() {
        return points;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setFk_prof(int fk_prof) {
        this.fk_prof = fk_prof;
    }

    public void setFk_group(int fk_group) {
        this.fk_group = fk_group;
    }

    public void setType(int type) {
        this.type = type;
    }

    public void setPoints(int points) {
        this.points = points;
    }
    
    
    
}
