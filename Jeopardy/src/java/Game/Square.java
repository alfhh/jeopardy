/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Game;

/**
 *
 * @author mrquorr
 */
public class Square {
    private int score;
    private String question;
    private String hint;

    public Square(int i, String m, String n){
        this.score = i;
        this.question = m;
        this.hint = n;
    }

    public int getScore() {
        return score;
    }

    public String getQuestion() {
        return question;
    }

    public String getHint() {
        return hint;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public void setHint(String hint) {
        this.hint = hint;
    }
    
    
}
