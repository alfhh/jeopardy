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
public class Team {
    private String name;
    private int puntaje;
    private int turno;
    private int id;

    public Team(String name, int puntaje, int turno, int id) {
        this.name = name;
        this.puntaje = puntaje;
        this.turno = turno;
        this.id = id;
    }

    public Team() {
        this.name = "";
        this.puntaje = 0;
        this.turno = 0;
        this.id = 0;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(int puntaje) {
        this.puntaje = puntaje;
    }

    public int getTurno() {
        return turno;
    }

    public void setTurno(int turno) {
        this.turno = turno;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
}
