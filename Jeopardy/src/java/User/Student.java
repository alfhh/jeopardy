/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

/**
 *
 * @author enriqueohernandez
 */
public class Student {
    private String fname;
    private String lname;
    private int number;
    private int points;
    private String teamName;
    private int game;
    private int IdS;

    public Student(String fname, String lname, int number, int points, String teamName, int game, int IdS) {
        this.fname = fname;
        this.lname = lname;
        this.number = number;
        this.points = points;
        this.teamName = teamName;
        this.game = game;
        this.IdS = IdS;
    }

    public Student() {
        this.fname = "";
        this.lname = "";
        this.number = 0;
        this.points = 0;
        this.teamName = "";
        this.game = 0;
        this.IdS = 0;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public int getGame() {
        return game;
    }

    public void setGame(int game) {
        this.game = game;
    }

    public int getIdS() {
        return IdS;
    }

    public void setIdS(int IdS) {
        this.IdS = IdS;
    }
    
    
    
}
